# Job Application Tracker

Structured job application workflow powered by Claude Code skills.

## Project Layout

```
applications/{company-slug}/{programme-slug}/   # One folder per application
    application-responses.md                     # Questionnaire answers
    notes.md                                     # Company research
    cover-letter.txt                             # Cover letter draft
curriculum_vitae/                                # LaTeX CV templates
    data/                                        # Shared CV sections
    swe/                                         # Software engineering variant
    quant/                                       # Quantitative finance variant
    ib-sales-consulting/                         # IB/Sales/Consulting variant
target-companies.yaml                            # Company watchlist
scan-reports/                                    # Opportunity scan outputs
```

## Skills

| Skill | Purpose |
|---|---|
| `/new-application` | Scaffold a new application folder |
| `/cover-letter` | Draft or get feedback on a cover letter |
| `/opportunity-scan` | Scan watchlist for new opportunities |
| `/humanizer` | Remove AI writing patterns from text |

## Conventions

- Company folders use kebab-case slugs (e.g., `goldman-sachs`, `jane-street`)
- Each application contains 3 core files: `application-responses.md`, `notes.md`, `cover-letter.txt`
- CV variants are compiled with XeLaTeX: `cd curriculum_vitae/swe && xelatex resume.tex`
- Cover letters should pass the `/humanizer` skill before submission
- Always check `ai-writing-patterns-to-avoid.md` for writing guidance

## Setup

```bash
# Install Python dependencies
pip install -r requirements.txt

# Install LaTeX dependencies (for CV compilation)
bash install_deps.sh
```
