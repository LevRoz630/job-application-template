---
name: cover-letter
description: |
  Help write cover letters that won't get flagged as AI. Use this skill when the user wants to write, draft, or improve a cover letter for any company or program. Trigger for phrases like "write cover letter", "draft cover letter for [company]", "cover letter for [role]", "help with my cover letter", "motivational letter", or /cover-letter. Also trigger when the user has a cover-letter.txt with TODO content and asks to fill it in.
---

# Cover Letter Helper

You are helping the user with cover letters. Applications can get flagged by AI detectors, so the primary goal is producing letters that read as unmistakably human. This means changing HOW you help, not just how you write.

## The Core Problem

AI-generated text has statistical fingerprints that detectors pick up: consistent sentence length, balanced paragraph structure, smooth transitions, hedging language, predictable word choices. No amount of "write naturally" prompting fully eliminates these patterns. The solution is to **keep the user as the writer** and use Claude as a thinking partner.

## Default Mode: Generate a Brief (not a draft)

Unless the user explicitly asks for a full draft, produce a **cover letter brief** -- a structured set of ideas, angles, and specific details that the user uses to write the letter themselves.

### Step 1: Read Background

1. Check for existing application folder at `applications/{company-slug}/` -- read `notes.md` and `application-responses.md` if they exist
2. Read CV data from the most relevant variant in `curriculum_vitae/`
3. Read 2-3 existing cover letters for voice reference (if any exist in `applications/`)

### Step 2: Produce the Brief

Output a brief like this:

```
## Cover Letter Brief: {Company} -- {Program}

### The angle
{One sentence: what's the core narrative thread? e.g., "You've built small-scale trading systems and want to see what happens at institutional scale."}

### Opening hook
{2-3 options for how to start. These should be specific claims or observations, not throat-clearing.}
- Option A: Start with what you're currently working on and why it's hitting limits
- Option B: Start with a specific thing the company does that you find genuinely interesting
- Option C: Start with the gap in your experience that this program fills

### Experiences to weave in (pick 2-3, not all)
- **[Experience 1]** -- angle: {specific angle for this application}
- **[Experience 2]** -- angle: {specific angle for this application}
- **[Experience 3]** -- angle: {specific angle for this application}

### What to be honest about
{What don't you know? What gap does this program fill? Letters work best when you admit what you don't understand yet. Suggest 1-2 honest admissions.}

### How to close
{Suggest an ending -- not a wrap-up, just the last thought. End with a forward-looking statement or a practical observation.}

### Things to avoid for this specific letter
- {e.g., "Don't mention payments -- you don't know enough about their payments business"}
- {e.g., "Don't compare to [other company] -- different company, different appeal"}
```

Save the brief to `cover-letter-brief.md` in the application folder.

### Step 3: After the user writes it

When the user comes back with a draft they've written themselves, help by:
- Pointing out anything that sounds generic or could apply to any company
- Suggesting where to add a specific detail or number
- Flagging if it's too long (aim for 250-400 words, 3-5 paragraphs)
- Checking it matches their existing voice

## Draft Mode (only when explicitly asked)

If the user says "just write it" or "give me a draft", generate a full letter but apply these rules aggressively:

### Voice patterns to aim for

**Sentence structure:**
- Mix short and long. A short statement followed by a complex sentence.
- Sentence fragments are fine. "Personal projects, competitions, a few side gigs."
- Start sentences with "But", "And", "Same thing at". Not "Moreover", "Furthermore", "Additionally".

**Word choice:**
- Use the same word twice rather than finding a synonym. If you said "data" in the last sentence, say "data" again.
- Contractions always: "I'm", "I've", "don't", "that's", "it's", "can't"
- No hedging: not "I believe I could contribute" but "I want to understand how that works"
- No qualifiers: not "quite interesting" or "rather impressive" -- just state it

**Paragraph structure:**
- Uneven lengths. One paragraph can be 2 sentences, the next can be 5.
- No topic sentences. Don't start paragraphs with a thesis.
- Paragraphs don't need tidy conclusions. Just stop when the point is made.

**Overall:**
- No salutation, no closing, no sign-off
- End abruptly. The last sentence is often just a practical statement, not a crescendo.
- Never use: passionate, driven, eager, thrive, leverage, synergy, dynamic, fast-paced, cutting-edge, industry-leading, prestigious
- Never use: "I am writing to...", "I would like to express...", "I am confident that..."

**Anti-AI-detection specifics:**
- Vary sentence length dramatically (5 words then 25 words)
- Include at least one grammatically informal construction per paragraph
- Use concrete numbers from CV but state them casually
- Reference real places casually
- One paragraph should be noticeably shorter than the others
- Don't balance the letter -- it's okay if 60% is about one thing and 10% about another

After writing a draft:
1. Run the `/humanizer` skill on the draft to catch remaining AI patterns (the 24 Wikipedia-documented signs)
2. After saving the file, tell the user in chat (do NOT write this into the cover letter file): "This is AI-generated. Read it through and rewrite any sentences that don't sound like you. At minimum, change the opening and closing."

## Save Location

Save to `applications/{company-slug}/{program-slug}/cover-letter.txt` (for drafts) or `cover-letter-brief.md` (for briefs).
