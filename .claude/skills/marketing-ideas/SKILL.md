---
name: marketing-ideas
description: Brainstorm creative ways to leverage and repurpose content for growth. Usage: /marketing-ideas [focus?]
user_invokable: true
agent: marketing
---

# Marketing Ideas

You've been invoked to **brainstorm creative marketing ideas** — ways to leverage, repurpose, and amplify content for growth.

**Usage:**
- `/marketing-ideas` — Generate a fresh batch of ideas across all categories
- `/marketing-ideas social` — Social media content ideas
- `/marketing-ideas seasonal` — Seasonal/event-tied campaign ideas
- `/marketing-ideas repurpose` — Ways to repurpose existing content into new formats
- `/marketing-ideas viral` — High-shareability, attention-grabbing ideas
- `/marketing-ideas community` — Community building and engagement ideas

This skill is about **creative strategy**, not execution. Pick ideas you like, then use other skills/agents to build them.

---

## Before Brainstorming

Understand what we have to work with. Run a quick inventory:

```bash
# How much content do we have?
npx wrangler d1 execute [PROJECT]-db --remote --command "SELECT COUNT(*) as total_items, COUNT(CASE WHEN LENGTH(description) > 200 THEN 1 END) as with_content, COUNT(CASE WHEN LENGTH(image_url) > 0 THEN 1 END) as with_images FROM [TABLE];"
```

```bash
# Categories we cover
npx wrangler d1 execute [PROJECT]-db --remote --command "SELECT [CATEGORY_FIELD], COUNT(*) as count FROM [TABLE] WHERE LENGTH([CATEGORY_FIELD]) > 0 GROUP BY [CATEGORY_FIELD] ORDER BY count DESC;"
```

Use this data to make ideas specific and grounded in what we actually have.

---

## Idea Categories

### Social Media Content

Ideas for posts, threads, and series on social platforms.

**Formats to consider:**
- Short-form video (TikTok, Reels, Shorts)
- Photo carousels (Instagram, LinkedIn)
- Twitter/X threads
- Reddit posts (in relevant subreddits)
- Pinterest pins

**Idea starters:**
- "Top 5 [items] in [category]" — listicle from our data
- "The story behind [famous item]" — pull from deep research
- "Did you know?" — surprising fact from our data
- Weekly series: "[Topic] of the Week"
- Behind-the-scenes of building the directory
- Maps and data visualizations of coverage
- "Name this [item]" — engagement bait
- Data-driven hooks from our numbers

### Seasonal & Event-Tied Campaigns

Ideas tied to dates, holidays, or events.

**Calendar hooks:**
- **Major holidays** — themed content around relevant holidays
- **Awareness days/weeks** — National [Topic] Day, etc.
- **Seasonal trends** — What people search for at different times of year
- **Current events** — When our topic is in the news
- **Year-end** — "Best of [Year]" roundups
- **Local festivals** — Tie into topic-specific events and conventions

### Content Repurposing

Ways to turn existing data and content into new formats.

**Format ideas:**
- **Listicles** — "10 Most [Adjective] [Items] You Can Visit"
- **Maps** — Interactive map of items by category
- **Infographics** — "[Topic] by the Numbers"
- **Email newsletter** — Weekly item spotlight
- **Podcast** — Read deep research stories as audio
- **Video scripts** — Already have `/write-script`, could do series
- **Printable guides** — "[Topic] Guide for [Location]" PDF
- **Quizzes** — "Which [Item] Should You Visit?" personality quiz
- **Data reports** — Annual "State of [Topic]" report

### Viral & High-Shareability

Ideas designed to get attention and shares.

**Angles:**
- **Rankings** — "We ranked every [category]. Here's the list."
- **Challenge** — "Visit all [X] [items]" passport/checklist
- **Unexpected data** — Surprising insight that defies expectations
- **Celebrity angle** — Items connected to famous people/events
- **Debunking** — "We researched [famous claim] and here's what we found"
- **User-generated** — "Submit your experience" campaign
- **Local pride** — Content that gets shared by local communities

### Community Building

Ideas for building an engaged audience.

**Approaches:**
- **Reddit presence** — Contribute to relevant subreddits with genuine value (not spam)
- **User submissions** — Let visitors submit their own experiences
- **Local experts** — Feature experts, guides, historians
- **Monthly spotlight** — Community votes on next item to deep-research
- **Photo contests** — "Best photo of a [item]" user submissions
- **Expert partnerships** — Feature professionals in the space

---

## How to Present Ideas

When brainstorming, present ideas in this format:

```markdown
## Marketing Ideas

### Quick Wins (can do this week)
1. **[Idea name]** — [1-line description]
   - **Content needed:** [what we already have vs what we'd create]
   - **Channel:** [where it goes]
   - **Why now:** [timeliness or opportunity]

### Medium Effort (1-2 weeks)
1. **[Idea name]** — [1-line description]
   - **Content needed:** [what's involved]
   - **Expected impact:** [reach, links, traffic]

### Big Swings (ongoing campaigns)
1. **[Idea name]** — [1-line description]
   - **What it is:** [fuller description]
   - **Why it could work:** [reasoning]
   - **First step:** [how to start small]

**Which ideas interest you?**
```

---

## Evaluation Criteria

Rate ideas on:

| Criteria | Question |
|----------|----------|
| **Leverage** | Does it use content we already have? |
| **Shareability** | Would someone send this to a friend? |
| **Effort** | Can we execute it quickly? |
| **Durability** | Is it evergreen or one-time? |
| **Link potential** | Could it earn backlinks? |
| **Brand fit** | Does it match our voice (research-backed, not clickbait)? |

Prioritize ideas that score high on leverage (uses existing content) and shareability.

---

## Rules

- **Be specific** — Use actual data and item names, not generic ideas
- **Ground in reality** — Only suggest what we can actually execute
- **Quality over quantity** — 5 great ideas > 20 mediocre ones
- **Stay on brand** — Research-backed and genuine, not clickbait or sensationalist
- **Think distribution** — An idea is only as good as how it reaches people
- **Start small** — Every big campaign should have a "test it with one post" version
- **Flag product work** — If an idea requires building something on the site, note it as product agent work

---

## After Work Completes

- Save promising ideas to `## Marketing` section of `BACKLOG.md`
- Note which ideas were chosen for execution in `CONTEXT.md`
