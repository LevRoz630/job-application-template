# Job Application Template

A structured system for managing job applications using [Claude Code](https://claude.ai/claude-code) skills. Track applications, draft cover letters, scan for opportunities, and maintain multiple CV variants -- all from your terminal. Each skill automates a specific part of the application workflow while keeping you in control of the final output.

## Use This Template

1. **Fork or clone** this repository
2. Fill in your personal details in the CV templates under `curriculum_vitae/`
3. Update `target-companies.yaml` with companies you want to track
4. Start applying with `/new-application`

```bash
git clone https://github.com/YOUR-USERNAME/job-application-template.git
cd job-application-template
pip install -r requirements.txt
bash install_deps.sh  # LaTeX dependencies for CV compilation
```

## Directory Structure

```
job-application-template/
|-- .claude/skills/              # Claude Code skills (4 total)
|-- .github/workflows/           # CI/CD for LaTeX compilation
|-- applications/                # One folder per application
|   |-- example-corp/
|   |   |-- summer-internship/
|   |   |   |-- application-responses.md
|   |   |   |-- notes.md
|   |   |   |-- cover-letter.txt
|-- curriculum_vitae/            # LaTeX CV system
|   |-- data/                    # Shared sections (education, experience, etc.)
|   |-- swe/                     # Software engineering variant
|   |-- quant/                   # Quantitative finance variant
|   |-- ib-sales-consulting/     # IB / Sales / Consulting variant
|-- scan-reports/                # Opportunity scan outputs
|-- target-companies.yaml        # Company watchlist
|-- ai-writing-patterns-to-avoid.md
|-- CLAUDE.md                    # Project instructions for Claude Code
|-- requirements.txt
|-- install_deps.sh
```

## Setup

### Python Dependencies

```bash
pip install -r requirements.txt
```

### LaTeX Dependencies (for CV compilation)

```bash
bash install_deps.sh
```

This installs `texlive-xetex`, `texlive-latex-extra`, `texlive-fonts-extra`, `fonts-roboto`, and `fontconfig`.

### Compile a CV

```bash
cd curriculum_vitae/swe
xelatex resume.tex
```

## Skills Reference

| Skill | Command | What It Does |
|---|---|---|
| **New Application** | `/new-application` | Creates a new application folder with `application-responses.md`, `notes.md`, and `cover-letter.txt` pre-filled from your CV data |
| **Cover Letter** | `/cover-letter` | Generates a cover letter brief (default) or full draft. Briefs give you angles and ideas; drafts use anti-AI-detection writing patterns |
| **Opportunity Scan** | `/opportunity-scan` | Scans your watchlist companies for new openings (spring weeks, internships, insight days) and generates a prioritized report |
| **Humanizer** | `/humanizer` | Removes 24 documented AI writing patterns from text (see `ai-writing-patterns-to-avoid.md`). Run this on cover letters before submitting |

## Getting Started

### 1. Configure your watchlist

Edit `target-companies.yaml` to add companies you want to track:

```yaml
- name: Example Company
  slug: example-company
  type: tech
  careers_url: https://example.com/careers/
  interests:
    - summer-internship
    - graduate-programme
  priority: high
  notes: "Applications typically open Sep-Nov."
```

### 2. Scan for opportunities

```
/opportunity-scan
```

This checks your watchlist companies for current openings and generates a report in `scan-reports/`.

### 3. Scaffold a new application

```
/new-application
```

Provide the company name and program, and the skill creates a ready-to-fill application folder.

### 4. Write your cover letter

```
/cover-letter
```

Generates a brief with angles and ideas. Write the letter yourself for best results (AI detectors are real). If you need a full draft, ask explicitly, then run `/humanizer` on it.

## CV Variants

Three CV variants are included, each emphasizing different aspects of your background:

| Variant | Best For | Emphasis |
|---|---|---|
| `swe/` | Software engineering roles | Technical projects, systems, DevOps |
| `quant/` | Quantitative finance / trading | Statistical methods, competitions, research |
| `ib-sales-consulting/` | Investment banking, sales, consulting | Client impact, leadership, business acumen |

Each variant has its own `cv/` subdirectory with tailored section files. Shared content lives in `data/`. Edit the variant-specific files to customize for each role type.

## Writing Quality

Cover letters and application responses are checked against `ai-writing-patterns-to-avoid.md`, which documents all 24 AI writing patterns from Wikipedia's "Signs of AI writing" guide with before/after examples.

The `/humanizer` skill reads that reference and performs a two-pass revision to catch and fix remaining tells.

Best practice: write the first draft yourself using the `/cover-letter` brief, then use `/humanizer` to clean up any AI-sounding patterns that crept in during editing.

## License

MIT
