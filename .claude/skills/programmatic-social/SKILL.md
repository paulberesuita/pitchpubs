---
name: programmatic-social
description: Generate and publish social media posts from directory data. Usage: /programmatic-social [command]
user_invokable: true
agent: marketing
---

# Programmatic Social Posts

You've been invoked to **generate and publish social media posts** from the directory's database. The full pipeline: query DB -> generate content -> write caption -> post or queue.

**Usage:**
- `/programmatic-social` — Show status (how many posts published, what's queued)
- `/programmatic-social batch [count]` — Generate a batch of posts (default: 7 = one week)
- `/programmatic-social post [slug]` — Generate and post a single item immediately
- `/programmatic-social preview` — Preview what a post looks like for a random item
- `/programmatic-social export` — Export prepared posts as CSV (for scheduling apps)

---

## Architecture

```
/programmatic-social batch 7
        |
        v
Query D1 for 7 random items (with images + descriptions)
        |
        v
For each item:
  |-- Generate branded image (if image generation script exists)
  |-- Write Instagram caption (teaser + hashtags)
  |-- Write Twitter/X text (280 char version)
  |-- Save to batch file for review
        |
        v
Save to docs/social-posts-batch-[date].md
        |
        v
User reviews -> approves -> agent posts or exports
```

---

## Content Types

| Type | Format | Example |
|------|--------|---------|
| **Item spotlight** | Single item feature | "[Item Name] — [interesting fact]. [link]" |
| **Category roundup** | Group of related items | "Top [X] in [category]: [list]. Full list: [link]" |
| **Fun stat** | Interesting data point | "Did you know? [stat from DB]. Explore more: [link]" |
| **Comparison** | Two items side-by-side | "[Item A] vs [Item B] — [key difference]. Which do you prefer?" |
| **New addition** | Recently added item | "Just added: [Item Name] — [description]. [link]" |
| **Question/poll** | Engagement prompt | "What's your favorite [category]? Ours: [link]" |

---

## Post Format

### Instagram / Facebook

```
[Item name] in [Category]

[2-3 sentence teaser — the hook, not the whole story. Pull the most compelling detail from the description.]

Full details -> [DOMAIN]/[section]/[slug]

#[topic] #[category] #[subtopic] #[related1] #[related2] #[sitename]
```

**Rules:**
- Max 2200 chars (Instagram limit)
- 8-15 hashtags (not 30 — engagement drops with too many)
- Teaser should make people want to click, not tell the whole story

### Twitter / X

```
[Item name] — [One compelling sentence about what makes it notable.]

[DOMAIN]/[section]/[slug]

#[topic] #[category]
```

**Rules:**
- Max 280 chars total (including link and hashtags)
- 1-2 hashtags max
- Link counts as 23 chars regardless of length

---

## Command: Batch

Generate a batch of ready-to-post content.

### 1. Pick items

```sql
SELECT slug, name, [CATEGORY_FIELD], description, image_url
FROM [TABLE]
WHERE LENGTH(description) > 200
  AND LENGTH(image_url) > 0
ORDER BY RANDOM()
LIMIT [count];
```

### 2. Write captions

For each item, write Instagram and Twitter captions following the post format above.

### 3. Save to batch file

Save to `docs/social-posts-batch-[YYYY-MM-DD].md`:

```markdown
# Social Posts Batch — [Date]

Generated [count] posts. Ready for review and publishing.

---

## Post 1 — [Item Name]

**Image:** `[image path]`
**Link:** https://[DOMAIN]/[section]/[slug]

**Instagram / Facebook:**
> [Full caption with hashtags]

**Twitter / X:**
> [280-char version]

**Status:** Pending review

---
```

### 4. Post after approval

Once the user approves, post each one via the preferred method (API, manual, or scheduling app). Report back with URLs.

### Tips for good batches

- **Mix categories** — don't do 7 of the same type in a row
- **Geographic/topic diversity** — keep it interesting
- **Rotate post types** — spotlights, stats, questions, comparisons
- **Lead with the hook** — the first sentence is what people see before "more"
- **Seasonal awareness** — tie to what's relevant now

---

## Command: Post

Generate and post a single item immediately (after user confirms).

1. Query item by slug
2. Write caption
3. Show preview to user
4. On approval, post via preferred method
5. Return the post URL

---

## Command: Preview

Preview a single post for a random item without saving or posting:

1. Pick a random item with image + description
2. Show formatted Instagram and Twitter versions
3. Ask if the format/tone looks right before generating a full batch

---

## Command: Export CSV

Export a batch as CSV for import into scheduling apps.

**CSV format (Buffer-compatible):**

```csv
Text,Image URL,Link,Publish Date,Platform
"[Instagram caption]","https://[DOMAIN]/images/[image]","https://[DOMAIN]/[section]/[slug]","2026-02-15 10:00","instagram"
"[Twitter text]","https://[DOMAIN]/images/[image]","https://[DOMAIN]/[section]/[slug]","2026-02-15 10:00","twitter"
```

Save to `docs/social-posts-export-[YYYY-MM-DD].csv`.

---

## Content Strategy

### Posting Frequency
- **Recommended:** 1 post/day across platforms
- **Batch size:** Generate 7-14 at a time (1-2 weeks of content)
- **Cooldown on items** — with enough items in the DB, rotate so nothing repeats too quickly

### Variety Rules
- No more than 2 of the same category in a row
- Alternate between post types (spotlight, stat, question, comparison)
- Alternate tones — mix "compelling" with "fun"

### Hashtag Strategy

**Always include:**
- #[yourtopic] #[sitename]

**Dynamic (from item data):**
- #[category] (e.g., #hotels, #restaurants)
- #[subtopic] (e.g., #historic, #famous)

**Seasonal (add when relevant):**
- Tie to current season, holidays, trending topics

### Best Posting Times
- **Instagram:** 10am-12pm or 7pm-9pm local
- **Facebook:** 9am-11am weekdays
- **Twitter/X:** 8am-10am or 12pm-1pm

---

## Best Practices

- **Value first** — Every post should be useful or interesting on its own
- **Don't over-promote** — Max 1 in 5 posts should feel promotional
- **Vary the format** — Mix spotlights, stats, questions, comparisons
- **Use images when available** — Posts with images get more engagement
- **Never post without user approval** — always show preview first
- **Teaser, not summary** — make people want to click through
- **Always link back** to the item page on [DOMAIN]

---

## After Work Completes

- **CHANGELOG.md** — Batch generated/posted, count of posts, platforms
- **CONTEXT.md** — What tone/format worked, any adjustments
- Batch files saved in `docs/` for reference
