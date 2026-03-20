# Compiled CVs

This directory placeholder exists for local development.

## Build Process

When you push changes to `main` that modify files in `curriculum_vitae/`:

1. GitHub Actions compiles the LaTeX files using XeLaTeX
2. Generated PDFs can be pushed to a separate public repository (optional)
3. PDFs are available for download from the Actions artifacts

## Files Generated

- `swe-resume.pdf` - Software Engineering Resume
- `quant-resume.pdf` - Quantitative Finance Resume
- `ib-sales-consulting-resume.pdf` - IB/Sales/Consulting Resume

## Local Compilation

To compile locally:
```bash
cd curriculum_vitae/swe
xelatex resume.tex

cd curriculum_vitae/quant
xelatex resume.tex

cd curriculum_vitae/ib-sales-consulting
xelatex resume.tex
```

PDFs will be generated in each variant's directory.

## Setup

If you haven't installed LaTeX dependencies yet:
```bash
bash install_deps.sh
```
