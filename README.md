# Job Application Template

Track job applications from your terminal with Claude Code. Scaffold application folders, draft cover letters, scan for openings, and compile LaTeX CVs.

## Setup

```bash
pip install -r requirements.txt
bash install_deps.sh  # LaTeX deps for CV compilation
```

Fill in `curriculum_vitae/data/*.tex` with your details and add target companies to `target-companies.yaml`.

## Skills

| Skill | What it does |
|---|---|
| `/new-application` | Scaffold an application folder with templates |
| `/cover-letter` | Generate a brief with angles and ideas (or a full draft if asked) |
| `/opportunity-scan` | Check your watchlist for new openings, sorted by deadline |
| `/compile-cv <variant>` | Compile a LaTeX CV variant to PDF |

## CV Variants

Three resume variants under `curriculum_vitae/`: `swe/`, `quant/`, `ib-sales-consulting/`. Compile with `xelatex resume.tex` from the variant directory.

## License

MIT
