---
name: opportunity-scan
description: |
  Scan target companies for new application opportunities (spring weeks, insight days, internships). Use this skill when the user wants to check for new openings, scan for opportunities, see what's available to apply for, or run a weekly opportunity check. Trigger for phrases like "scan for opportunities", "check for new openings", "what can I apply to", "any new programs open", "weekly scan", "check careers pages", or /opportunity-scan. Run this skill proactively if the user mentions looking for things to apply to.
---

# Opportunity Scanner

Help the user find new programs, insight days, spring weeks, internships, and events to apply for, matched to their profile.

**Applicant profile:** the user's year of study, degree, target roles, and preferred locations drive filtering. Read this from `CLAUDE.md` (or a profile note) if it's recorded there; otherwise ask the user once and remember it for the session. Only surface opportunities the user is eligible for.

## How It Works

1. Read the company watchlist from `target-companies.yaml` (repo root).
2. For each company (or a filtered subset), search the web for current openings.
3. Cross-reference against existing applications in `applications/` to avoid duplicates.
4. Output a report of new opportunities and save it to `scan-reports/`.

## Step 1: Load Watchlist and Existing Applications

Read `target-companies.yaml` from the repo root. Also scan the `applications/` directory to know what the user has already applied to.

## Step 2: Determine Scope

The user might say:
- **"scan everything"** → check all companies
- **"check high priority"** → filter by `priority: high`
- **"check prop trading firms"** → filter by `type: prop-trading`
- **"check Citadel and Jane Street"** → specific companies only
- **"what's new this week"** → all companies, focus on recently posted programs

Default to **high priority companies** if the user doesn't specify.

## Step 3: Search for Opportunities

For each company, run web searches like:
- `"{company name}" spring week {year} {region}`
- `"{company name}" insight day {year} undergraduate`
- `"{company name}" internship {year} penultimate year {region}`
- `"{company name}" early careers {year}`

Focus on:
- **Spring weeks / insight days** — typically 1-5 day programs for early-year / penultimate-year students
- **Summer internships** — 8-12 week programs
- **Events / open days** — networking events, campus events
- **Competitions** — trading competitions, hackathons

For each result, determine:
- Program name
- Application deadline (is it still open?)
- Location
- Eligibility (does the user qualify, given their profile?)
- URL

## Step 4: Cross-Reference

Check each opportunity against existing application folders. Skip anything the user has already applied to. Flag programs similar to past applications (e.g., "this is their {year} version of the same spring week you did last year").

## Step 5: Output Report

Format the report clearly. Group by urgency:

```markdown
# Opportunity Scan — {Date}

## Urgent (deadline within 2 weeks)

### {Company} — {Program Name}
- **Deadline:** {date}
- **What:** {one-liner}
- **Location:** {location}
- **Link:** {URL}
- **Fit:** {why this matches the user's profile}
- **Action:** Apply now / Scaffold with `/new-application`

## Open (deadline > 2 weeks away)

### {Company} — {Program Name}
...

## Coming Soon (applications not yet open)

### {Company} — {Program Name}
- **Expected opening:** {if known}
- **What:** {description}
- **Action:** Set reminder

## Nothing Found

These companies had no new relevant openings:
- {Company 1} — last checked {date}
- {Company 2} — last checked {date}

## Companies Not Checked

{List any that were skipped and why, e.g., careers page was down}
```

## Step 6: Save Report

Save to `scan-reports/{date}-scan.md`. Create the `scan-reports/` directory if it doesn't exist.

## Tips for Effective Scanning

- Careers pages change formats constantly — if a direct URL doesn't work, fall back to web search.
- Many firms post programs on LinkedIn, Bright Network, or TargetJobs as well as their own sites.
- Some programs fill up before the deadline ("rolling basis") — flag these as higher urgency.
- Trading firms often have a single "apply" page with multiple tracks — check if there are new tracks.
- Filter every result against the user's profile (year, degree, target roles, location).

## Managing the Watchlist

If the user asks to add a company, update `target-companies.yaml` with the new entry following the existing format. If they ask to remove one or change priority, do that too.
