---
name: write-script
description: Generate a 2-minute video script for a directory item short. Usage: /write-script [item-slug or search term]
user_invokable: true
agent: content
---

# Write Script

You've been invoked to **generate a 2-minute video script** for a directory item that can be used to create a short-form video (YouTube Shorts, TikTok, Reels).

## Your Task

Generate a video script for: **{{args}}**

## If No Item Provided

Show items that have rich descriptions ready for scripts:

1. **Query items with substantial content:**
   ```bash
   npx wrangler d1 execute [PROJECT]-db --remote --command "SELECT slug, name, [CATEGORY_FIELD], LENGTH(description) as desc_length, source_count FROM [TABLE] WHERE LENGTH(description) > 300 ORDER BY source_count DESC, desc_length DESC LIMIT 20;"
   ```

2. **Show results:**
   ```
   ## Items Ready for Scripts

   | Item | Category | Description Length | Sources |
   |------|----------|-------------------|---------|
   | [name] | [category] | [X chars] | [N] |

   **Which item would you like to script?** (Enter slug or name)
   ```

3. **Wait for user to pick an item before proceeding.**

## Process

### Step 1: Pull the Item Data

```bash
npx wrangler d1 execute [PROJECT]-db --remote --command "SELECT slug, name, description, [CATEGORY_FIELD], sources, source_count FROM [TABLE] WHERE slug = '[slug]' OR name LIKE '%[search]%' LIMIT 5;"
```

**If the description is thin (< 200 chars):** Tell the user:
> This item has a thin description ([X] chars). Run `/deep-research [slug]` first to get rich source material, then come back for the script.

**If the description is solid (200+ chars):** Proceed to scripting.

### Step 2: Craft the Script

Write a script that follows this structure. Target **~300 words spoken** (~2 minutes at natural pace).

**Use this format:**

```
# [ITEM NAME] — [Location/Category]
# Duration: ~2 minutes | Words: ~300

---

## HOOK (0:00–0:05)
[Visual: description of opening shot]

NARRATOR: "[Opening line — must grab attention in 3 seconds. Start with the most shocking, surprising, or intriguing fact. Use a question, a bold claim, or a compelling detail.]"

## SETUP (0:05–0:30)
[Visual: description of establishing shots, photos if available]

NARRATOR: "[Context. What is this? What makes it notable? Set the scene — make the viewer feel like they're there. Keep it tight, 2-3 sentences max.]"

## THE CORE STORY (0:30–1:00)
[Visual: description of mood shift — detailed shots, archival images]

NARRATOR: "[What's the compelling story here? The history, the unique angle, the surprising facts. Be specific — names, dates, details. This is the emotional core.]"

## THE DETAILS (1:00–1:40)
[Visual: description of interesting footage — close-ups, specific features]

NARRATOR: "[What makes this truly unique? Specific details, notable facts, interesting comparisons. Include expert opinions or notable mentions if available. Build interest with each sentence.]"

## THE CLOSE (1:40–2:00)
[Visual: description of final shot — slow pull-back, fade]

NARRATOR: "[End with the most memorable detail. Something that lingers. A fact that stays with the viewer. Or something recent that makes it feel current and relevant.]"

---

## NOTES
- **Tone:** Conversational and engaging. Like telling an interesting story to a friend.
- **Key visuals needed:** [List 3-5 specific B-roll/image needs]
- **Music cue:** [Suggest mood — e.g., "Upbeat ambient building to inspiring close"]
```

### Script Writing Rules

**DO:**
- Start with the most compelling detail, NOT "This is the story of..."
- Use short, punchy sentences. This is spoken, not written.
- Include specific names, dates, and details — specificity is what makes it believable
- Write how someone would actually speak — contractions, natural rhythm
- Build interest progressively — each section should feel more engaging
- End on something memorable, not a neat conclusion
- Include visual direction in brackets for footage planning

**DON'T:**
- Start with "Welcome to..." or "Today we're going to..."
- Use cliches like "but what lurks beneath the surface" or "little did they know"
- Include everything from the description — pick the most compelling thread
- Write in a formal/documentary tone — this is for social media, keep it engaging
- Make up details that aren't in the source material
- End with "Like and subscribe" or any CTA — end on the story

**VOICE & TONE:**
- Think: someone telling an interesting true story to friends
- Confident but not sensationalist — let the facts speak
- Pacing: slow moments for atmosphere, quick beats for surprising reveals

### Step 3: Save the Script

Save the script to `scripts/shorts/[slug].md`:

```bash
mkdir -p scripts/shorts
```

Then write the file using the Write tool.

### Step 4: Show the Script

Display the full script to the user and ask:

```
## Script Ready: [Item Name]

[Full script displayed above]

**Word count:** [X] words (~[Y] minutes at natural pace)
**Source material:** [Z] chars of description, [N] sources

---

**Want me to:**
- **Adjust tone** — more serious? more casual? more dramatic?
- **Pick a different angle** — focus on a different aspect?
- **Shorten/lengthen** — target a different duration?
- **Script another item** — pick from the list?
```

## Example Hook Styles

**The Question Hook:**
> "What would you do if you found out this place has been hiding a secret for over a hundred years?"

**The Bold Claim:**
> "This is one of the most remarkable [items] in the country — and most people have never heard of it."

**The Compelling Detail:**
> "In [year], something happened here that changed everything. And the evidence is still visible today."

**The Location Hook:**
> "There's a [place] in [location] that has a story most people don't know. And it's incredible."

## Remember

- The script is a **starting point** — adapt it when recording
- Focus on ONE compelling narrative thread, not every detail
- Specificity > generality — "[specific detail]" hits harder than "[vague reference]"
- The hook determines if anyone watches past 3 seconds — spend the most effort there
- Visual cues help plan shoots and find stock footage
- Always save to `scripts/shorts/` so scripts accumulate over time
- **Always update CHANGELOG.md** — keep a record of scripts created
