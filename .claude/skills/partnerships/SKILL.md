---
name: partnerships
description: Find, evaluate, and close partnership deals with complementary sites, podcasts, bloggers, and businesses. Usage: /partnerships [command]
user_invokable: true
agent: marketing
---

# Partnerships

You've been invoked to **find and manage partnership opportunities** — complementary directories, podcasts, bloggers, businesses, and community sites.

**Usage:**
- `/partnerships` — Show current partnership pipeline and recommend next steps
- `/partnerships find [category]` — Research new partnership targets in a category
- `/partnerships evaluate [name/url]` — Deep-dive on a potential partner
- `/partnerships pitch [name]` — Draft a personalized partnership pitch

This skill is about **building real relationships** — not cold email blasts (that's `/outreach`).

---

## Partnership Categories

| Category | Who | What We Offer | What We Get |
|----------|-----|---------------|-------------|
| **Content partners** | Blog/site with audience | Data, quotes, co-created content | Backlink + referral traffic |
| **Directory partners** | Complementary directory | Cross-linking, shared audiences | Mutual links + traffic |
| **Business partners** | Products/services in the space | Featured listing + promotion | Credibility + links |
| **Media partners** | Podcasts, newsletters, publications | Exclusive data, guest spot | Exposure + backlink |
| **Community partners** | Forums, groups, communities | Resources, tools | Engagement + awareness |

---

## Command: Show Pipeline (default)

Check the current state of partnerships.

### 1. Check existing partnerships

```bash
cat docs/partnerships.md 2>/dev/null || echo "No partnership tracking file yet"
```

### 2. Check our strongest content (best partnership leverage)

```bash
npx wrangler d1 execute [PROJECT]-db --remote --command "SELECT [CATEGORY_FIELD], COUNT(*) as items FROM [TABLE] GROUP BY [CATEGORY_FIELD] ORDER BY items DESC LIMIT 10;"
```

### 3. Present state and recommend

```markdown
## Partnership Pipeline

**Active Partnerships:** [count]
- [Partner] — [status, what we exchanged]

**Categories With Most Leverage:** (strong pitch material)
- [Category] — [X] items

**Recommended Next Steps:**
1. **[Action]** — [Why this partner, what's the angle]
2. **[Action]** — [Why]

**What do you want to do?**
```

---

## Command: Find Partners

Research potential partners in a category.

### Content Partners / Bloggers

```
Search queries:
- "[topic] blog"
- "[topic] blogger"
- "[topic] newsletter"
- "best [topic] guide"
```

**Evaluate each:**
- Do they cover our topic from a complementary angle?
- How big are they? (Multi-topic = higher value)
- Do they have a website with a links/resources page?
- What's their social following?

### Podcasts

```
Search queries:
- "[topic] podcast"
- "[topic] podcast guest"
- "[related topic] podcast"
```

**Evaluate each:**
- Episode count (established = better)
- Do they feature guests?
- Audience size (check Apple Podcasts ratings, Spotify)
- Would our data/content fit their format?

### Complementary Directories

```
Search queries:
- "[topic] directory"
- "[related topic] database"
- "[topic] finder"
```

**Evaluate each:**
- Do they cover something we don't?
- Do they link to external resources?
- Is there a natural cross-promotion angle?

---

## Command: Evaluate Partner

Deep-dive on a specific potential partner.

### Research checklist:

1. **Their content** — What do they cover? How does it overlap with ours?
2. **Their audience** — Size, demographics, engagement
3. **Their links** — Do they link to external resources? Do they have a partners page?
4. **Contact info** — Who to reach out to, preferred method
5. **Partnership fit** — What would a deal look like?

### Output format:

```markdown
## Partner Evaluation: [Name]

**Website:** [URL]
**Category:** [content / directory / business / media / community]
**Audience:** [Size estimate, demographics]

**Overlap with our site:**
- Topics/categories they cover that we also cover
- Content overlap

**Partnership Opportunity:**
- **What we'd offer:** [specific value]
- **What we'd get:** [specific value]
- **Deal structure:** [link exchange, featured listing, guest spot, etc.]

**Contact:** [name, email, preferred method]
**Fit score:** [High / Medium / Low] — [why]
```

---

## Command: Pitch Partner

Draft a personalized partnership pitch.

### Before pitching, confirm:
- We've evaluated this partner (run `/partnerships evaluate` first)
- We have something specific to offer them
- The pitch references their actual content

### Cold Outreach Philosophy

**Never ask for a link in the first email.** Lead with value, start a conversation. The backlink comes naturally once they've engaged.

**Principles:**
- Under 10 lines. Casual, like emailing someone you know.
- Don't explain what our site is. Link to it and let them see.
- Give before you ask: share something useful, flag something relevant, ask for their input.
- One email, one thing. Don't cram.

### Pitch templates by category:

**Content Partner (lead with a gift):**
```
Subject: [Topic] data your readers might love

Hi [Name],

I run [Site] ([DOMAIN]). Thought these might be useful
for your readers:

  [DOMAIN]/[section]/[slug1]
  [DOMAIN]/[section]/[slug2]
  [DOMAIN]/[section]/[slug3]

Are there any [items] we're missing?

[Your Name]
[DOMAIN]
```

**Podcast (offer stories, not self-promotion):**
```
Subject: A story you probably haven't heard

Hi [Name],

Loved [specific episode]. Quick one — I've been researching
[topic] and found some stories that might work for the show:

  [Compelling story hook with specific detail]
  [Another angle]

Happy to share more if any of those sound interesting.

[Your Name]
[DOMAIN]
```

**Directory (mutual value):**
```
Subject: [Topic] data

Hi [Name],

Saw your [specific page] — great resource.

We have [X] researched [items] that might be
useful for your visitors:

  [DOMAIN]/[section]

Let me know if any of that is useful.

[Your Name]
[DOMAIN]
```

---

## Tracking

Track all partnerships in `docs/partnerships.md`:

```markdown
# Partnership Pipeline

## Active
| Partner | Category | Status | We Give | We Get | Contact |
|---------|----------|--------|---------|--------|---------|
| [Name] | content | live | data | backlink | [email] |

## In Progress
| Partner | Category | Stage | Next Step | Last Contact |
|---------|----------|-------|-----------|--------------|
| [Name] | podcast | pitched | waiting for reply | 2026-02-12 |

## Prospects
| Partner | Category | Fit | Notes |
|---------|----------|-----|-------|
| [Name] | directory | High | Covers our top categories |
```

---

## Rules

- **Genuine value exchange** — Both sides should benefit
- **Research first** — Know their content before reaching out
- **Be specific** — Reference their actual work, not generic flattery
- **One follow-up** — If no response after follow-up, move on
- **Track everything** — Update `docs/partnerships.md` after every interaction
- **Quality over quantity** — 5 strong partnerships > 50 weak ones

---

## After Work Completes

- **CHANGELOG.md** — Partnerships initiated or closed
- **CONTEXT.md** — What worked, lessons learned
- Update `docs/partnerships.md` with current pipeline
