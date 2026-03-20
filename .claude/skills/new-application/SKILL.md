---
name: new-application
description: |
  Scaffold a new job/program application folder with pre-filled templates. Use this skill whenever the user mentions starting a new application, applying to a company/program, setting up application materials, or wants to track a new opportunity. Trigger for phrases like "new application", "apply to [company]", "set up [program] application", "scaffold application", "start application for", "add [company] to applications", or /new-application.
---

# New Application Scaffolder

You are helping the user scaffold a new application folder in their applications tracking repository. Follow the repo conventions exactly.

## Step 1: Gather Information

Ask the user for the following (use AskUserQuestion or extract from their message):

**Required:**
- **Company name** (e.g., "Morgan Stanley", "Bloomberg", "IMC")
- **Program name** (e.g., "Tech Spring Insight", "Decoded Event", "Launchpad Tech")

**Optional** (ask only if not provided):
- Deadline date
- Program URL / application link
- Location
- What the program is (one-liner)

## Step 2: Generate Folder Slugs

Convert names to **kebab-case** slugs matching existing conventions:

| Company | Slug |
|---------|------|
| Morgan Stanley | `morgan-stanley` |
| Bank of America | `bofa` |
| Hudson River Trading | `hrt` |
| American Express | `amex` |

Use common abbreviations where natural. The program slug follows the same pattern: "Tech Spring Insight" -> `tech-spring-insight`.

The target path is:
```
applications/{company-slug}/{program-slug}/
```

If the company folder already exists (user has applied to another program there), just create the program subfolder.

## Step 3: Read CV Data

Before creating files, read the user's CV sections to pre-populate the application response with relevant background. Read from whichever CV variant is most relevant:

- **SWE/Tech roles**: `curriculum_vitae/swe/`
- **Quant roles**: `curriculum_vitae/quant/`
- **IB/Sales/Consulting**: `curriculum_vitae/ib-sales-consulting/`

Read at minimum: `cv/education.tex`, `cv/experience.tex`, `cv/skills.tex`, and `cv/projects.tex` from the relevant variant. This gives you context about the user's background to write informed templates.

## Step 4: Create Files

Create exactly three files. Match these formats precisely.

### 4a. `application-responses.md`

```markdown
# {Company Name} -- {Program Name}

**Programme:** {Program name}
**Location:** {Location or "TBC"}
**Date:** {Date or "TBC"}
**Deadline:** {Deadline or "TBC"}

---

## Event Details

{One sentence about the program if known, otherwise: "TODO: Research program details."}

## Eligibility

| Requirement | Status | Evidence |
|---|---|---|
| {e.g., "1st or 2nd year undergraduate"} | {Pass/TBC} | {e.g., "[Your Year] [Your Degree], [Your University]"} |
| {e.g., "Quantitative discipline"} | {Pass/TBC} | {e.g., "[Your Degree Subject]"} |

## Key Attributes They Want

- TODO: Research what they're looking for

## Application Process

1. TODO: Outline application steps

---

## Application Questions

### Q1: {Question title}

{Draft response or "TODO"}

---

## CV

{Suggest which CV variant to use based on the role type and why. Reference the specific variant path.}

---

## Sources

- {Application URL if provided}
```

Pre-fill the eligibility table with the user's details from their CV data files.

### 4b. `notes.md`

```markdown
# {Company Name} -- {Program Name}

## Details

- **Event:** {Program name}
- **Date:** {Date or "TBC"}
- **Location:** {Location or "TBC"}
- **Deadline:** {Deadline or "TBC"}
- **Fast-tracks to:** {If known, otherwise omit this line}

## Program Overview

TODO: Research what the program involves.

## About {Company Name}

TODO: Research company background -- AUM/revenue, founding, HQ, headcount, key people, culture.

## Key Requirements

- TODO

## Why {Company Name}

TODO: Identify specific reasons -- connect your experience to what the company does.

## Talking Points to Prep

- TODO: What questions to prepare for?
- TODO: What makes you a good fit?

## Key Contacts

- TODO

## Status

- [ ] Application submitted
- [ ] Response received
- [ ] Interview scheduled
- [ ] Outcome
```

### 4c. `cover-letter.txt`

Write an empty template file with a brief comment at the top:

```
TODO: Write cover letter for {Company Name} {Program Name}.

Style: Plain text, 3-5 paragraphs, conversational tone. No headers, no salutation, no closing.
Connect specific experience to why this company/program matters.

Key experiences to draw from:
- [List relevant experiences from your CV]
- [Include specific projects with tech stacks]
- [Note any relevant skills or languages]
```

## Step 5: Print Summary

After creating all files, print a clear summary:

```
Created application scaffold for {Company} -- {Program}:

  applications/{company-slug}/{program-slug}/
  |-- application-responses.md
  |-- cover-letter.txt
  |-- notes.md

Next steps:
1. Research the company and fill in notes.md
2. Complete the eligibility and application questions in application-responses.md
3. Write the cover letter in cover-letter.txt
4. Choose and customize CV variant (suggested: {variant})
```
