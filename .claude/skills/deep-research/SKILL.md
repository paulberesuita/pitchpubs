---
name: deep-research
description: Deep research on an item for detailed content, accounts, and findings. Usage: /deep-research [item-slug or search term]
user_invokable: true
agent: content
---

# Deep Research

You've been invoked to **deeply research a directory item** to expand its content with detailed accounts, historical context, and verified findings.

## Your Task

Research and expand content for: **{{args}}**

## If No Item Provided

Show items that need content expansion:

1. **Query items with thin descriptions:**
   ```bash
   npx wrangler d1 execute [PROJECT]-db --remote --command "SELECT slug, name, [CATEGORY_FIELD], LENGTH(description) as desc_length FROM [TABLE] WHERE LENGTH(description) < 300 ORDER BY desc_length ASC LIMIT 20;"
   ```

2. **Show results:**
   ```
   ## Items Needing Deeper Research

   | Item | Category | Description Length |
   |------|----------|-------------------|
   | [name] | [cat] | [X chars] |

   **Which item would you like to research?** (Enter slug or name)
   ```

3. **Wait for user to pick an item before proceeding.**

## Process

### Step 1: Find the Item & Check Status

```bash
npx wrangler d1 execute [PROJECT]-db --remote --command "SELECT * FROM [TABLE] WHERE slug = '[slug]' OR name LIKE '%[search]%' LIMIT 5;"
```

Show current data and confirm which item to research.

**Check if already deeply researched:**
```bash
npx wrangler d1 execute [PROJECT]-db --remote --command "SELECT slug, name, source_count, LENGTH(description) as desc_length FROM [TABLE] WHERE slug = '[slug]';"
```

- If **source_count >= 5**: Ask user if they want to re-research or pick a different item
- If **source_count < 5**: Proceed with research

### Step 2: Research from Multiple Sources

Search for detailed accounts using these source types (in priority order):

**Primary Sources (most reliable):**
1. **Official website** — Primary details, features, specs
   - Search: `"[item name]" official site`
2. **Wikipedia** — History, context, factual verification
   - Search: `"[item name]" wikipedia`
3. **Industry publications** — Reviews, expert coverage, comparisons
   - Search: `"[item name]" [industry] review`
4. **News articles** — Recent developments, notable events
   - Search: `"[item name]" news article`

**Secondary Sources (good for context):**
5. **Specialty directories** — Topic-specific databases and listings
   - Search: `"[item name]" [topic] directory`
6. **Travel/tourism sites** — Atlas Obscura, Roadside America, Visit[Location]
   - Search: `"[item name]" atlas obscura` or `site:atlasobscura.com "[item name]"`
7. **Community sites** — Forums, Reddit (use cautiously, note as "community reports")
   - Search: `"[item name]" reddit [topic] experience`

**For each source, extract:**
- Specific names (people, places, features)
- Specific dates (founding, events, milestones)
- Detailed claims (what makes it notable, what specifically happens)
- Historical context (why it matters)
- Notable accounts (direct quotes if available)
- Expert findings (investigations, studies, reviews)

### Source Tracking (CRITICAL)

**You MUST save EVERY source URL that contributed ANY information to the final content.**

As you research, maintain a running list of sources:
```
## Sources Used
1. https://example.com/article - [facts gathered]
2. https://wikipedia.org/wiki/Item - [historical context]
3. https://expert-site.com/review - [expert findings]
...
```

**What counts as "used":**
- You pulled a fact, date, name, or quote from it
- You used it to verify/corroborate another source
- It appeared in search results and you read content from it

**The `sources` JSON array must include ALL of these URLs, not just the "main" ones.**

### Step 3: Compile the Expanded Content

Structure the expanded description with these sections (as narrative flow, not headers):

```
1. CONTEXT (2-3 sentences)
   - What is it? When was it established/created?
   - What significant events happened here?
   - Who were the key people involved?

2. WHAT MAKES IT NOTABLE (2-3 sentences)
   - What sparked its reputation/fame?
   - What sets it apart from similar items?

3. KEY DETAILS (3-5 sentences)
   - Specific phenomena, features, or characteristics
   - Where exactly? Any patterns?
   - Named features and their significance

4. NOTABLE ACCOUNTS (2-4 sentences)
   - Specific experiences or events (with dates if available)
   - Expert findings or investigations
   - Famous incidents or mentions

5. CURRENT STATUS (1-2 sentences)
   - Can you visit? Is it accessible?
   - Recent developments
```

**Target length:** 400-800 words (substantial, rankable content)

### Step 3.5: Verify Claims Against Sources

**Before saving to the database, verify that every factual claim is backed by at least one source.**

**What counts as a factual claim:**
- Names (people, features, specifics)
- Dates (founding, events, milestones)
- Numbers (measurements, counts, statistics)
- Specific events (incidents, achievements, discoveries)
- Expert findings (investigation results, review conclusions)
- Quotes from witnesses or experts

**What doesn't need a source:**
- General narrative ("The building has a rich history...")
- Atmosphere/mood descriptions ("Visitors often find it fascinating...")
- Logical inferences connecting sourced facts

**Build a claims table before proceeding:**

```
## Claim Verification

| Claim | Source |
|-------|--------|
| Built in 1886 | https://en.wikipedia.org/wiki/... |
| Won award in 2005 | https://industry-site.com/... |
| Featured on TV show | https://show-site.com/... |
```

**Rules:**
- Every factual claim must appear in at least one source
- If a claim can't be sourced, either remove it or soften it ("According to some accounts..." / "It's said that...")
- If two sources contradict each other, note the discrepancy or go with the more credible source
- Show this table in the final report (Step 6) so the user can review

### Step 4: Update the Database

```bash
npx wrangler d1 execute [PROJECT]-db --remote --command "UPDATE [TABLE] SET
  description = '[EXPANDED_CONTENT]',
  sources = '[UPDATED_SOURCES_JSON]',
  source_count = [NEW_COUNT]
WHERE slug = '[slug]';"
```

**Important:**
- Escape single quotes in the content by doubling them (`'` -> `''`)
- Keep the sources JSON array format: `["url1","url2","url3"]`
- **Include ALL sources consulted** — every URL you pulled information from
- Preserve existing sources, add new ones
- `source_count` must match the actual number of URLs in the `sources` array

### Step 5: Verify Image

**Always check if the current image is the best representation for the expanded content.**

1. **Get current image:**
   ```bash
   npx wrangler d1 execute [PROJECT]-db --remote --command "SELECT image_url FROM [TABLE] WHERE slug = '[slug]';"
   ```

2. **Download and view the image:**
   ```bash
   curl -sL "https://[DOMAIN]/images/[image_url]" -o /tmp/[slug].jpg
   ```
   Then use the Read tool to visually inspect the image.

3. **Evaluate the image against these criteria:**
   - **Correct item?** — Is this actually the item, not a generic photo?
   - **Matches the content?** — Does it connect to the story?
   - **Quality?** — Good resolution, composition, not blurry or cropped poorly?
   - **Representative?** — Does it show the item well?

4. **If the image needs replacement:**
   - Search for better alternatives (Wikimedia Commons, official site, DPLA, Internet Archive)
   - Prefer: Photos that show the actual item
   - Follow the `/research-images` process to upload the new image

5. **Report image status:**
   ```
   **Image:** [Keep current / Replaced with better image]
   - [Reason for decision]
   ```

### Step 6: Verify and Report

```bash
npx wrangler d1 execute [PROJECT]-db --remote --command "SELECT name, LENGTH(description) as new_length, source_count FROM [TABLE] WHERE slug = '[slug]';"
```

Report:
```
## Research Complete: [Item Name]

**Before:** [X] characters, [Y] sources
**After:** [X] characters, [Y] sources

### Key Additions:
- [Notable finding 1]
- [Notable finding 2]
- [Notable finding 3]

### New Sources Added:
- [source 1]
- [source 2]

### Claim Verification:
| Claim | Source |
|-------|--------|
| [factual claim] | [source URL] |
| [factual claim] | [source URL] |

### Image:
- [Status and reasoning]
```

### Step 7: Update CHANGELOG.md

**Always log your research in CHANGELOG.md** so there's a record of content improvements.

Add an entry under the current date's `### Changed` section:

```markdown
## [YYYY-MM-DD]

### Changed
- Expanded content for [Item Name] ([Category]) — [X] -> [Y] chars, [N] sources
```

**If you also replaced the image, add under `### Changed`:**
```markdown
- Updated image for [Item Name] — [reason]
```

## Research Tips

**DO:**
- Cross-reference claims across multiple sources
- Note specific names, dates, details
- Include direct quotes from experts when available
- Mention notable mentions or features by name
- Add historical context that explains significance

**DON'T:**
- Make up details or embellish
- Include unverified community posts as fact (say "some visitors report...")
- Copy text verbatim (paraphrase and cite)
- Include content that's purely promotional
- Forget to escape SQL quotes

## Next Step: Video Script

After research is complete, suggest:

> **Want a 2-minute video script for this item?** Run `/write-script [slug]` to generate a short-form video script.

## Remember

- Quality over quantity — one well-researched item is better than many thin updates
- Always verify claims with at least 2 sources before including
- The goal is to make visitors want to read AND visit
- **Always verify the image** — the photo should match and enhance the content
- **Always update CHANGELOG.md** — keep a record of content improvements
