---
name: new-application
description: |
  Scaffold a new application folder (research, metadata, copy master CV, tracker row). Triggers: "new application", "apply to [company]", "start application for", /new-application.
---

# Scaffolding a New Application

Stand up an application folder grounded in researched company facts so the CV can be tailored from the start. House style: `--` not em dashes, real data only, `TBC` for unknown facts, `TODO` for sections still to research.

```
- [ ] 1. Gather company, program, category (+ deadline / URL / JD if given)
- [ ] 2. Create the folder from kebab-case slugs
- [ ] 3. Research the company, dispatch sub-agents to double-check
- [ ] 4. Write notes.md
- [ ] 5. Copy the master CV into the application's cv/ subfolder
- [ ] 6. Append the tracker row
- [ ] 7. Print the summary
```

## 1. Gather

Required: **company** and **program**. Take deadline, URL, location, and JD if offered. Don't block on missing fields.

Category (top folder):
- `internships` — jobs, internships, spring weeks, insight days
- `competitions` — competitions, hackathons, trading challenges
- `miscellaneous` — study abroad, residencies, fellowships, anything else

## 2. Folder

kebab-case both names; use common abbreviations (BofA → `bofa`, HRT → `hrt`). Create `applications/{category}/{company-slug}/{program-slug}/`.

## 3. Research

Search open sources (careers site, JD, recent press, Glassdoor) for **values / principles**, **what they look for**, and a **role-in-brief**. Extract a **keyword list** — the company's and JD's own words for skills, tools, traits ("ownership", "stakeholder management", "low-latency") — that the CV and cover letter will mirror.

Dispatch independent sub-agents to double-check findings; different agents searching independently catch contradictions and stale facts.

## 4. Write `notes.md`

```markdown
# {Company} -- {Program}

**Programme:** {program}
**Location:** {location or TBC}
**Deadline:** {deadline or TBC}
**URL:** {url or TBC}

---

## Eligibility
- {requirement} -- whether we meet it

## Company Research
**Values / principles:** {…}
**What they look for:** {…}
**Role in brief:** {…}

## Keywords to mirror (CV + cover letter)
- {keyword} -- {company's / JD's phrasing}

## CV pruning plan
- Roles to keep: {…}
- Roles to drop: {…}
- Bullet emphasis: {…}
```

## 5. Copy the master CV into cv/

**`curriculum_vitae/` is the canonical CV source.** Always copy from it; prune from there.

```
DEST=applications/{category}/{company-slug}/{program-slug}/cv
mkdir "$DEST" && cp curriculum_vitae/resume.tex curriculum_vitae/awesome-cv.cls "$DEST/" && cp -r curriculum_vitae/cv "$DEST/cv"
```

Result: `{program}/cv/{resume.tex, awesome-cv.cls, cv/*.tex}`. The `cv/cv/` nesting matches the master so `\input{cv/...}` paths in `resume.tex` resolve. Now prune against the keyword list from step 3 — drop irrelevant roles, reorder for emphasis, rewrite bullets where the JD calls for it. No `\input` cross-references back to `curriculum_vitae/`; the application folder stands alone.

## 6. Tracker

Append one row to the cycle's tracker. Spring weeks & insight days → `applications/spring-{year}-tracker.csv`; summer internships → `applications/summer-{year}-tracker.csv`. Derive `{year}` from the deadline or the program name ("…2027" → `2027`); if neither carries one, ask. Create the tracker with the header line first if it doesn't exist.

```
company,program,status,date_submitted,date_response,has_cover_letter,has_resume,notes
{company-slug},{program-slug},draft,,,no,no,
```

## 7. Summary

Report the folder path, the tracker row, and what's confirmed vs still `TODO`. Cover letters are not scaffolded; point to `/cover-letter` if one is needed.
