---
name: delights
description: Small, thoughtful details that make people smile. Usage: /delights
user_invokable: true
agent: product
---

# Delights

The little things that make someone pause and think "oh, that's nice." Not hidden — front and center. Craft that shows someone cared.

Think: motion, color, interactions, transitions, personality. The stuff that turns a functional site into one people remember.

---

## What We Have

*(Update this section as delights are implemented)*

- None yet — this is a fresh project

---

## Ideas

### Interactions

- **Hover animations** — Satisfying card hover effects, subtle lifts and shadows
- **Themed cursor effects** — Cursor-related effects on key pages
- **Heartbeat on hover** — Subtle pulse animation when hovering over item cards
- **Scroll-reactive header** — Transparent to solid on scroll

### Personality

- **Custom 404 page** — When someone hits a dead page, show a themed error with character
- **Fun empty states** — "No [items] found here... yet" instead of "No results"
- **Weather/time-aware theme** — Slightly different mood at night vs. day based on local time
- **Seasonal shifts** — Holiday or seasonal changes to the theme
- **Loading states with personality** — Themed text instead of a spinner

### Motion

- **Card entrance animations** — Items fade/slide in as you scroll down
- **Page transition effects** — Smooth transitions between page types
- **Hover micro-animations** — Category icons wobble, images zoom slightly
- **Parallax elements** — Subtle depth effects on scroll

### Data Surprises

- **"Did you know?" tooltips** — Fun facts about items with interesting details
- **Random item button** — Takes you somewhere unexpected
- **Fun stats on homepage** — "We track [X] items across [Y] categories"
- **Console message** — A fun ASCII message for developers who check the console

---

## Principles

- **Noticed, not announced** — No tooltips explaining the delight. People discover it.
- **Enhances, never blocks** — Animations and effects never slow down the core experience.
- **Consistent mood** — Every detail should feel like it belongs in the same world.
- **Accessible** — Respect `prefers-reduced-motion`. Sound is always optional.
- **Layered** — First visit you notice one thing. Third visit you notice another.

---

## Inventory Check

Before adding new delights, check what exists:

1. **Search for existing delights:**
   - Check all SSR functions for easter eggs, special messages, animations
   - Check CSS/JS for micro-interactions beyond standard hover states
   - Check empty states and error pages for personality

2. **Present inventory:**
   ```markdown
   ## Current Delights
   - [List of existing delights, or "None yet"]

   ## Ideas to Add
   1. [Idea] — [Where, what triggers it]
   2. [Idea] — [Where, what triggers it]
   ```

---

## Build Process

### 1. Pick a Delight

Choose based on:
- What's missing from the inventory
- What would have the most impact for the effort
- What fits the site's current personality

**Quick Wins (< 30 min each):**
- Custom 404 page with personality
- Fun empty state messages
- Themed favicon
- Hover effects on cards
- Loading state with themed text

**Medium Effort (1-2 hours):**
- "Random item" button
- Fun stats on homepage
- Seasonal theme variations
- Scroll-reactive header
- Console message easter egg

**Big Swings (half day):**
- Achievement system for exploring
- Themed mini-game hidden somewhere
- Animated entrance effects
- Time-of-day theme changes

### 2. Read Standards

- `/tasty-design` — Must fit the design language
- `/project-architecture` — Must not break SSR patterns

### 3. Implement

Keep it contained:
- Delights should be additive, not require restructuring
- Use CSS animations where possible (lighter than JS)
- Don't slow down page load for a delight
- Respect `prefers-reduced-motion`

### 4. Test

- Does it work on mobile?
- Does it interfere with normal usage?
- Is it discoverable but not in-your-face?

---

## After Adding

- Update the "What We Have" section above
- **CHANGELOG.md** — Note the delight added
- **CONTEXT.md** — What inspired it
