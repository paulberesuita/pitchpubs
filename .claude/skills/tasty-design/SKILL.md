---
name: tasty-design
description: Load UI guidance — colors, typography, components, design language. Usage: /tasty-design
user_invokable: true
---

# Tasty Design

Elevated design system for directory sites. Inspired by Arc, Airbnb, OpenAI, Anthropic — restraint over decoration, warmth over sterility, space over clutter.

**No gradients. Ever.** Use solid colors and shadows for depth.

---

## Taste

Seven principles that separate "clean" from "tasteful":

1. **Restraint** — Remove until it breaks. Every element earns its place.
2. **Warm canvas** — Off-white backgrounds, stone-based neutrals. Never pure white, never cold gray.
3. **Generous space** — Sections breathe. Padding is a feature, not waste.
4. **Dual typography** — A display font for headlines, a sans-serif for body. The contrast creates hierarchy without decoration.
5. **Content-first** — The data IS the design. Beautiful cards, clear typography, smart information density.
6. **Entrance motion** — Elements fade in on load. Pages feel alive, not stamped.
7. **One accent color** — A single, intentional color for actions and highlights. Everything else is neutral.

---

## Setup

All pages use `renderHead()` from `functions/_shared/layout.js`, which includes fonts, Tailwind config, animation keyframes, and color tokens.

**What `renderHead()` provides:**

```html
<!-- Google Fonts preconnect -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
<!-- Add display font during setup, e.g.: &family=Playfair+Display:wght@400;700 -->

<!-- Tailwind CDN + config -->
<script src="https://cdn.tailwindcss.com"></script>
<script>
  tailwind.config = {
    theme: {
      extend: {
        fontFamily: {
          sans: ['Inter', 'system-ui', 'sans-serif'],
          // display: ['Playfair Display', 'serif'],  // Activate during setup
        },
        colors: {
          'primary': '#1c1917',
          'primary-hover': '#44403c',
          'background': '#faf9f7',
          'surface': '#f5f5f4',
          'surface-hover': '#efedeb',
          'border': '#e7e5e3',
          'muted': '#78716c',
          'accent': '#1c1917',        // [SET DURING SETUP]
          'accent-hover': '#44403c',  // [SET DURING SETUP]
          'error': '#dc2626',
          'error-bg': '#fef2f2',
          'success': '#16a34a',
          'success-bg': '#f0fdf4',
        },
        keyframes: {
          'fade-in': {
            '0%': { opacity: '0' },
            '100%': { opacity: '1' },
          },
          'fade-in-up': {
            '0%': { opacity: '0', transform: 'translateY(16px)' },
            '100%': { opacity: '1', transform: 'translateY(0)' },
          },
        },
        animation: {
          'fade-in': 'fade-in 0.6s ease-out forwards',
          'fade-in-up': 'fade-in-up 0.6s ease-out forwards',
        },
      }
    }
  }
</script>
<style>
  .stagger-1 { animation-delay: 0ms; }
  .stagger-2 { animation-delay: 80ms; }
  .stagger-3 { animation-delay: 160ms; }
  .stagger-4 { animation-delay: 240ms; }
  .stagger-5 { animation-delay: 320ms; }
  .stagger-6 { animation-delay: 400ms; }
  [class*="animate-fade-in"] { opacity: 0; }
</style>
```

**During setup**, the setup agent activates:
- A display font via `font-display` family
- An accent color replacing the neutral placeholder
- A color palette matching the directory topic

---

## Color Palette

| Token | Hex | Usage |
|-------|-----|-------|
| `primary` | `#1c1917` | Text, primary actions |
| `primary-hover` | `#44403c` | Hover state for primary |
| `background` | `#faf9f7` | Page background (warm off-white) |
| `surface` | `#f5f5f4` | Card/section backgrounds |
| `surface-hover` | `#efedeb` | Hover state for surface elements |
| `border` | `#e7e5e3` | Borders, dividers |
| `muted` | `#78716c` | Secondary text, labels, captions |
| `accent` | `[SET DURING SETUP]` | CTA buttons, active states, links |
| `accent-hover` | `[SET DURING SETUP]` | Hover for accent elements |
| `error` | `#dc2626` | Error states |
| `success` | `#16a34a` | Success states |

**Warm canvas principle:** The background (`#faf9f7`) has a subtle warmth — not pure white, not yellow. Surface (`#f5f5f4`) sits one step darker. This creates depth without shadows.

**Before setup:** `accent` defaults to `primary` (neutral). After setup, it becomes the directory's signature color.

---

## Typography

### Dual-Font Pattern

The system supports two font families:
- **`font-sans`** (Inter) — Body text, UI elements, navigation
- **`font-display`** — Headlines, hero text, page titles (activated during setup)

Before setup, everything uses Inter. During setup, a display font is added for personality.

### Scale

| Element | Classes |
|---------|---------|
| H1 (hero) | `text-4xl md:text-5xl lg:text-6xl font-bold tracking-tight` |
| H2 (section) | `text-2xl md:text-3xl font-semibold tracking-tight` |
| H3 (card/subsection) | `text-xl font-semibold` |
| Body | `text-base` |
| Helper | `text-sm text-muted` |
| Caption | `text-xs text-muted` |

When a display font is active, add `font-display` to H1 and H2 elements.

### Font Pairings

| Mood | Display Font | Body Font | Google Fonts |
|------|-------------|-----------|--------------|
| Editorial / Luxury | Playfair Display | Inter | `family=Playfair+Display:wght@400;700&family=Inter:wght@400;500;600;700` |
| Modern / Tech | Space Grotesk | Inter | `family=Space+Grotesk:wght@400;500;700&family=Inter:wght@400;500;600;700` |
| Warm / Friendly | DM Serif Display | Inter | `family=DM+Serif+Display&family=Inter:wght@400;500;600;700` |
| Bold / Energetic | Archivo Black | Inter | `family=Archivo+Black&family=Inter:wght@400;500;600;700` |
| Classic / Trustworthy | Libre Baskerville | Inter | `family=Libre+Baskerville:wght@400;700&family=Inter:wght@400;500;600;700` |

---

## Spacing

Generous defaults — the layout breathes.

| Context | Value | Classes |
|---------|-------|---------|
| Card padding | 20px | `p-5` |
| Section vertical | 64px+ | `py-16` |
| Hero vertical | 80px+ | `py-20` |
| Max content width | 72rem | `max-w-6xl` |
| Page horizontal | 24px | `px-6` |
| Grid gap | 24px | `gap-6` |
| Between components | 32px | `space-y-8` or `gap-8` |
| Section breaks | 48px+ | `mt-12` or `py-12` |

---

## Animation

### Keyframes

| Animation | Effect | Duration |
|-----------|--------|----------|
| `animate-fade-in` | Opacity 0 → 1 | 0.6s ease-out |
| `animate-fade-in-up` | Opacity 0 → 1, translateY(16px) → 0 | 0.6s ease-out |

### Stagger Delays

Use `stagger-N` classes to create cascading entrance effects:

```html
<div class="animate-fade-in-up stagger-1">First element</div>
<div class="animate-fade-in-up stagger-2">Second element</div>
<div class="animate-fade-in-up stagger-3">Third element</div>
```

### What Gets Animated

| Element | Animation | Stagger? |
|---------|-----------|----------|
| Hero badge/count | `animate-fade-in` | `stagger-1` |
| Hero headline | `animate-fade-in-up` | `stagger-2` |
| Hero subtitle | `animate-fade-in-up` | `stagger-3` |
| Hero search/CTA | `animate-fade-in-up` | `stagger-4` |
| Category pills | `animate-fade-in` | `stagger-5` |
| Card grid items | `animate-fade-in-up` | `stagger-1` through `stagger-6` |

### Transition Timing

| Duration | Value | Usage |
|----------|-------|-------|
| Fast | `150ms` | Color, opacity changes |
| Normal | `300ms` | Shadow, transform |
| Slow | `500ms` | Image zoom, page transitions |

---

## Shadows & Elevation

No gradients — shadows for depth.

| Token | Usage | When |
|-------|-------|------|
| `shadow-sm` | Subtle depth | Cards at rest |
| `shadow-md` | Lifted | Hover states, dropdowns |
| `shadow-lg` | Floating | Modals, dialogs |

```html
<div class="shadow-sm hover:shadow-md transition-shadow duration-300">
```

**Colored shadow** (optional, when accent is set):
```html
<button class="bg-accent hover:shadow-lg hover:shadow-accent/10 transition-all">
```

---

## Border Radius

| Token | Value | Usage |
|-------|-------|-------|
| `rounded-sm` | 4px | Tags, badges |
| `rounded` | 6px | Inputs, small buttons |
| `rounded-md` | 8px | Buttons, dropdowns |
| `rounded-lg` | 12px | Cards, alerts, modals |
| `rounded-xl` | 16px | Large cards, hero sections |
| `rounded-full` | 9999px | Pills, avatars |

**Rule:** Pick one radius per component type and stick with it.

---

## Focus States

```html
focus:outline-none focus:ring-2 focus:ring-primary/20 focus:ring-offset-2
```

Rules: Never `outline-none` without a ring. Ring at 20% opacity. `ring-offset-2` for buttons.

---

## Page Layout

```html
<body class="bg-background text-neutral-900 min-h-screen font-sans">
  <header class="sticky top-0 z-40 backdrop-blur-md bg-background/80 border-b border-border">
    <div class="max-w-6xl mx-auto px-6 h-16 flex items-center justify-between">
      <a href="/" class="text-xl font-bold">[SITE NAME]</a>
      <nav class="flex gap-6 text-sm text-muted">
        <a href="/[section]" class="hover:text-neutral-900 transition-colors">[Section]</a>
      </nav>
    </div>
  </header>
  <main class="max-w-6xl mx-auto px-6 py-16">...</main>
</body>
```

---

## Components

### Button
```html
<button class="bg-primary hover:bg-primary-hover text-white font-medium px-5 py-2.5 rounded-lg transition-all">
  Button
</button>
<button class="border border-border hover:border-neutral-400 text-neutral-700 font-medium px-5 py-2.5 rounded-lg transition-all">
  Secondary
</button>
```

### Card
```html
<a href="/[path]" class="group block bg-surface rounded-xl overflow-hidden border border-border hover:shadow-lg transition-all duration-300">
  <div class="aspect-[4/3] overflow-hidden">
    <img src="/images/[path]" alt="[name]"
      class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500" />
  </div>
  <div class="p-5">
    <h3 class="font-semibold group-hover:text-primary transition-colors">[Name]</h3>
    <p class="text-sm text-muted mt-1">[Subtitle]</p>
  </div>
</a>
```

### Input
```html
<div class="flex flex-col gap-1.5">
  <label class="text-sm font-medium">Label</label>
  <input type="text" placeholder="Placeholder"
    class="border border-border rounded-lg px-3 py-2.5 focus:outline-none focus:ring-2 focus:ring-primary/20 focus:border-primary transition-all" />
</div>
```

### Alert
```html
<div class="p-4 bg-error-bg border border-error/20 rounded-lg">
  <p class="font-medium text-error">Something went wrong</p>
</div>
<div class="p-4 bg-success-bg border border-success/20 rounded-lg">
  <p class="font-medium text-success">Saved successfully</p>
</div>
```

### Empty State
```html
<div class="flex flex-col items-center justify-center py-20 text-center">
  <span class="text-4xl opacity-30 mb-4">[emoji]</span>
  <h3 class="text-lg font-semibold mb-1">No items yet</h3>
  <p class="text-muted mb-6">Create your first item to get started.</p>
</div>
```

### Breadcrumbs
```html
<nav class="flex items-center gap-2 text-sm" aria-label="Breadcrumb">
  <a href="/" class="text-muted hover:text-neutral-900 transition-colors">Home</a>
  <svg class="w-4 h-4 text-border" fill="none" stroke="currentColor" viewBox="0 0 24 24">
    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"></path>
  </svg>
  <span class="text-neutral-900 font-medium">Current Page</span>
</nav>
```

### Tag/Pill
```html
<span class="text-xs bg-surface text-muted px-3 py-1 rounded-full">Tag</span>
<a href="/tag/slug" class="text-xs bg-surface hover:bg-surface-hover text-muted hover:text-neutral-900 px-3 py-1.5 rounded-full transition-colors">Clickable</a>
<span class="text-xs bg-primary text-white px-3 py-1 rounded-full font-medium">Active</span>
```

### Nav (Frosted Glass)
```html
<header class="sticky top-0 z-40 backdrop-blur-md bg-background/80 border-b border-border">
  <div class="max-w-6xl mx-auto px-6 h-16 flex items-center justify-between">
    ...
  </div>
</header>
```

---

## Images

- Served from R2 via `/images/items/[slug].jpg`
- Cards use `aspect-[4/3]` with `object-cover`
- **Explicit dimensions** — `width="400" height="300"` on cards, `width="800" height="400"` on hero (CLS prevention)
- Lazy loading: `loading="lazy"` on card images, `loading="eager"` on hero
- Image zoom on hover: `group-hover:scale-105 duration-500`
- **onerror fallback** — Hides broken image, shows sibling placeholder div with emoji
- **Images-first sorting** — SQL `CASE WHEN image_url IS NOT NULL THEN 0 ELSE 1 END` on all listing pages

---

## Effects (via `EFFECTS` config)

| Effect | Config | What it does |
|--------|--------|-------------|
| Grain texture | `EFFECTS.grain` | SVG noise overlay on `.grain-bg` elements (opacity 0.04) |
| Count-up | `EFFECTS.countUp` | Animates numbers in `.count-up` elements on scroll (800ms cubic ease) |

Both are toggleable per directory. The footer JS conditionally includes each based on config.

---

## Scroll Reveal

Elements with `.reveal` class fade in when scrolled into view:
- Uses `IntersectionObserver` (threshold 0.1)
- Transition: opacity 0 → 1, translateY(16px) → 0
- Add `style="transition-delay: ${i * 60}ms"` for staggered grid reveals

---

## Principles

1. **No gradients. Ever.** Solid colors only. Shadows for depth.
2. **Use color tokens** — Never hardcode hex values in page files.
3. **Consistent radius** — One radius per component type.
4. **Every interactive element needs focus state.**
5. **Smooth transitions** — Never instant. `duration-300` minimum.
6. **Hover states on everything clickable.**
7. **Every list needs an empty state.**
8. **Images first** — Sort lists to show items with images first via SQL.
9. **Mobile-first** — Base styles mobile, `md:` for desktop.
10. **SSR everything** — All content in initial HTML. Animations via CSS only.
11. **onerror on all images** — Never show broken image icons.
