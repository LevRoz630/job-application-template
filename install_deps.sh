#!/bin/bash
set -eu

# Install all dependencies needed to compile awesome-cv .tex files to PDF via xelatex.

echo "Installing LaTeX dependencies..."
sudo apt-get update -qq
sudo apt-get install -y \
    texlive-xetex \
    texlive-latex-extra \
    texlive-fonts-extra \
    fonts-roboto \
    fontconfig

echo ""
echo "Done. You can now build any resume with:"
echo "  cd <folder-with-resume.tex>"
echo "  xelatex resume.tex"
