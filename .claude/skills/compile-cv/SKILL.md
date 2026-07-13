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
   - A direct file path (e.g., `curriculum_vitae/resume.tex`)
   - A directory path (look for `resume.tex` inside it)
   - An application folder (e.g., `applications/internships/example-corp/summer-internship/cv/resume.tex`)

2. Check xelatex is installed:
   ```bash
   which xelatex
   ```
   If missing, tell the user to (re)open the repo in the dev container (`.devcontainer/`), where the LaTeX toolchain is pre-installed, or to install it manually with `sudo apt-get install -y texlive-xetex texlive-latex-extra texlive-fonts-extra fonts-roboto fontconfig`. Then stop.

3. Compile from the directory containing the .tex file:
   ```bash
   cd <directory> && xelatex -file-line-error -halt-on-error -interaction=nonstopmode <filename>.tex
   ```

4. Check that the output PDF exists. Report file size.
   If compilation failed, show the relevant error lines from the xelatex log output.

## Notes

- xelatex is required (not pdflatex) because awesome-cv uses custom fonts.
- The master CV is `curriculum_vitae/resume.tex`, which `\input`s the section files in `curriculum_vitae/cv/`.
- Per-application CVs live in their application folder's `cv/` subfolder (a pruned copy of the master), each with their own `resume.tex`.
