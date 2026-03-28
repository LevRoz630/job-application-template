---
name: compile-cv
description: |
  Compile a LaTeX .tex file to PDF using xelatex. Use when the user wants to build,
  compile, or generate a resume/CV PDF. Trigger for /compile-cv, "build my CV",
  "compile resume", "compile this tex file", "generate PDF".
disable-model-invocation: true
allowed-tools:
  - Bash
  - Read
---

# Compile CV

Compile a LaTeX file to PDF using xelatex.

## Usage

The user provides a path to a `.tex` file or a directory containing `resume.tex`. If no path is given, ask what to compile.

## Steps

1. Determine the target `.tex` file from the user's message. Accept:
   - A direct file path (e.g., `curriculum_vitae/swe/resume.tex`)
   - A directory path (look for `resume.tex` inside it)
   - A variant name like "swe" or "quant" (resolve to `curriculum_vitae/<name>/resume.tex`)
   - An application folder (e.g., `applications/bofa/swe-insight-dublin/resume.tex`)

2. Check xelatex is installed:
   ```bash
   which xelatex
   ```
   If missing, tell the user to run `bash install_deps.sh` from the repo root and stop.

3. Compile from the directory containing the .tex file:
   ```bash
   cd <directory> && xelatex -file-line-error -halt-on-error -interaction=nonstopmode <filename>.tex
   ```

4. Check that the output PDF exists. Report file size.
   If compilation failed, show the relevant error lines from the xelatex log output.

## Notes

- xelatex is required (not pdflatex) because awesome-cv uses custom fonts.
- The main CV variants are in `curriculum_vitae/` (swe, quant, ib-sales-consulting, data).
- Some application folders also contain their own `resume.tex` files.
