---
name: cloudflare-deploy
description: Load deploy commands and environment details. Usage: /cloudflare-deploy
user_invokable: true
---

# Cloudflare Deploy

Deploy commands for this directory project.

---

## No Local Dev

There is no local development server. The production environment *is* the dev environment. `wrangler pages deploy` takes ~10 seconds. Deploy, check the preview URL, iterate. This eliminates "works locally but breaks in production" bugs — CORS issues, environment variable mismatches, SQLite version differences.

Nothing to install. Clone the repo, authenticate with Cloudflare, deploy.

---

## Project Details

| Resource | Name |
|----------|------|
| Pages Project | `[PROJECT]` |
| D1 Database | `[PROJECT]-db` |
| R2 Bucket | `[PROJECT]-images` |
| Domain | `[DOMAIN]` |
| Preview URL | `[PROJECT].pages.dev` |

**Both preview and production are the SAME project. One deploy updates both URLs.**

---

## Commands

```bash
# Deploy (updates BOTH preview and production)
wrangler pages deploy ./public --project-name=[PROJECT]

# Run a migration
npx wrangler d1 execute [PROJECT]-db --file=./migrations/XXX.sql --remote

# Run ad-hoc SQL
npx wrangler d1 execute [PROJECT]-db --remote --command "SELECT COUNT(*) FROM [TABLE];"

# Upload image to R2
npx wrangler r2 object put [PROJECT]-images/items/slug.jpg --file=./temp/slug.jpg --remote

# List R2 objects
npx wrangler r2 object list [PROJECT]-images --remote
```

---

## wrangler.toml

```toml
name = "[PROJECT]"
compatibility_date = "2024-01-01"
pages_build_output_dir = "./public"

[[d1_databases]]
binding = "DB"
database_name = "[PROJECT]-db"
database_id = "[PASTE-ID-FROM-D1-CREATE]"

[[r2_buckets]]
binding = "IMAGES"
bucket_name = "[PROJECT]-images"
```

---

## Migration Naming

```
migrations/
├── 001_initial.sql
├── 002_add_[feature].sql
├── 003_add_[feature].sql
└── ...
```

Always use the next number. Check existing migrations before creating.

---

## Post-Deploy Checklist

- [ ] Visit production URL — homepage loads
- [ ] Check a list page: `/[section]`
- [ ] Check a detail page: `/[section]/[slug]`
- [ ] Check images load (no broken thumbnails)
- [ ] No console errors in browser DevTools

---

## Common Issues

| Problem | Fix |
|---------|-----|
| Deploy goes to wrong project | Always use `--project-name=[PROJECT]` |
| D1 command fails with auth error | Run `npx wrangler login` to refresh token |
| R2 upload 404s | Add `--remote` flag (defaults to local) |
| Page not updating | Edit `functions/[section]/[[slug]].js`, not `index.js` |
| New category not showing | Update category mappings in ALL SSR functions |
