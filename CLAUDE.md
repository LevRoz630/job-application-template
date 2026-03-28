# Applications Repo

Personal repo for career applications. Claude is used for research and opportunity scanning; cover letters are written by hand.

## Structure

- `applications/{company-slug}/{program-slug}/` — one folder per application
  - `application-responses.md` — form questions and answers
  - `cover-letter.txt` — cover letter (written by hand, not AI-generated)
  - `notes.md` — research and prep notes
- `applications/tracker.csv` — application status tracking (company, program, status, dates)
- `curriculum_vitae/` — LaTeX CVs using awesome-cv
  - Variants: `swe/`, `quant/`, `ib-sales-consulting/`
- `target-companies.yaml` — watchlist for `/opportunity-scan`
- `scan-reports/` — output from opportunity scans

## CV Compilation

```
cd curriculum_vitae/<variant>/ && xelatex -file-line-error -halt-on-error -interaction=nonstopmode resume.tex
```

Requires: texlive-xetex, texlive-latex-extra, texlive-fonts-extra, fonts-roboto, fontconfig. Run `bash install_deps.sh` to install.

## Skills

- `/opportunity-scan` — check target companies for new openings
- `/new-application` — scaffold a new application folder
- `/cover-letter` — research brief for writing cover letters
- `/compile-cv <variant>` — compile a CV variant to PDF
