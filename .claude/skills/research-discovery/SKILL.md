---
name: research-discovery
description: Discover items, fill images, and show coverage overview. Usage: /research-discovery [category?] or /research-discovery images [category]
user_invokable: true
agent: content
---

# Research Discovery

You've been invoked to **discover items** for a category or **show a high-level overview** of current coverage.

- `/research-discovery` — Show coverage overview, gaps, and recommendations
- `/research-discovery [category]` — Discover new items for a category
- `/research-discovery images [category]` — Find and upload images for items missing them

## Your Task

Discover items for: **{{args}}**

---

## If No Category Provided — Coverage Overview

Show a comprehensive overview of what we have and where the gaps are.

### 1. Run Coverage Queries

```bash
# Items per category
npx wrangler d1 execute [PROJECT]-db --remote --command "SELECT [CATEGORY_FIELD], COUNT(*) as items FROM [TABLE] GROUP BY [CATEGORY_FIELD] ORDER BY items DESC;"

# Image coverage per category
npx wrangler d1 execute [PROJECT]-db --remote --command "SELECT [CATEGORY_FIELD], COUNT(*) as total, SUM(CASE WHEN image_url IS NOT NULL AND image_url != '' THEN 1 ELSE 0 END) as with_images, ROUND(100.0 * SUM(CASE WHEN image_url IS NOT NULL AND image_url != '' THEN 1 ELSE 0 END) / COUNT(*), 1) as image_pct FROM [TABLE] GROUP BY [CATEGORY_FIELD] ORDER BY [CATEGORY_FIELD];"

# Content depth per category
npx wrangler d1 execute [PROJECT]-db --remote --command "SELECT [CATEGORY_FIELD], COUNT(*) as total, SUM(CASE WHEN LENGTH(description) > 500 THEN 1 ELSE 0 END) as rich, ROUND(100.0 * SUM(CASE WHEN LENGTH(description) > 500 THEN 1 ELSE 0 END) / COUNT(*), 1) as rich_pct, ROUND(AVG(source_count), 1) as avg_sources FROM [TABLE] GROUP BY [CATEGORY_FIELD] ORDER BY [CATEGORY_FIELD];"

# Total counts
npx wrangler d1 execute [PROJECT]-db --remote --command "SELECT COUNT(*) as total_items FROM [TABLE];"
```

### 2. Present Overview

```markdown
## Coverage Overview

**Total:** [X] items across [Y] categories

### Coverage by Category
| Category | Items | Images | Rich Content | Avg Sources | Health |
|----------|-------|--------|-------------|-------------|--------|
| [Cat 1]  | 45    | 92%    | 60%         | 4.2         | Good   |
| [Cat 2]  | 12    | 42%    | 25%         | 1.5         | Needs work |
| ...      |       |        |             |             |        |

**Health scoring:**
- Good: 80%+ images, 50%+ rich content
- OK: 60%+ images
- Needs work: Below thresholds

### Expansion Opportunities

**Before showing gaps, actively research what's missing.** Use WebSearch to find what categories or items the directory is missing compared to competitors or topic expectations.

```
Search: "best [topic] directory" OR "[topic] database"
```

Present:

```markdown
### Categories to Expand
| Category | Current | Est. Potential | Why |
|----------|---------|---------------|-----|
| [cat 1]  | 12      | ~30-50        | Major topic area, competitors have more |
| [cat 2]  | 0       | ~20-30        | Missing entirely, high search volume |

### Existing Coverage Gaps

**Categories needing more depth:**
- [Category] has [X] items but only [Y]% rich content -> run `/deep-research`
- [Category] has [X] items but only [Y]% images -> run `/research-discovery images [category]`

**Categories needing more items:**
- [Category] only has [X] items -> run `/research-discovery [category]`

**Ready for new pages:**
- [Category] has [X] items -> could build section page

## What would you like to do?
```

**Wait for user to pick an action before proceeding.**

---

## If Category Provided — Discover Items

### 1. Check Existing Coverage

```bash
npx wrangler d1 execute [PROJECT]-db --remote --command "SELECT slug, name, [CATEGORY_FIELD] FROM [TABLE] WHERE [CATEGORY_FIELD] = '[category]' ORDER BY name;"
```

Show what we already have so we don't duplicate.

### 2. Propose Discovery Plan

```markdown
## Discovery Plan: [Category]

**Already have:** [X] items

### Target Areas
- [Area 1] (est. X new items) — major topic area
- [Area 2] (est. Y new items) — notable examples

### Expected Subcategories
[subcategory 1]: ~X, [subcategory 2]: ~Y

### Sources for Discovery
- [Official directories, industry databases]
- [Wikipedia lists]
- [Topic-specific reference sites]
- [Industry publications]

**Does this look right?**
```

**Wait for approval before proceeding.**

### 3. Discover Items

For each item, gather **structural data only** — no deep content research:

| Field | Required | Notes |
|-------|----------|-------|
| `name` | Yes | Exact name |
| `slug` | Yes | URL-friendly version |
| `[CATEGORY_FIELD]` | Yes | Use established categories |
| `description` | Yes | 1-2 sentence summary of what it is |
| `source_url` | Yes | Primary source URL |
| `sources` | Yes | JSON array of 1-2 discovery sources |
| `source_count` | Yes | Number of sources |

**DO NOT write detailed descriptions.** That's what `/deep-research` is for. Just capture enough to identify the item and its basic significance.

**Good discovery sources:**
- Official directories and industry databases
- Wikipedia lists of [topic]
- Topic-specific reference sites
- Industry publications and rankings

### 4. Create Seed File

Create `scripts/seed-[category].sql`:

```sql
-- Discovery seed for [Category] items
-- Generated on YYYY-MM-DD
-- Run /deep-research on individual items for full content

INSERT OR REPLACE INTO [TABLE] (slug, name, [fields...], source_url, sources, source_count)
VALUES
  ('slug-name', 'Item Name', [values...],
   'https://discovery-source.com',
   '["https://discovery-source.com"]', 1);
```

### 5. Run Migration

```bash
npx wrangler d1 execute [PROJECT]-db --file=./scripts/seed-[category].sql --remote
```

### 6. Report & Suggest Next Steps

```bash
npx wrangler d1 execute [PROJECT]-db --remote --command "SELECT COUNT(*) as items FROM [TABLE] WHERE [CATEGORY_FIELD] = '[category]';"
```

```markdown
## Discovery Complete: [Category]

**Added:** [X] new items ([Y] total for category)
**Subcategories:** [breakdown]

### Next Steps
These items need deeper content. Recommend:
1. `/deep-research [slug]` — to write rich descriptions (start with most notable)
2. `/research-discovery images [category]` — to add images
3. `/seo-audit data` — to check data quality

**Items ready for deep research:**
| Item | Subcategory |
|------|-------------|
| [name] | [subcat] |
```

Update CHANGELOG.md and CONTEXT.md.

---

## Images Mode — Fill Missing Images

When invoked with `/research-discovery images [category]`, use `/research-images` to find and upload images.

See the `/research-images` skill for the full image search workflow, source priority, and upload steps.

---

## Data Quality Rules

- **Don't make up data** — Everything must be sourced
- **Minimum 1 source per item for discovery** (2+ preferred)
- **Track all source URLs** — JSON array in `sources`, set `source_count`
- **Use established categories** — Match existing schema values
- **Check existing items first** — Avoid duplicates

---

## Schema Reference

Check `migrations/001_initial.sql` for the current schema and established categories.

---

## Remember

- This is **discovery only** — find items, categorize, get basic info
- Do NOT write detailed descriptions — that's `/deep-research`
- Don't make up data — everything must be sourced
- Check existing items first to avoid duplicates
- Update CHANGELOG.md and CONTEXT.md when done
