---
name: company-research
description: |
  Research a company or program and save structured notes for applications and interviews. Use this skill when the user wants to learn about a company, research a firm before applying or interviewing, or asks "what does [company] do", "research [company]", "tell me about [company] for my application", "look up [program]", or /company-research. Also trigger when the user needs to fill in TODO sections in their notes.md files.
---

# Company Research

You are helping the user research companies and programs for their applications. Save structured research notes that they can reference when writing cover letters, prepping for interviews, and filling in application responses.

## Step 1: Identify Target

From the user's message:
- **Company name**
- **Specific program** (if any)
- **What they need** -- general overview, or deep-dive on a specific aspect?

## Step 2: Check Existing Materials

Look for existing files in `applications/{company-slug}/`:
- Read any `notes.md`, `application-responses.md`, or research files already there
- Build on what exists rather than starting from scratch

## Step 3: Research

Use WebSearch to find current information about:

1. **Company basics**: What they do, size (AUM/revenue/headcount), HQ and offices, founding story
2. **Business model**: How they make money, key products/services, market position
3. **Culture & values**: What they emphasize, leadership style, what employees say
4. **Recent news**: Last 6 months of notable events, deals, product launches
5. **For the specific program**: What it involves, past participant experiences, what they're looking for
6. **User-relevant angles**: Anything that connects to the user's background and interests

## Step 4: Write Structured Notes

Save to or update `applications/{company-slug}/{program-slug}/notes.md` (or just `{company-slug}/notes.md` if no specific program).

Follow this structure (matching existing notes in the repo):

```markdown
# {Company Name} -- {Program Name or "Research Notes"}

## Details

- **Type:** {Hedge fund / Investment bank / Tech firm / etc.}
- **Founded:** {Year}
- **HQ:** {City}
- **Offices:** {Key locations}
- **Size:** {AUM for funds, revenue for others, headcount}
- **Key People:** {CEO/founders/notable names}

## What They Do

{2-3 paragraphs explaining the business clearly. For trading firms: what strategies they run. For banks: what divisions matter. For tech: what products they build.}

## Culture & Values

- {Value 1 -- with evidence/quote}
- {Value 2}
- {Value 3}

## Why This Matters for You

{Connect the company's work to the user's background. Be specific:}
- {How does your experience relate?}
- {What would you learn here that you can't elsewhere?}
- {What's the genuine appeal?}

## Recent News

- {Date}: {Event/news item}
- {Date}: {Event/news item}

## Talking Points

- {Specific thing to mention in interview/cover letter}
- {Question that shows genuine understanding}
- {Connection between their work and your interests}

## Sources

- [{Title}]({URL})
- [{Title}]({URL})
```

## Step 5: Summarize

Tell the user what you found and highlight the 2-3 most useful angles for their application or interview. Flag anything that was hard to find or might need verification.

## Quality Standards

- **Use real data** -- search for actual figures, don't estimate
- **Cite sources** -- include URLs for key claims
- **Be honest about gaps** -- if information isn't publicly available, say so
- **Focus on actionable info** -- what helps you write a better cover letter or nail an interview?
- **Date-stamp news** -- recent events go stale quickly
