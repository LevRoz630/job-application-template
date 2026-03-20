# AI Writing Patterns to Avoid

Reference guide for identifying and removing AI-generated writing patterns. Based on [Wikipedia's "Signs of AI writing"](https://en.wikipedia.org/wiki/Wikipedia:Signs_of_AI_writing), maintained by WikiProject AI Cleanup.

Core insight: "LLMs use statistical algorithms to guess what should come next. The result tends toward the most statistically likely result that applies to the widest variety of cases."

---

## Quick reference: words that scream AI

delve, embark, foster, endeavor, beacon, paramount, profound, meticulous, robust, leverage, utilize, harness, unlock, groundbreaking, cutting-edge, game changer, tapestry, realm, journey, landscape, resonate, underscore, shed light on, bespoke, tailored, curated, navigate, navigating complexities, elevate, amplify, unleash

## Quick reference: phrases to avoid

- "at the intersection of X and Y"
- "actionable insights"
- "I'm eager to / excited about / passionate about"
- "in today's fast-paced world"
- "it is important to note that"
- "designed to enhance"
- "unlock the potential"
- "revolutionize the way"
- "when it comes to"
- "in the realm of"

---

## Content patterns

### 1. Significance inflation

**Words to watch:** stands/serves as, is a testament/reminder, a vital/significant/crucial/pivotal/key role/moment, underscores/highlights its importance/significance, reflects broader, symbolizing its ongoing/enduring/lasting, contributing to the, setting the stage for, marking/shaping the, represents/marks a shift, key turning point, evolving landscape, focal point, indelible mark, deeply rooted

LLM writing puffs up importance by adding statements about how arbitrary aspects represent or contribute to a broader topic.

**Before:**
> The Statistical Institute of Catalonia was officially established in 1989, marking a pivotal moment in the evolution of regional statistics in Spain.

**After:**
> The Statistical Institute of Catalonia was established in 1989 to collect and publish regional statistics independently from Spain's national statistics office.

### 2. Notability name-dropping

**Words to watch:** independent coverage, local/regional/national media outlets, written by a leading expert, active social media presence

LLMs hit readers over the head with claims of notability, often listing sources without context.

**Before:**
> Her views have been cited in The New York Times, BBC, Financial Times, and The Hindu. She maintains an active social media presence with over 500,000 followers.

**After:**
> In a 2024 New York Times interview, she argued that AI regulation should focus on outcomes rather than methods.

### 3. Superficial -ing analyses

**Words to watch:** highlighting/underscoring/emphasizing..., ensuring..., reflecting/symbolizing..., contributing to..., cultivating/fostering..., encompassing..., showcasing...

AI tacks present participle ("-ing") phrases onto sentences to add fake depth.

**Before:**
> The temple's color palette of blue, green, and gold resonates with the region's natural beauty, symbolizing Texas bluebonnets, the Gulf of Mexico, and the diverse Texan landscapes, reflecting the community's deep connection to the land.

**After:**
> The temple uses blue, green, and gold colors. The architect said these were chosen to reference local bluebonnets and the Gulf coast.

### 4. Promotional language

**Words to watch:** boasts a, vibrant, rich (figurative), profound, enhancing its, showcasing, exemplifies, commitment to, natural beauty, nestled, in the heart of, groundbreaking (figurative), renowned, breathtaking, must-visit, stunning

**Before:**
> Nestled within the breathtaking region of Gonder in Ethiopia, Alamata Raya Kobo stands as a vibrant town with a rich cultural heritage and stunning natural beauty.

**After:**
> Alamata Raya Kobo is a town in the Gonder region of Ethiopia, known for its weekly market and 18th-century church.

### 5. Vague attributions and weasel words

**Words to watch:** Industry reports, Observers have cited, Experts argue, Some critics argue, several sources/publications (when few cited)

**Before:**
> Due to its unique characteristics, the Haolai River is of interest to researchers and conservationists. Experts believe it plays a crucial role in the regional ecosystem.

**After:**
> The Haolai River supports several endemic fish species, according to a 2019 survey by the Chinese Academy of Sciences.

### 6. Formulaic "challenges and future prospects"

**Words to watch:** Despite its... faces several challenges..., Despite these challenges, Challenges and Legacy, Future Outlook

**Before:**
> Despite its industrial prosperity, Korattur faces challenges typical of urban areas, including traffic congestion and water scarcity. Despite these challenges, with its strategic location and ongoing initiatives, Korattur continues to thrive.

**After:**
> Traffic congestion increased after 2015 when three new IT parks opened. The municipal corporation began a stormwater drainage project in 2022 to address recurring floods.

---

## Language and grammar patterns

### 7. Overused AI vocabulary

**High-frequency words:** Additionally, align with, crucial, delve, emphasizing, enduring, enhance, fostering, garner, highlight (verb), interplay, intricate/intricacies, key (adjective), landscape (abstract noun), pivotal, showcase, tapestry (abstract noun), testament, underscore (verb), valuable, vibrant

These words appear far more frequently in post-2023 text and often co-occur.

**Before:**
> Additionally, a distinctive feature of Somali cuisine is the incorporation of camel meat. An enduring testament to Italian colonial influence is the widespread adoption of pasta in the local culinary landscape.

**After:**
> Somali cuisine also includes camel meat, which is considered a delicacy. Pasta dishes, introduced during Italian colonization, remain common, especially in the south.

### 8. Copula avoidance

**Words to watch:** serves as/stands as/marks/represents [a], boasts/features/offers [a]

LLMs substitute elaborate constructions for simple "is"/"are"/"has".

**Before:**
> Gallery 825 serves as LAAA's exhibition space for contemporary art. The gallery features four separate spaces and boasts over 3,000 square feet.

**After:**
> Gallery 825 is LAAA's exhibition space for contemporary art. The gallery has four rooms totaling 3,000 square feet.

### 9. Negative parallelisms

"Not only...but..." or "It's not just about..., it's..." constructions.

**Before:**
> It's not just about the beat riding under the vocals; it's part of the aggression and atmosphere. It's not merely a song, it's a statement.

**After:**
> The heavy beat adds to the aggressive tone.

### 10. Rule of three overuse

LLMs force ideas into groups of three to appear comprehensive.

**Before:**
> The event features keynote sessions, panel discussions, and networking opportunities. Attendees can expect innovation, inspiration, and industry insights.

**After:**
> The event includes talks and panels. There's also time for informal networking between sessions.

### 11. Synonym cycling

AI has repetition-penalty code causing excessive synonym substitution.

**Before:**
> The protagonist faces many challenges. The main character must overcome obstacles. The central figure eventually triumphs. The hero returns home.

**After:**
> The protagonist faces many challenges but eventually triumphs and returns home.

### 12. False ranges

"From X to Y" constructions where X and Y aren't on a meaningful scale.

**Before:**
> Our journey through the universe has taken us from the singularity of the Big Bang to the grand cosmic web, from the birth and death of stars to the enigmatic dance of dark matter.

**After:**
> The book covers the Big Bang, star formation, and current theories about dark matter.

---

## Style patterns

### 13. Em dash overuse

LLMs use em dashes (--) more than humans, mimicking "punchy" sales writing. Use commas or separate sentences instead.

### 14. Boldface overuse

AI emphasizes phrases in boldface mechanically. Remove unless genuinely needed for scanning.

### 15. Inline-header vertical lists

Lists where items start with bolded headers followed by colons. Convert to flowing prose or simpler lists.

**Before:**
> - **User Experience:** The user experience has been significantly improved.
> - **Performance:** Performance has been enhanced through optimized algorithms.

**After:**
> The update improves the interface and speeds up load times through optimized algorithms.

### 16. Title Case in headings

AI capitalizes all main words. Use sentence case instead: "Strategic negotiations and global partnerships."

### 17. Emojis

AI decorates headings or bullet points with emojis. Remove them.

### 18. Curly quotation marks

ChatGPT uses curly quotes ("\u201c...\u201d") instead of straight quotes ("..."). Replace with straight quotes.

---

## Communication patterns

### 19. Chatbot artifacts

**Words to watch:** I hope this helps, Of course!, Certainly!, You're absolutely right!, Would you like..., let me know, here is a...

Text meant as chatbot correspondence gets pasted as content. Remove entirely.

### 20. Knowledge-cutoff disclaimers

**Words to watch:** as of [date], Up to my last training update, While specific details are limited/scarce..., based on available information...

Remove -- either find the information or state what's unknown directly.

### 21. Sycophantic tone

Overly positive, people-pleasing language. "Great question!" "That's an excellent point!" Just state the content.

---

## Filler and hedging

### 22. Filler phrases

- "In order to achieve this goal" -> "To achieve this"
- "Due to the fact that" -> "Because"
- "At this point in time" -> "Now"
- "The system has the ability to" -> "The system can"
- "It is important to note that" -> (delete, just state the thing)

### 23. Excessive hedging

Over-qualifying statements. "It could potentially possibly be argued that the policy might have some effect" -> "The policy may affect outcomes."

### 24. Generic positive conclusions

Vague upbeat endings. "The future looks bright. Exciting times lie ahead." -> State a specific fact or next step instead.

---

## What to do instead

- Write like you talk
- Be specific -- include details only you would know
- Use contractions ("I'm", "don't", "it's")
- Mix short and long sentences dramatically
- Say things directly without preamble
- Add personal anecdotes or specific details
- Read it aloud -- if it sounds weird, rewrite it
- Use fragments occasionally. Like this.
- Have opinions. React to things. Mixed feelings are human.
- Let some mess in. Tangents and half-formed thoughts are fine.

---

## Adding personality

Avoiding AI patterns is only half the job. Sterile, voiceless writing is just as obvious as slop.

**Have opinions.** Don't just report facts -- react to them.

**Vary your rhythm.** Short punchy sentences. Then longer ones that take their time. Mix it up.

**Acknowledge complexity.** "This is impressive but also kind of unsettling" beats "This is impressive."

**Use "I" when it fits.** First person isn't unprofessional -- it's honest.

**Be specific about feelings.** Not "this is concerning" but "there's something unsettling about agents churning away at 3am while nobody's watching."

### Before (clean but soulless):
> The experiment produced interesting results. The agents generated 3 million lines of code. Some developers were impressed while others were skeptical.

### After (has a pulse):
> I genuinely don't know how to feel about this one. 3 million lines of code, generated while the humans presumably slept. Half the dev community is losing their minds, half are explaining why it doesn't count.
