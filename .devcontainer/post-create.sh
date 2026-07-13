#!/usr/bin/env bash
#
# post-create.sh — one-time setup after the container is created (runs as the 'node' user).
#
# Responsibilities:
#   1. Ensure the USER-level ~/.claude/settings.json turns OFF all permission prompts (bypassPermissions)
#      and skips the dangerous-mode disclaimer. Kept here, NOT in the committed repo .claude/settings.json,
#      so the "bypass everything" mode never travels with the repo. Merged in (existing keys preserved).
#   2. Point git at the repo's .githooks (the secret-scanning pre-commit hook).
#   3. Register the official plugin marketplace and install (= auto-enable) the 4 plugins at --scope user.
#   4. Download the Playwright Chromium browser for the playwright plugin.
#   5. Sanity-check the toolchain.
#
# Idempotent: safe to re-run on every rebuild. Steps that depend on the network (plugin clone, browser
# download) are NON-FATAL and logged — the container always comes up even if they fail.
set -uo pipefail

log() { printf '[post-create] %s\n' "$*"; }

# CLAUDE_CONFIG_DIR is exported by the container (containerEnv) and points at the persisted ~/.claude volume.
CFG="${CLAUDE_CONFIG_DIR:-$HOME/.claude}"
MARKETPLACE="claude-plugins-official"
MARKETPLACE_REPO="anthropics/claude-plugins-official"
PLUGINS=(claude-code-setup playwright superpowers claude-md-management)

# ---------------------------------------------------------------------------
# 1. No-prompt Claude settings (merge, don't clobber — preserves any other user keys).
# ---------------------------------------------------------------------------
log "Ensuring no-prompt Claude settings in ${CFG}/settings.json"
mkdir -p "${CFG}"
python3 - "${CFG}/settings.json" <<'PY'
import json, sys
path = sys.argv[1]
try:
    with open(path) as f:
        cfg = json.load(f)
    if not isinstance(cfg, dict):
        cfg = {}
except (FileNotFoundError, json.JSONDecodeError):
    cfg = {}
perms = cfg.get("permissions")
if not isinstance(perms, dict):
    perms = {}
perms["defaultMode"] = "bypassPermissions"
cfg["permissions"] = perms
cfg["skipDangerousModePermissionPrompt"] = True
with open(path, "w") as f:
    json.dump(cfg, f, indent=2)
    f.write("\n")
print("[post-create]   merged: permissions.defaultMode=bypassPermissions + skipDangerousModePermissionPrompt")
PY

# ---------------------------------------------------------------------------
# 2. Make the repo's secret-scanning git hook actually fire.
# ---------------------------------------------------------------------------
if git rev-parse --git-dir >/dev/null 2>&1; then
  if git config core.hooksPath .githooks 2>/dev/null; then
    log "Enabled repo git hooks (.githooks/pre-commit secret guard)"
  else
    log "WARN: could not set core.hooksPath (non-fatal)."
  fi
fi

# ---------------------------------------------------------------------------
# 3. Register marketplace, then install (auto-enables) the plugins at user scope.
#    `marketplace add` clones the repo the installer reads, so it must precede install.
#    `</dev/null` keeps everything headless; both are network-dependent -> non-fatal.
# ---------------------------------------------------------------------------
if command -v claude >/dev/null 2>&1; then
  log "Registering plugin marketplace: ${MARKETPLACE_REPO}"
  claude plugin marketplace add "${MARKETPLACE_REPO}" </dev/null 2>&1 \
    || log "WARN: marketplace add failed (network?). Re-run this script later to finish plugin setup."

  ok=0
  for p in "${PLUGINS[@]}"; do
    log "Installing plugin: ${p}@${MARKETPLACE}"
    if claude plugin install "${p}@${MARKETPLACE}" --scope user </dev/null 2>&1; then
      ok=$((ok + 1))
    else
      log "WARN: install of ${p} failed. Re-run: claude plugin install ${p}@${MARKETPLACE} --scope user"
    fi
  done
  log "Plugins installed: ${ok}/${#PLUGINS[@]}"
else
  log "WARN: 'claude' CLI not found on PATH; skipped plugin setup."
fi

# ---------------------------------------------------------------------------
# 4. Playwright Chromium for the playwright plugin (~150 MB download). Non-fatal.
# ---------------------------------------------------------------------------
log "Installing Playwright Chromium (non-fatal)"
if npx --yes playwright install --with-deps chromium </dev/null 2>&1; then
  log "Playwright Chromium installed."
else
  log "WARN: Playwright browser install failed (offline/transient). Re-run: npx playwright install --with-deps chromium"
fi

# ---------------------------------------------------------------------------
# 5. Toolchain sanity check (informational; never fails the create).
# ---------------------------------------------------------------------------
log "Toolchain check:"
if command -v xelatex >/dev/null 2>&1; then
  log "  xelatex : $(xelatex --version 2>/dev/null | head -n1)"
else
  log "  WARN: xelatex not found on PATH."
fi
log "  python3 : $(python3 --version 2>&1)"
python3 -c 'import pymupdf; print("[post-create]   PyMuPDF :", getattr(pymupdf, "__version__", getattr(pymupdf, "VersionBind", "?")))' 2>/dev/null \
  || log "  WARN: PyMuPDF import failed."
log "  node    : $(node --version 2>&1)"
command -v claude >/dev/null 2>&1 && log "  claude  : $(claude --version 2>&1 | head -n1)"

log "Done. Run 'claude' — folder trust is auto-accepted (CLAUDE_CODE_SANDBOXED) and bypassPermissions is the default mode, so no prompts."
exit 0
