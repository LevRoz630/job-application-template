---
name: decision-matrix
description: |
  Build a structured comparison of competing opportunities to help make decisions. Use this skill when the user is choosing between multiple offers, programs, or opportunities, or wants to compare options. Trigger for phrases like "should I choose X or Y", "compare these opportunities", "decision matrix", "help me decide between", "pros and cons of", "which program should I pick", or /decision-matrix.
---

# Decision Matrix

You are helping the user make structured decisions between competing opportunities. Match a thorough, evidence-based level of analysis.

## Step 1: Identify Options

From the user's message:
- What are the options being compared? (2-4 typically)
- What's the decision context? (e.g., exchange programs, job offers, internship choices)
- What factors matter most to them?

## Step 2: Check Existing Research

Look for existing notes in `applications/` for any of the options being compared. Read existing research to avoid duplicating work.

## Step 3: Build the Analysis

Create or update a `decision-notes.md` file in the most relevant application folder (or in `applications/` root if it spans multiple).

Structure:

```markdown
# Decision: {What's being decided}

**Date:** {today's date}
**Deadline:** {when the decision needs to be made}

## Options

### Option A: {Name}
- **What:** {One-line description}
- **When:** {Dates}
- **Where:** {Location}
- **Cost:** {If relevant}

### Option B: {Name}
- **What:** {One-line description}
- **When:** {Dates}
- **Where:** {Location}
- **Cost:** {If relevant}

## Comparison Matrix

| Factor | {Option A} | {Option B} | Notes |
|--------|-----------|-----------|-------|
| {Factor 1} | {Rating/detail} | {Rating/detail} | {Context} |
| {Factor 2} | {Rating/detail} | {Rating/detail} | {Context} |
| {Factor 3} | {Rating/detail} | {Rating/detail} | {Context} |

## Deep Analysis

### {Factor 1}: {Factor Name}

{Detailed analysis of how each option compares on this factor. Include specific evidence -- course listings, company data, location details, etc.}

### {Factor 2}: {Factor Name}

{Same pattern}

## What I'd Lose by Not Choosing Each

### If I skip {Option A}:
- {Specific thing lost}

### If I skip {Option B}:
- {Specific thing lost}

## Gut Check

{Honest reflection -- sometimes the spreadsheet says one thing but the gut says another. Both matter.}

## Recommendation

{Clear recommendation with reasoning. Be direct -- "Option A, because..." not "it depends."}

## Next Steps

- [ ] {Action item 1}
- [ ] {Action item 2}
```

## Step 4: Present to User

Show the comparison matrix first (quick overview), then the detailed analysis. Ask if they want to adjust weights, add factors, or dig deeper into any specific aspect.

## Principles

- **Be specific, not generic** -- "[University A] offers 3 quant finance electives vs. 1 at [University B]" not "both have good courses"
- **Acknowledge tradeoffs** -- every choice has costs, don't pretend otherwise
- **Include the emotional factor** -- decisions aren't purely rational and that's fine
- **Research when needed** -- use WebSearch to find concrete details (course catalogs, company reviews, location info)
- **Don't over-optimize** -- sometimes two options are close enough that either works, and that's worth saying
