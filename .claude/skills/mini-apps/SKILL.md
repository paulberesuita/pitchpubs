---
name: mini-apps
description: Ideas framework + build process for self-contained mini apps that drive product-led growth. Usage: /mini-apps
user_invokable: true
agent: product
---

# Mini Apps

You've been invoked to **build a self-contained mini app** related to this directory's theme. Mini apps are standalone experiences that earn traffic, links, and engagement on their own merit.

---

## Philosophy

Great mini apps:
- **Worth coming back to** — People return because it's useful, updated, or fun to revisit
- **Self-contained** — Works on its own without requiring the rest of the site
- **Shareable** — Results, outputs, or the experience itself is worth sharing
- **Fast** — Instant results, no friction, no loading spinners
- **Growth-driving** — Earns organic traffic, backlinks, or social shares

---

## Ideas Framework

Mini apps can take any form. Think beyond quizzes and calculators.

| Pattern | What it does |
|---------|-------------|
| **Finder / matcher** | Helps users find the right item — filters, preferences, "what's near me" |
| **Comparison engine** | Side-by-side compare, rankings, "which is better" |
| **Calculator / scorer** | Quantifies something — compatibility, cost, rating |
| **Explorer** | Visual way to browse data — maps, timelines, graphs |
| **Generator** | Creates something — names, plans, itineraries, playlists |
| **Quiz / assessment** | Personality-style results, trivia, knowledge checks |
| **Planner / builder** | Route planner, schedule builder, custom list builder |
| **Simulator** | "What if" scenarios, predictions, projections |

**The best ideas come from the data.** What questions can only YOUR dataset answer? What would someone Google that your data could power?

**Evaluate each idea:**
- [ ] Does it leverage our data in a way no one else can?
- [ ] Would someone share their result or send this to a friend?
- [ ] Can it rank for a search query on its own?
- [ ] Is it buildable with the data we have?

---

## Build Process

### 1. Define It
```markdown
**What it does:** [One sentence]
**Input:** [What the user provides]
**Output:** [What they get back]
**Growth angle:** [How this earns traffic or links]
```

### 2. Check Data
Does this need DB data? If yes, verify it exists and is sufficient.

### 3. Read Standards
- `/tasty-design` for colors, typography, components
- `/project-architecture` for API patterns

### 4. Build
```
functions/tools/[name].js           # Server-rendered (needs DB data)
  -- or --
public/tools/[name]/index.html      # Client-side (standalone)
```

Keep it simple: one HTML file if possible, vanilla JS, Tailwind. No frameworks.

### 5. Add Share Hooks
```javascript
function shareOnTwitter(result) {
  const text = encodeURIComponent(`My result: ${result.value}`);
  const url = encodeURIComponent(window.location.href);
  window.open(`https://twitter.com/intent/tweet?text=${text}&url=${url}`);
}

function updateShareableUrl(params) {
  const url = new URL(window.location);
  Object.entries(params).forEach(([k, v]) => url.searchParams.set(k, v));
  history.replaceState({}, '', url);
}
```

### 6. SEO Below the Fold
Every mini app page should have relevant content below the interactive section — context, related items, methodology. This is what Google indexes.

### 7. Deploy & Verify
```bash
wrangler pages deploy ./public --project-name=[PROJECT]
```
- [ ] Works end-to-end
- [ ] Enjoyable to use
- [ ] Share works
- [ ] Mobile-friendly
- [ ] No JS errors
- [ ] SEO content present below fold

### 8. Update Docs
- **CHANGELOG.md** — "Added: [app name]"
- **CONTEXT.md** — Why this app, growth angle, expected traffic
