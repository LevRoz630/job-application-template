---
name: interview-prep
description: |
  Generate structured interview preparation materials for a specific company and role. Use this skill when the user mentions preparing for an interview, has an upcoming interview, wants practice questions, flashcards, or a prep guide for any company. Trigger for phrases like "interview prep", "prepare for interview", "interview with [company]", "practice questions for [company]", "help me prep for", "interview coming up", "mock interview", or /interview-prep.
---

# Interview Prep Generator

You are helping the user prepare for interviews. Generate thorough, structured prep materials that match the patterns used in this repo.

## Step 1: Gather Context

Determine from the user's message or by asking:

**Required:**
- **Company name**
- **Role/program** (e.g., "Trading Intern", "Spring Insight Day", "SWE Internship")

**Optional:**
- Interview date
- Interview format (phone screen, video, in-person, assessment center)
- Specific areas they want to focus on

## Step 2: Research What Exists

Check if there's already an application folder for this company:
```
applications/{company-slug}/
```

If so, read any existing `notes.md`, `application-responses.md`, or other files to build on existing research rather than starting from scratch.

Also read the user's CV data from the relevant variant in `curriculum_vitae/` to understand what experiences to reference in answers.

## Step 3: Create Interview Prep Files

Create files in the application's folder. If no folder exists yet, suggest using `/new-application` first, or create a minimal folder.

### 3a. `interview-prep-guide.md`

Structure it like this:

```markdown
# {Company Name} -- {Role} Interview Prep

## Interview Details

- **Date:** {date or TBC}
- **Format:** {format or TBC}
- **Duration:** {if known}
- **Interviewers:** {if known}

## Company Quick Facts

{5-8 bullet points about the company: what they do, AUM/revenue, size, HQ, recent news, key differentiators}

## What They're Looking For

Based on the role and company culture:
- {Trait 1 -- why and how you demonstrate it}
- {Trait 2 -- why and how you demonstrate it}
- {Trait 3 -- why and how you demonstrate it}

## Likely Questions & Prepared Answers

### Motivation Questions

**Why {Company}?**
{Draft answer connecting your specific experience to what the company does.}

**Why this role/program?**
{Draft answer}

**Walk me through your CV**
{2-minute structured walkthrough: education -> experience highlights -> projects -> why here}

### Technical Questions
{Tailor to role type:}
{- Quant: probability puzzles, market scenarios, mental math}
{- SWE: data structures, system design, coding}
{- Finance: valuation, markets, recent events}

### Behavioral Questions

**Tell me about a time you worked in a team**
{STAR format answer using a real experience}

**Tell me about a challenge you overcame**
{STAR format answer}

**Tell me about a project you're proud of**
{Answer referencing specific project}

## Questions to Ask Them

- {Thoughtful question about the company/role}
- {Question about day-to-day work}
- {Question about growth/learning}
- {Question about team culture}

## Prep Timeline

- [ ] Review company research (notes.md)
- [ ] Practice CV walkthrough (2 min)
- [ ] Practice motivation answers out loud
- [ ] Review technical fundamentals
- [ ] Prepare questions to ask
- [ ] Mock interview (if time)
```

### 3b. `flashcards.md` (if relevant)

For technical or knowledge-heavy interviews, create flashcards:

```markdown
# {Company} -- Interview Flashcards

## Company Facts
| Question | Answer |
|----------|--------|
| What does {Company} do? | {answer} |
| AUM / Revenue? | {answer} |
| Key strategies/products? | {answer} |
| Founded? HQ? | {answer} |

## Technical Concepts
| Concept | Explanation |
|---------|-------------|
| {Term 1} | {Clear explanation} |
| {Term 2} | {Clear explanation} |

## Key Numbers to Know
| Metric | Value |
|--------|-------|
| {e.g., current interest rate} | {value} |
```

### 3c. `practice.md` (if relevant)

For roles with technical assessments:

```markdown
# {Company} -- Practice Problems

## Problem 1: {Title}
{Problem description}

**Solution approach:**
{Walk through solution}

## Problem 2: {Title}
...
```

## Step 4: Print Summary

```
Interview prep created for {Company} -- {Role}:

  applications/{company-slug}/{program-slug}/
  |-- interview-prep-guide.md  (questions, answers, company research)
  |-- flashcards.md            (quick-reference facts)
  |-- practice.md              (practice problems, if applicable)

Prep checklist:
1. Review and customize the draft answers in interview-prep-guide.md
2. Study flashcards.md
3. Practice your CV walkthrough (aim for 2 minutes)
4. Do at least one mock run-through out loud
```

## Important Notes

- Use the user's real experiences from CV data, not generic filler
- Match a conversational, honest tone -- not corporate-speak
- For quant firms: include probability/mental math practice
- For tech roles: include coding/system design topics
- For finance roles: include market knowledge and valuation concepts
- Always include "Questions to Ask Them" -- interviewers notice when candidates have none
