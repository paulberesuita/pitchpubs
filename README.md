# Directory Template

A template for building directory-style apps with Claude Code agents. Tell Claude what you want to build and it handles everything — from infrastructure to content.

Open this project in Claude Code, describe your directory idea, and say **"setup"**.

---

## Overview

*[The setup agent fills this section with the product idea — what this directory is about, who it's for, what makes it useful.]*

---

## Taste

*[The setup agent fills this section — mood, color palette, font choices, and the design principles for this specific directory.]*

---

## Product

*[Updated as the directory grows — what features are built, mini apps shipped, and what makes this directory worth using.]*

---

## Agents

Five autonomous agents that check state, decide what needs doing, and execute. Say a trigger word and they investigate the database, the site, the gaps — then come back with findings and a plan.

**setup** bootstraps a new directory from an idea — configures all files, picks a design, creates Cloudflare infrastructure, deploys, and seeds starter data.

**content** owns the data. Discovers items, researches details, fills images, builds content pages, fixes data quality. The site is only as good as its content.

**product** owns the experience. Builds mini apps, adds delightful touches, polishes the core pages. Taste is the compass — restraint, warmth, space, craft.

**seo** owns technical health. Audits meta tags, structured data, sitemaps, thin content, internal linking. Doesn't just recommend — builds and ships fixes.

**marketing** owns distribution. Outreach, partnerships, social content. Earns attention by sharing something remarkable, not by asking for links.

Each agent owns a clear domain with no overlap. Skills are the reusable playbooks they follow — research workflows, audit checklists, deploy procedures. Agents decide *what* to do; skills define *how* to do it.
