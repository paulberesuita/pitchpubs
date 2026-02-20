---
name: seo-audit
description: Audit SEO health, find page opportunities, and check sitemap. Usage: /seo-audit [mode?]
user_invokable: true
agent: seo
---

# SEO Audit

You've been invoked to **audit SEO health** across the site — check what's working, what's broken, and recommend what to build or fix.

- `/seo-audit` — Full audit (all checks below)
- `/seo-audit sitemap` — Sitemap health check only
- `/seo-audit content` — Thin content + internal linking check
- `/seo-audit pages` — Find page opportunities only
- `/seo-audit data` — Data quality check (missing fields, bad categories, under-sourced)

---

## Full Audit

### 1. Check Meta Tags

Sample one page from each type and verify:

```bash
# Homepage
curl -s https://[DOMAIN]/ | grep -E '<title>|<meta name="description"|<meta property="og:|<meta name="twitter:'

# A category/section page
curl -s https://[DOMAIN]/[section]/[sample] | grep -E '<title>|<meta name="description"|<meta property="og:|<meta name="twitter:'

# A detail page
curl -s https://[DOMAIN]/[section]/[sample-slug] | grep -E '<title>|<meta name="description"|<meta property="og:|<meta name="twitter:'
```

### 2. Check Structured Data

```bash
# Check for JSON-LD on detail page
curl -s https://[DOMAIN]/[section]/[sample-slug] | grep -o '<script type="application/ld+json">.*</script>'

# Check category page
curl -s https://[DOMAIN]/[section]/[sample] | grep -o '<script type="application/ld+json">.*</script>'
```

### 3. Check Sitemap & Robots

```bash
# Sitemap exists and has content
curl -s https://[DOMAIN]/sitemap.xml | head -20

# Robots.txt
curl -s https://[DOMAIN]/robots.txt
```

### 4. Run All Checks

After meta tags, structured data, and sitemap/robots, also run:
- **Thin Content Check** (see below)
- **Internal Linking Check** (see below)
- **Broken Links / 404 Check** (see below)
- **Image SEO Check** (see below)
- **Indexing Check** (see below)
- **Data Quality Check** (see below)

### 5. Present Audit Results

```markdown
## SEO Audit Results

### Meta Tags
| Page Type | Title | Description | OG Tags | Twitter Cards |
|-----------|-------|-------------|---------|---------------|
| Homepage  | [ok/missing] | [ok/missing] | [ok/missing] | [ok/missing] |
| Section   | [ok/missing] | [ok/missing] | [ok/missing] | [ok/missing] |
| Detail    | [ok/missing] | [ok/missing] | [ok/missing] | [ok/missing] |

### Structured Data
| Page Type | Schema Type | Status |
|-----------|-------------|--------|
| Homepage  | WebSite     | [ok/missing] |
| Section   | ItemList    | [ok/missing] |
| Detail    | [Type]      | [ok/missing] |

### Sitemap Health
- [X/Y URLs match] — [see details below]

### Thin Content
- [X] items with thin descriptions (<200 chars)
- [Y] items with no description at all

### Internal Linking
- [ok/missing] Detail -> section links
- [ok/missing] Detail -> related items
- [ok/missing] Section -> detail links

### Broken Links
- [X] broken links found across [Y] pages checked

### Image SEO
- [X]% of items have images
- Alt text: [ok/missing/generic]
- Lazy loading: [ok/missing]

### Indexing
- ~[X] pages indexed by Google (vs [Y] expected)

### Data Quality
- [X] items missing key fields
- [Y] under-sourced entries (<2 sources)
- [Z] invalid categories

### Robots.txt
- [ok/missing/issues]

### Recommendations
**High priority:**
- [issues that hurt rankings]

**Medium priority:**
- [improvements that help]

**Low priority:**
- [nice-to-haves]
```

---

## Sitemap Health Check

When invoked with `/seo-audit sitemap` or as part of a full audit.

### 1. Fetch and Parse Sitemap

```bash
# Get the sitemap
curl -s https://[DOMAIN]/sitemap.xml > /tmp/sitemap.xml

# Count URLs in sitemap
grep -c '<loc>' /tmp/sitemap.xml
```

### 2. Compare Against Database

```bash
# Total items in DB
npx wrangler d1 execute [PROJECT]-db --remote --json --command "SELECT COUNT(*) as total FROM [TABLE]"

# Get all item slugs from DB
npx wrangler d1 execute [PROJECT]-db --remote --json --command "SELECT slug FROM [TABLE] ORDER BY slug"
```

### 3. Cross-Reference

Check that the sitemap includes:
- `https://[DOMAIN]/` (homepage)
- `https://[DOMAIN]/[section]` (section index)
- `https://[DOMAIN]/[section]/[slug]` for every item in DB
- Any category pages, location pages, or other programmatic pages that exist

**Find missing URLs:**
- Extract all slugs from sitemap
- Compare against all slugs in DB
- Report any items in DB but not in sitemap
- Report any URLs in sitemap that return 404

### 4. Validate URLs

Spot-check a sample of sitemap URLs to make sure they return 200:

```bash
# Check 5 random URLs from the sitemap
curl -sI https://[DOMAIN]/[section]/[slug1] | head -1
curl -sI https://[DOMAIN]/[section]/[slug2] | head -1
curl -sI https://[DOMAIN]/[section]/[slug3] | head -1
```

### 5. Report Sitemap Health

```markdown
## Sitemap Health

**URLs in sitemap:** [X]
**Expected URLs:** [Y] (1 homepage + section pages + [M] items + [P] other pages)
**Match:** [X/Y] ([percentage]%)

### Missing from Sitemap
| URL | Type | Issue |
|-----|------|-------|
| /[section]/[slug] | item | In DB but not in sitemap |

### Dead URLs in Sitemap
| URL | Status | Issue |
|-----|--------|-------|
| /[section]/[slug] | 404 | In sitemap but returns 404 |

### Recommendations
- [Fix sitemap generation if URLs are missing]
- [Remove dead URLs]
- [Submit updated sitemap to Google Search Console]
```

---

## Page Opportunities

When invoked with `/seo-audit pages` or as part of a full audit.

### 1. Find Opportunities

```bash
# Groupings with 5+ items (candidates for section pages)
npx wrangler d1 execute [PROJECT]-db --remote --command "SELECT [GROUPING_FIELD], COUNT(*) as items FROM [TABLE] GROUP BY [GROUPING_FIELD] HAVING items >= 5 ORDER BY items DESC;"

# Category distribution (for category pages)
npx wrangler d1 execute [PROJECT]-db --remote --command "SELECT [CATEGORY_FIELD], COUNT(*) as count FROM [TABLE] GROUP BY [CATEGORY_FIELD] ORDER BY count DESC;"
```

### 2. Check What Pages Already Exist

```bash
# Check if category/section pages exist
curl -sI https://[DOMAIN]/[section]/[sample] | head -1
```

### 3. Present Opportunities

```markdown
## Page Opportunities

### Grouping Pages (not yet built)
| Grouping | Items | Est. Search Volume | Priority |
|----------|-------|--------------------|----------|
| [Group 1] | 26 | High | Build first |
| [Group 2] | 18 | High | Build first |

### Category Pages (not yet built)
| Category | Count | Est. Search Volume | Priority |
|----------|-------|--------------------|----------|
| [cat 1] | 148 | High | Build |
| [cat 2] | 69 | Medium | Build |

### What to Build Next
Recommend the top 3 pages to build, with reasoning.

**To build these, use:**
- `/project-architecture` for API patterns
- `/tasty-design` for UI components
```

---

## Thin Content Check

When invoked with `/seo-audit content` or as part of a full audit.

Google penalizes pages with little useful content. Find items that are too thin to rank.

### 1. Query Thin Pages

```bash
# Items with very short descriptions (under 200 chars)
npx wrangler d1 execute [PROJECT]-db --remote --command "SELECT slug, name, LENGTH(description) as desc_len FROM [TABLE] WHERE LENGTH(description) < 200 ORDER BY desc_len ASC LIMIT 30;"

# Items with no description at all
npx wrangler d1 execute [PROJECT]-db --remote --command "SELECT slug, name FROM [TABLE] WHERE description IS NULL OR description = '' OR LENGTH(description) < 50;"

# Overall thin content stats by category
npx wrangler d1 execute [PROJECT]-db --remote --command "SELECT [CATEGORY_FIELD], COUNT(*) as total, SUM(CASE WHEN LENGTH(description) < 200 THEN 1 ELSE 0 END) as thin, SUM(CASE WHEN LENGTH(description) >= 500 THEN 1 ELSE 0 END) as rich FROM [TABLE] GROUP BY [CATEGORY_FIELD] ORDER BY thin DESC;"
```

### 2. Report

```markdown
## Thin Content Report

**Total items:** [X]
**Rich (500+ chars):** [Y] ([%])
**Thin (<200 chars):** [Z] ([%])
**Empty/near-empty:** [W]

### Worst Offenders
| Item | Category | Description Length | Action |
|------|----------|-------------------|--------|
| [name] | [cat] | [X] chars | Run `/deep-research [slug]` |

### Categories with Most Thin Content
| Category | Total | Thin | Rich | Action |
|----------|-------|------|------|--------|
| [cat] | [X] | [Y] | [Z] | Prioritize for `/deep-research` |
```

---

## Internal Linking Check

Check that pages link to related content — this distributes SEO authority across the site.

### 1. Check Detail -> Section Links

```bash
# Fetch a detail page and check for link back to section page
curl -s https://[DOMAIN]/[section]/[slug] | grep -o 'href="/[section]/[^"]*"'
```

### 2. Check Detail -> Related Items

```bash
# Fetch a detail page and check for links to other items
curl -s https://[DOMAIN]/[section]/[slug] | grep -o 'href="/[section]/[^"]*"' | head -10
```

### 3. Check Section -> Detail Links

```bash
# Fetch a section page and check it links to its items
curl -s https://[DOMAIN]/[section]/ | grep -o 'href="/[section]/[^"]*"' | wc -l
```

### 4. Find Linking Gaps

```bash
# Categories with multiple items — these should cross-link
npx wrangler d1 execute [PROJECT]-db --remote --command "SELECT [CATEGORY_FIELD], COUNT(*) as items FROM [TABLE] GROUP BY [CATEGORY_FIELD] HAVING items >= 3 ORDER BY items DESC LIMIT 20;"
```

### 5. Report

```markdown
## Internal Linking Report

### Detail Pages
- [ok/missing] Link back to section page
- [ok/missing] Links to other items in same category
- [ok/missing] Links to related items

### Section Pages
- [ok/missing] Links to all items in section
- [ok/missing] Links to related sections

### Recommendations
- [Add "Other [items] in [Category]" section to detail pages]
- [Add "Related [items]" section]
- [Ensure section page lists all items]
```

---

## Broken Links / 404 Check

### 1. Spot-Check Internal Links

Fetch a few pages and verify their internal links resolve:

```bash
# Get all internal links from a section page
curl -s https://[DOMAIN]/[section]/ | grep -o 'href="/[^"]*"' | sort -u | head -20
```

Then spot-check each link returns 200.

### 2. Check Recently Added Items

```bash
# Get the newest items and verify their pages load
npx wrangler d1 execute [PROJECT]-db --remote --command "SELECT slug FROM [TABLE] ORDER BY rowid DESC LIMIT 10;"
```

Then spot-check each:
```bash
curl -sI https://[DOMAIN]/[section]/[slug] | head -1
```

### 3. Report

```markdown
## Broken Links Report

**Pages checked:** [X]
**Broken links found:** [Y]

| Source Page | Broken Link | Status |
|------------|-------------|--------|
| /[section] | /[section]/[slug] | 404 |
```

---

## Image SEO Check

### 1. Check Alt Text

```bash
# Fetch a detail page and check images have alt text
curl -s https://[DOMAIN]/[section]/[slug] | grep -o '<img[^>]*>' | head -5
```

Look for:
- `alt=""` or missing `alt` attribute — bad for SEO
- Generic alt text like "image" — not helpful
- Descriptive alt text — good

### 2. Check Image Loading

```bash
# Check if images use lazy loading
curl -s https://[DOMAIN]/[section]/[slug] | grep -o '<img[^>]*loading="lazy"[^>]*>'

# Check for width/height attributes (prevents CLS)
curl -s https://[DOMAIN]/[section]/[slug] | grep -o '<img[^>]*width="[^"]*"[^>]*>'
```

### 3. Check Image Sizes

```bash
# Spot-check image file sizes (should be under 200KB ideally)
curl -sI https://[DOMAIN]/images/items/[slug].jpg | grep -i content-length
```

### 4. Find Items Missing Images

```bash
npx wrangler d1 execute [PROJECT]-db --remote --command "SELECT slug, name FROM [TABLE] WHERE image_url IS NULL OR image_url = '' ORDER BY name LIMIT 20;"
```

### 5. Report

```markdown
## Image SEO Report

**Items with images:** [X]/[Y] ([%])
**Items missing images:** [Z]

### Alt Text
- [ok/missing/generic] on detail pages
- Sample: `[actual alt text found]`

### Performance
- [ok/missing] Lazy loading attribute
- [ok/missing] Width/height attributes
- Average image size: ~[X]KB

### Missing Images
| Item | Category | Action |
|------|----------|--------|
| [name] | [cat] | Run `/research-discovery images [category]` |
```

---

## Indexing Check

Check if Google is actually picking up our pages.

### 1. Check Indexed Pages

Use WebSearch:
```
site:[DOMAIN]
```

Note the approximate result count.

### 2. Check Key Pages Are Indexed

Use WebSearch to verify specific pages appear in Google:

```
site:[DOMAIN]/[section]/[sample-slug]
```

### 3. Compare Results

Compare results count against DB counts.

### 4. Report

```markdown
## Indexing Report

**Estimated indexed pages:** ~[X] (via site: search)
**Expected pages:** [Y] (homepage + section pages + [M] items)
**Index coverage:** ~[%]

### Key Pages
| Page | Indexed? |
|------|----------|
| Homepage | [yes/no] |
| /[section]/[sample] | [yes/no] |
| /[section]/[sample-slug] | [yes/no] |

### Recommendations
- [Submit sitemap to Google Search Console if not done]
- [Check for noindex tags blocking crawling]
- [Request indexing for key pages]
```

---

## Data Quality Check

When invoked with `/seo-audit data` or as part of a full audit. Bad data = bad pages = bad SEO.

### 1. Run Diagnostic Queries

```bash
# Missing key fields
npx wrangler d1 execute [PROJECT]-db --remote --command "SELECT slug, name FROM [TABLE] WHERE description IS NULL OR LENGTH(description) < 50;"

# Missing source URLs
npx wrangler d1 execute [PROJECT]-db --remote --command "SELECT slug, name FROM [TABLE] WHERE source_url IS NULL OR LENGTH(source_url) < 5;"

# Category distribution (check for typos or non-standard categories)
npx wrangler d1 execute [PROJECT]-db --remote --command "SELECT [CATEGORY_FIELD], COUNT(*) as count FROM [TABLE] GROUP BY [CATEGORY_FIELD] ORDER BY count DESC;"

# Under-sourced entries (less than 2 sources)
npx wrangler d1 execute [PROJECT]-db --remote --command "SELECT slug, name, source_count FROM [TABLE] WHERE source_count < 2 OR source_count IS NULL ORDER BY source_count ASC LIMIT 30;"
```

### 2. Report

```markdown
## Data Quality Report

**Total items checked:** [X]

### Missing Fields
| Issue | Count | Impact |
|-------|-------|--------|
| Missing/thin description | [X] | Thin pages hurt SEO ranking |
| Missing source URLs | [Y] | Can't verify data, credibility issue |
| Under-sourced (<2) | [W] | Weak content authority |

### Invalid Categories
| Category | Count | Suggested Fix |
|----------|-------|---------------|
| [typo] | [X] | Change to [correct] |

### Recommended Fixes
1. **[Fix]** — Create migration script for [issue]
2. **[Fix]** — Run `/research-discovery [category]` to fill gaps
3. **[Fix]** — Standardize categories with UPDATE query

**Fixes should be written as SQL migration scripts in `scripts/fix-[issue].sql`.**
Report issues before fixing — don't run ad-hoc updates.
```

---

## SEO Checklist by Page Type

Every page must have:
- Title tag (unique, keyword-rich, <60 chars)
- Meta description (compelling, <160 chars)
- Open Graph tags (og:title, og:description, og:image, og:type)
- Twitter card tags
- Canonical URL
- Structured data (Schema.org JSON-LD)
- Internal links to related pages
- Semantic HTML (h1, article, nav)

Schema types and title patterns are in `/project-architecture`.

---

## Verification Tools

After any SEO changes:
- **Structured data:** https://search.google.com/test/rich-results
- **OG tags:** Facebook Sharing Debugger
- **Sitemap:** Submit to Google Search Console

---

## Remember

- This skill **audits and recommends** — the SEO agent builds
- Always check sitemap health when new items are added
- All pages need proper SEO elements before launch
- Update CHANGELOG.md and CONTEXT.md after fixes
