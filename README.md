# Job Application Template

Track job and program applications from your terminal with Claude Code. Scaffold
application folders, tailor a master CV per role, draft cover letters, scan for
openings, and compile LaTeX CVs.

## Setup

The repo ships with a dev container (`.devcontainer/`) that installs the Python and
LaTeX toolchain and wires up Claude Code. Open the folder in the container ("Reopen in
Container") and you're ready.

Manual setup instead:

```bash
pip install -r requirements.txt
sudo apt-get install -y texlive-xetex texlive-latex-extra texlive-fonts-extra fonts-roboto fontconfig
```

Then make it yours:

1. Fill in your details in `curriculum_vitae/resume.tex` and the section files in
   `curriculum_vitae/cv/*.tex` (they ship with `[placeholders]`).
2. Record your applicant profile (year, degree, target roles, location) at the top of
   `CLAUDE.md`.
3. Add companies to watch in `target-companies.yaml`.

## How it works

- **One master CV** lives in `curriculum_vitae/` and is the single source of truth.
- Each application gets a folder under `applications/{category}/{company}/{program}/`.
  `/new-application` copies the master CV in, then you **prune** it to the role.
- Cover letters are drafted from `curriculum_vitae/cover-letter-template.tex` only when
  you ask.

## Skills

| Skill | What it does |
|---|---|
| `/new-application` | Research a company, scaffold the application folder, copy in the master CV, add a tracker row |
| `/cover-letter` | Draft a tailored, STAR-based cover letter into the application folder |
| `/opportunity-scan` | Check your `target-companies.yaml` watchlist for new openings, grouped by deadline |
| `/compile-cv <path>` | Compile a `resume.tex` to PDF with xelatex |
| `/humanizer` | Scan drafted text for AI-writing tells and rewrite them out |

## Compiling a CV

```bash
cd curriculum_vitae/
xelatex -file-line-error -halt-on-error -interaction=nonstopmode resume.tex
```

Or use `/compile-cv curriculum_vitae/resume.tex`. Per-application CVs compile the same
way from their own `cv/` folder.

## License

MIT
