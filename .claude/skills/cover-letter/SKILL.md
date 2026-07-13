---
name: cover-letter
description: |
  Draft a cover letter for a specific application using best practices: tight structure, STAR-based body, quantified achievements, heavy personalization. Triggers: "write cover letter", "draft cover letter for [company]", "cover letter for [role]", "motivational letter", /cover-letter.
---

# Writing a Cover Letter

Draft a one-page cover letter tailored to a specific application. Aim for **250-400 words across 3-4 paragraphs** — recruiters skim, and concise letters convert better than long ones.

## 1. Read context

Before writing, load:

1. **`notes.md`** in the application folder — metadata, eligibility, company research (values, what they look for, role-in-brief), and the **Keywords to mirror** list.
2. **The CV** at `applications/{cat}/{company}/{program}/cv/resume.tex` (or `curriculum_vitae/resume.tex` if the per-app CV doesn't exist yet) — for real projects, dates, and numbers.
3. **The JD** if it's available in the folder or was captured in `notes.md`.

If `notes.md` is missing or thin, stop and ask the user to run `/new-application` first (or fill in research manually). Cover letter quality depends on the keyword list and role-in-brief.

## 2. Structure (3-4 paragraphs)

| Paragraph | Job | Length |
|---|---|---|
| Opening | Hook + named role + one-sentence positioning | 2-3 sentences |
| Body 1 | Strongest STAR example tied to a JD requirement | 4-6 sentences |
| Body 2 *(optional)* | Second example or a values/culture fit angle | 3-5 sentences |
| Closing | What the applicant wants from the programme + practical close | 2-3 sentences |

### Opening
- Name the **specific programme** and **company** in the first or second sentence.
- Lead with a concrete hook: a project, result, or motivation directly relevant to the role — not "I am writing to apply…".
- One sentence positioning (degree, year, specialism) is enough.

### Body — STAR
Each body paragraph centres on one concrete experience using STAR proportions: ~10% Situation, ~10% Task, ~60% Action, ~20% Result. The Result must be **quantified** (percentage, dollar amount, headcount, time saved, ranking, scale).

Pick the experience that maps most directly onto a JD requirement or a `Keywords to mirror` term. If the JD asks for "stakeholder management", surface the role where the applicant coordinated people. If it asks for "low-latency systems", surface the relevant technical project. Match the experience to the requirement — don't lead with the applicant's favourite story if it doesn't fit.

Mirror the company's own phrasing for skills and traits where it's natural — recruiters notice when their words appear back.

### Closing
- One sentence on what the applicant wants to get out of the programme (specific: "see how X works at production scale", not "passionate about finance").
- One practical sign-off line. No "I look forward to hearing from you" boilerplate.

## 3. Personalize hard

Generic letters get flagged immediately. Every letter must include at least two of:

- A **named company-specific thing** — desk, product, recent launch, team, paper, public principle.
- A **JD requirement** quoted or paraphrased close to verbatim.
- A **mirrored keyword** from `notes.md`.
- A reason this **specific programme** (not the company in general) fits the applicant.

If none of these can be produced without invention, the research isn't deep enough — push back to research, don't fabricate.

## 4. Quantify everything you can

Replace vague claims with numbers from the CV, e.g. "cut runtime by 40%", "managed a £X portfolio", "top 5% of 10,000+ participants", "led a team of 8", "served 500+ users". If a claim has no number, ask whether it earns its place vs a quantified alternative.

## 5. Compose the .tex file

Cover letter lives at `applications/{cat}/{company}/{program}/cover-letter.tex` — sister of the `cv/` folder.

1. Copy the master template:
   ```
   cp curriculum_vitae/cover-letter-template.tex applications/{cat}/{company}/{program}/cover-letter.tex
   cp curriculum_vitae/awesome-cv.cls applications/{cat}/{company}/{program}/awesome-cv.cls
   ```
2. Fill the placeholder slots in the copied file:
   - `{{POSITION_TAGLINE}}` — tagline below the name (e.g. "[Your Degree] · [Your University]"). Tune to the role (consulting vs quant vs banking).
   - `{{RECIPIENT_NAME}}` — recruiting team name (e.g. "[Company] Recruitment").
   - `{{RECIPIENT_ORG_ADDRESS}}` — org + city, separated by `\\` (e.g. `[Company Name]\\[City, Country]`).
   - `{{LETTER_TITLE}}` — e.g. "Application: [Programme Name]".
   - `{{LETTER_OPENING}}` — e.g. "Dear [Company] Recruitment Team," (use a real name if `notes.md` has one).
   - `{{PARAGRAPH_1}}`, `{{PARAGRAPH_2}}`, `{{PARAGRAPH_3}}` — the drafted paragraphs.
3. If the letter is 3 paragraphs (most cases), delete the unused `{{PARAGRAPH_N}}` line entirely so a blank paragraph doesn't render.

## 6. Self-check before saving

Run through this before declaring the letter done:

- [ ] 250-400 words total
- [ ] 3 or 4 paragraphs, not more
- [ ] Company **and** programme named in paragraph 1
- [ ] At least one quantified result in the body
- [ ] At least two personalization hits (named thing / JD requirement / mirrored keyword / programme fit)
- [ ] No "I am writing to…", "I look forward to hearing…", "valuable addition to your team"
- [ ] All placeholder slots in the .tex filled or removed (no stray `{{...}}` left)
- [ ] Run the draft through `/humanizer` before shipping

## 7. Tracker update

After saving, set `has_cover_letter` to `yes` in the relevant `applications/spring-{year}-tracker.csv` or `applications/summer-{year}-tracker.csv` row.
