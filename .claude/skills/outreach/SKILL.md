---
name: outreach
description: Run outreach campaigns for links, mentions, and partnerships. Usage: /outreach [command]
user_invokable: true
agent: marketing
---

# Outreach

You've been invoked to **run cold outreach campaigns** to get links, mentions, and partnerships.

**Usage:**
- `/outreach` — Show campaign status and recommend next action
- `/outreach campaign` — Plan and launch a new campaign
- `/outreach add [category]` — Add leads to active campaign
- `/outreach list` — List current targets and their status

---

## Cold Outreach Philosophy

**Never ask for a link in the first email.** Lead with value, start a conversation. The backlink comes naturally once they've engaged.

**Principles:**
- Under 10 lines. Casual, like emailing someone you know.
- Don't explain what our site is. Link to it and let them see.
- Give before you ask: share something useful, flag something relevant, ask for their input.
- One email, one thing. Don't cram.

**Good first-email CTAs:**
- "Thought these might work well for your audience"
- "Are we missing any good [items] in [area]?"
- "Wanted to let you know we featured your [thing]"
- "Would love to get your take on [specific thing]"

---

## Campaign Types

| Type | Target | Goal |
|------|--------|------|
| **Link building** | Bloggers, resource pages | Backlinks to our pages |
| **Guest posts** | Publications, industry sites | Exposure + links |
| **Partnership outreach** | Related businesses | Mutual promotion |
| **Local/industry press** | Publications, trade sites | Coverage + credibility |
| **Community engagement** | Reddit, forums, groups | Traffic + awareness |

---

## Command: Show Status (default)

Check what campaigns are running and recommend next actions.

### 1. Check Current State

- Read CHANGELOG.md and CONTEXT.md for recent outreach activity
- Check `docs/outreach-targets.md` if it exists
- Review any response tracking

### 2. Present and Recommend

```markdown
## Outreach Status

**Active Campaigns:** [count or "None"]
**Responses:** [count]
**Links acquired:** [count]

**Recommended Next Steps:**
1. **[Action]** — [Why]
2. **[Action]** — [Why]

**What do you want to do?**
```

---

## Command: Plan a Campaign

### 1. Define Goal

Before starting, clarify:
- **What do we want?** Links? Press coverage? Partnerships?
- **What can we offer?** Data, exposure, reciprocal links, content?
- **What's the hook?** Why should they care?

### 2. Identify Targets

**For link building:**
```
Search queries:
- "[topic] blog"
- "[topic] resource page"
- "[topic] guide links"
- "best [topic] resources"
```

**For industry partnerships:**
```bash
# Find categories with strongest content (best pitch material)
npx wrangler d1 execute [PROJECT]-db --remote --command "SELECT [CATEGORY_FIELD], COUNT(*) as items FROM [TABLE] GROUP BY [CATEGORY_FIELD] HAVING items >= 5 ORDER BY items DESC;"
```
Then search: "[category] [industry] company"

**For press/publications:**
```
- "[topic] publication"
- "[topic] news site"
- "[industry] journalist [topic]"
```

### 3. Research Each Target

Before reaching out, understand them:
- What have they covered before?
- What's their audience?
- Do they accept guest posts?
- What's their contact preference (email, form, Twitter)?

**Create a tracking list:**
```markdown
| Target | Type | Contact | Status | Notes |
|--------|------|---------|--------|-------|
| [Name] | blog | email@... | researched | Covers [topic], accepts guest posts |
```

### 4. Craft Personalized Pitch

**Resource page (give before asking):**
```
Subject: Data for your [topic] page

Hi [Name],

Found your [specific page] — great resource.

We have [X] researched [items] in [relevant area] that might be
useful for your readers:

  [DOMAIN]/[section]

Let me know if any of that is useful.

[Your Name]
[DOMAIN]
```

**Blogger (lead with a gift):**
```
Subject: [Topic] items your readers might love

Hi [Name],

I run [Site] ([DOMAIN]). Thought these might be useful
for your audience — 3 [items] that would make
great reading:

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

### 5. Send & Track

- Send personalized emails (not templates)
- Track who you contacted and when
- Don't spam — quality over quantity
- One follow-up after 1 week if no response
- After second email, move on

### 6. Track Results

```markdown
| Target | Type | Status | Result |
|--------|------|--------|--------|
| [Name] | blog | replied | Link added to their [article] |
| [Name] | press | no response | - |
| [Name] | podcast | replied | Discussing guest spot |
```

Save tracking to `docs/outreach-targets.md`.

**Measure:**
- Links acquired (check with `site:[domain] [your-domain]`)
- Referral traffic (if analytics available)
- Partnerships established
- Coverage/mentions

---

## Rules

- **Be genuine** — No spam, no bought links
- **Provide value** — Give them something useful
- **Personalize everything** — Reference their actual work, not generic flattery
- **Respect no** — One follow-up max, then move on
- **Track everything** — Know what's working
- **Quality over quantity** — 10 personalized emails > 100 templates

---

## After Campaign

- **CHANGELOG.md** — Campaign results
- **CONTEXT.md** — What worked, lessons learned
