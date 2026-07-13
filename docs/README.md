# Compiled CVs

Local build output directory for compiled PDFs. CVs are compiled on demand with
xelatex — there is no CI build step.

## Build

Master CV:

```bash
cd curriculum_vitae/
xelatex -file-line-error -halt-on-error -interaction=nonstopmode resume.tex
```

Per-application CV:

```bash
cd applications/<category>/<company>/<program>/cv/
xelatex -file-line-error -halt-on-error -interaction=nonstopmode resume.tex
```

Or use the `/compile-cv <path>` skill, which resolves the target and reports the
output PDF size.

## Dependencies

The dev container (`.devcontainer/`) installs the LaTeX toolchain automatically.
Manual install:

```bash
sudo apt-get install -y texlive-xetex texlive-latex-extra texlive-fonts-extra fonts-roboto fontconfig
```

xelatex (not pdflatex) is required because awesome-cv uses custom fonts. Build
artifacts (`*.aux`, `*.log`, generated `*.pdf`, …) are gitignored.
