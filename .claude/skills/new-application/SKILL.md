---
name: new-application
description: |
  Scaffold a new job/program application folder with pre-filled templates. Use this skill whenever the user mentions starting a new application, applying to a company/program, setting up application materials, or wants to track a new opportunity. Trigger for phrases like "new application", "apply to [company]", "set up [program] application", "scaffold application", "start application for", "add [company] to applications", or /new-application.
---

# New Application Scaffolder

Scaffold a new application folder following repo conventions.

## Step 1: Gather Information

Extract from the user's message or ask:
- **Company name** and **program name** (required)
- Deadline, URL, location (if provided)

## Step 2: Create Folder

Convert names to kebab-case slugs (e.g., "Morgan Stanley" -> `morgan-stanley`, "Tech Spring Insight" -> `tech-spring-insight`). Use common abbreviations where natural (BofA -> `bofa`, HRT -> `hrt`).

```
applications/{company-slug}/{program-slug}/
```

## Step 3: Read CV Data

Read from the most relevant CV variant (`curriculum_vitae/swe/`, `quant/`, or `ib-sales-consulting/`) to understand the user's background for pre-filling.

## Step 4: Create Files

### `application-responses.md`

```markdown
# {Company} -- {Program}

| | |
|---|---|
| Deadline | {deadline or TBC} |
| Location | {location or TBC} |
| URL | {url or TBC} |
| CV variant | `{swe or quant or ib-sales-consulting}` |

## Eligibility

| Requirement | Evidence |
|---|---|
| {e.g., "Penultimate year"} | {from CV data} |
| {e.g., "Quantitative degree"} | {from CV data} |

## Questions

### Q1: {title or "TBC"}
TODO
```

Pre-fill eligibility from CV data.

### `notes.md`

```markdown
# {Company} -- Notes

## Status
- [ ] Researched
- [ ] Applied ({deadline})
- [ ] Response received
- [ ] Interview
- [ ] Outcome:

## Research
TODO
```

### `cover-letter.txt`

```
TODO -- run /cover-letter for a brief
```

## Step 5: Print Summary

```
Scaffolded: applications/{company-slug}/{program-slug}/

Next: research the company, fill in questions, write cover letter.
```
