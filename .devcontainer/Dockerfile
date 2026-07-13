# syntax=docker/dockerfile:1
#
# Image for the Applications Repo: LaTeX (xelatex/awesome-cv) + Python (PyMuPDF) + Node 20 + Claude Code.
#
# Heavy, deterministic deps are baked HERE (cached across rebuilds). Network-dependent, optional steps
# (Playwright browser, plugin clones) run later in post-create.sh so a transient failure never breaks the build.
#
# Base: javascript-node:20-bookworm ships Node 20 + the non-root "node" user, so `npm i -g` and
# `pip install` work directly in RUN layers (devcontainer Features run only AFTER the image is built).
FROM mcr.microsoft.com/devcontainers/javascript-node:20-bookworm

ENV DEBIAN_FRONTEND=noninteractive

# --- LaTeX toolchain + Python (single cleaned apt layer) ---
# texlive-xetex        -> xelatex engine + fontspec + unicode-math (awesome-cv requires xelatex)
# texlive-latex-extra  -> tcolorbox[skins], xifthen, xstring, accsupp
# texlive-fonts-extra  -> fontawesome5.sty (used by awesome-cv.cls) + font fallbacks  (do NOT trim this)
# texlive-fonts-recommended -> ZapfDingbats (pzdr.tfm) required by hyperref's \XeTeXLink@font under xelatex (do NOT trim this)
# (texlive-latex-recommended is pulled transitively -> array/tabularx/enumitem/ragged2e/xcolor/etoolbox/...)
# fonts-roboto + fontconfig -> Roboto resolved by name (\setmainfont{Roboto}); fc-cache registers it
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        texlive-xetex \
        texlive-latex-extra \
        texlive-fonts-extra \
        texlive-fonts-recommended \
        fonts-roboto \
        fontconfig \
        python3 \
        python3-pip \
        python3-venv \
    && fc-cache -f \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# --- Python deps (PyMuPDF==1.27.1 for the new-application skill) ---
# Ships a self-contained abi3 manylinux wheel: no compiler, no extra runtime libs.
# --break-system-packages is required: bookworm marks the system Python EXTERNALLY-MANAGED (PEP 668).
COPY requirements.txt /tmp/requirements.txt
RUN pip3 install --no-cache-dir --break-system-packages -r /tmp/requirements.txt \
    && rm -f /tmp/requirements.txt

# --- Claude Code CLI (Node 20 + node user already present) ---
RUN npm install -g @anthropic-ai/claude-code@latest \
    && npm cache clean --force

# --- Seed mount-point ownership so the named volumes attach as node, not root ---
# A fresh named volume inherits ownership from the image path it mounts over; without this, the empty
# ~/.claude volume can mount as root:root and silently break the whole permissions+plugins setup (EACCES).
RUN mkdir -p /commandhistory /home/node/.claude \
    && touch /commandhistory/.bash_history \
    && chown -R node:node /commandhistory /home/node/.claude
ENV HISTFILE=/commandhistory/.bash_history

# CLI reads/writes config from the mounted ~/.claude (also set in devcontainer.json containerEnv).
ENV CLAUDE_CONFIG_DIR=/home/node/.claude

USER node
