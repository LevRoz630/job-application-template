---
name: humanizer
description: |
  Scan drafted application text (form answers, cover letters, notes, CV bullets) for AI-writing tells and rewrite them out so the writing reads as the applicant's own. Triggers: "humanize", "de-AI this", "remove AI tells", "make this sound less like ChatGPT", /humanizer.
---

# Humanizer

Pass a block of drafted text through this before it ships. The goal is not to dumb writing down — it is to remove the statistical fingerprints that make text read as machine-generated, while keeping every real fact intact. Recruiters increasingly run answers through AI detectors; a strong answer that pings as AI-written costs more than a plainer one that doesn't.

**House style (this repo):** `--` not em dashes, real data only, no invented facts. Humanizing must never add a claim the CV can't back.

## How to run

1. Read the target text (a form answer, `cover-letter.tex` paragraphs, `notes.md` prose — not code, not tracker CSVs).
2. Scan against the **pattern list** below. Flag every hit.
3. Rewrite each hit using the fixes given. Preserve meaning, numbers, and the requested structure (e.g. if a form asks for org/location/timing/type, keep that skeleton).
4. Re-read once end to end for rhythm — vary sentence length, let some sentences run short. Humans are uneven; AI is smooth.
5. Report what you changed and why (short bullet list), so the applicant can sanity-check.

Do **not** over-correct into stilted or error-ridden prose — the target is *natural*, not *broken*.

## Pattern list to scan for

### A. Punctuation & structure
- **Em dash as a universal connector** (`—`) — the single most-flagged tell ("ChatGPT dash"). Replace with a period, comma, parentheses, or `--`. If a sentence has two, restructure it.
- **The "not just X, but Y" / "it's not X, it's Y" antithesis** — decorative contrast AI leans on for drama. Cut to the plain claim.
- **Rule of three / tricolons** — "adjective, adjective, adjective" or three balanced parallel clauses ("I built…, placed…, and ran…"). Listing three *real* items is fine; forced symmetry is the tell. Break the parallelism or drop the weakest item.
- **Bold-on-every-lead-in** — every bullet opening in `**bold**` reads as generated. Bold sparingly or not at all.
- **Trailing participial clause** — "…, ensuring X", "…, allowing Y", "…, highlighting Z" tacked onto sentence ends. Make it a new sentence or delete.
- **Colon-introduces-a-list, repeatedly** — vary how lists are introduced.
- **Formulaic transitions** — "Moreover,", "Furthermore,", "Additionally,", "In conclusion,", "Overall,", "Ultimately,". Delete or replace with plain connectors.

### B. Vocabulary (AI-overused words — swap for plain equivalents)
delve / delve into, underscore, pivotal, crucial, key (as filler), leverage, harness, facilitate, illuminate, bolster, garner, boasts, robust, seamless, elevate, unlock, navigate (figurative), foster, testament (to), tapestry, realm, landscape ("digital/financial landscape"), beacon, meticulous(ly), intricate / intricacies, interplay, vibrant, enduring, showcase, spearhead, embark, resonate, myriad.

### C. Empty phrasing
- "In today's fast-paced world / ever-evolving landscape", "at the forefront of", "a rich tapestry of", "the world of [X]".
- Vague intensifiers with no data: "significantly", "truly", "highly", "deeply passionate", "wide range of".
- Uplift with no specifics — states a lesson but names nothing real, ties every bow. Replace generic virtue with one concrete, lived detail (a number, a name, a moment).
- Hedging stacks: "I believe that, in many ways, this could potentially…".

### D. Tone tells
- Uniform, evenly-weighted sentences (every sentence ~same length). Add variety; let one land short.
- Relentless positivity / no rough edges. A real voice admits limits ("my trading experience so far is competitive rather than on a desk").
- Explaining the obvious back to the reader.

## Quick self-check before declaring done
- [ ] Zero em dashes (converted to `--`, commas, or periods)
- [ ] No "not just… but…" / "it's not X, it's Y"
- [ ] No forced tricolons or all-bold bullet leads
- [ ] None of the list-B words survive without a deliberate reason
- [ ] Every kept number/fact still traces to the CV
- [ ] Sentence lengths vary; at least one short sentence
- [ ] Reads like the applicant could have said it out loud

## Sources
Pattern list distilled from:
- [Wikipedia: Signs of AI writing](https://en.wikipedia.org/wiki/Wikipedia:Signs_of_AI_writing)
- [Grammarly — Common AI Words and Phrases](https://www.grammarly.com/blog/ai/common-ai-words/)
- [Forbes — 15 New Giveaway Signs of AI-Generated Content (Feb 2026)](https://www.forbes.com/sites/jodiecook/2026/02/03/the-15-new-giveaway-signs-of-ai-generated-content-in-february-2026/)
- [Plagiarism Today — Em Dashes, Hyphens and Spotting AI Writing](https://www.plagiarismtoday.com/2025/06/26/em-dashes-hyphens-and-spotting-ai-writing/)
