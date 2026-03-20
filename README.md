# Job Application Template

Track job applications from your terminal with Claude Code. Scan for openings, scaffold application folders, draft cover letters, and compile LaTeX CVs in multiple variants (SWE, quant, IB/consulting).

## Setup

```bash
git clone https://github.com/YOUR-USERNAME/job-application-template.git
cd job-application-template
pip install -r requirements.txt
bash install_deps.sh  # LaTeX deps for CV compilation
```

Then fill in your details in `curriculum_vitae/data/*.tex` and add your target companies to `target-companies.yaml`.

## Skills

| Skill | What it does |
|---|---|
| `/new-application` | Scaffolds an application folder with `application-responses.md`, `notes.md`, and `cover-letter.txt`. |
| `/cover-letter` | Gives you a brief with angles and ideas (default), or writes a full draft if you ask. |
| `/opportunity-scan` | Checks your watchlist for new openings and writes a report sorted by deadline urgency. |
| `/humanizer` | Runs your text through 24 AI-writing checks from Wikipedia's "Signs of AI writing" guide. |

## How it works

1. Add companies to `target-companies.yaml`
2. Run `/opportunity-scan` to find open programs
3. Run `/new-application` to create the application folder
4. Write your cover letter (use `/cover-letter` for ideas, then write it yourself)
5. Run `/humanizer` before submitting anything

## CV variants

Three LaTeX resume variants under `curriculum_vitae/`. Each has its own `cv/` directory with tailored sections. Shared content (education, skills) lives in `data/`. Compile with `xelatex resume.tex`.

| Variant | For |
|---|---|
| `swe/` | Software engineering — projects, systems, DevOps |
| `quant/` | Quantitative finance — stats, competitions, research |
| `ib-sales-consulting/` | Banking, sales, consulting — client work, leadership |

## Writing quality

`ai-writing-patterns-to-avoid.md` has the full catalog of 24 AI writing patterns with before/after examples. The `/humanizer` skill reads it and does a two-pass rewrite. But honestly, writing the first draft yourself and using `/cover-letter` in brief mode gets better results than generating a draft and trying to de-AI it after.

## License

MIT
