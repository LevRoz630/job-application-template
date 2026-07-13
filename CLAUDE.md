# Applications Repo

Personal repo for career applications. Claude is used for research, opportunity scanning, tailoring CVs, and drafting cover letters.

> **Applicant profile:** record your year of study, degree, target roles, and preferred
> locations here so `/opportunity-scan` and `/cover-letter` can tailor to you. (Template
> placeholder — fill this in.)

## Structure

- `applications/{category}/{company-slug}/{program-slug}/` — one folder per application
  - `category` is one of: `internships`, `competitions`, `miscellaneous`
  - `notes.md` — application metadata, research, eligibility, keywords, and pruning plan (created by `/new-application`)
  - `cv/` — per-application LaTeX CV folder
    - `resume.tex` + `awesome-cv.cls` + `cv/*.tex` (section files pruned from the master)
  - `cover-letter.tex` — sister of `cv/`, created only when `/cover-letter` runs (not scaffolded by default)
- `curriculum_vitae/` — master CV (single source of truth)
  - `resume.tex` + `awesome-cv.cls` + `cv/`
  - `cover-letter-template.tex` — canonical cover letter template; `/cover-letter` copies it into the application folder
  - Multi-page reservoir holding every experience, project, honor, etc. Never submitted as-is.
  - One canonical bullet per role. No alternative phrasings kept in-file.
- `applications/spring-{year}-tracker.csv` — spring-week / insight-day application status
- `applications/summer-{year}-tracker.csv` — summer-internship application status
- `target-companies.yaml` — watchlist for `/opportunity-scan`
- `scan-reports/` — output from opportunity scans

## Per-Application CV Workflow

`/new-application` copies `curriculum_vitae/` wholesale into the application's `cv/` subfolder. Per-application work is **pruning**: drop irrelevant roles, reorder for emphasis, rewrite bullets where the JD calls for it. Research runs first — pruning decisions are driven by the JD and the keyword list captured in `notes.md`.

## CV Compilation

Master:
```
cd curriculum_vitae/ && xelatex -file-line-error -halt-on-error -interaction=nonstopmode resume.tex
```

Per-application:
```
cd applications/<category>/<company>/<program>/cv/ && xelatex -file-line-error -halt-on-error -interaction=nonstopmode resume.tex
```

Cover letter (when present):
```
cd applications/<category>/<company>/<program>/ && xelatex -file-line-error -halt-on-error -interaction=nonstopmode cover-letter.tex
```

Requires: `texlive-xetex`, `texlive-latex-extra`, `texlive-fonts-extra`, `fonts-roboto`, `fontconfig`. The dev container (`.devcontainer/`) installs these automatically.

## House Style

`--` not em dashes. Real data only — `TBC` for unknown facts, `TODO` for sections still to research. Never invent a claim the CV can't back. Run drafted answers and letters through `/humanizer` before shipping.

## Skills

- `/new-application` — scaffold a new application folder (research → copy master CV → tracker row)
- `/cover-letter` — draft a cover letter (creates `cover-letter.tex` from the master template, only when invoked)
- `/compile-cv <path>` — compile a `resume.tex` to PDF
- `/opportunity-scan` — check target companies for new openings
- `/humanizer` — scan drafted answers/letters for AI-writing tells and rewrite them out
