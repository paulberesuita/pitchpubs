---
name: research-images
description: Find and upload images for existing items. Internal skill for Content agent.
user_invokable: false
agent: content
---

# Research Images

You've been invoked to **find and upload images** for existing items.

---

## If No Category Provided

Show which categories need images:

```bash
npx wrangler d1 execute [PROJECT]-db --remote --command "
  SELECT [CATEGORY_FIELD],
    COUNT(*) as total,
    SUM(CASE WHEN image_url IS NOT NULL AND image_url != '' THEN 1 ELSE 0 END) as with_images,
    COUNT(*) - SUM(CASE WHEN image_url IS NOT NULL AND image_url != '' THEN 1 ELSE 0 END) as missing
  FROM [TABLE] GROUP BY [CATEGORY_FIELD] ORDER BY missing DESC;"
```

Present results and wait for user to pick a category.

---

## Process

**CRITICAL: Each image must be downloaded, uploaded to R2, and database updated IMMEDIATELY — do not batch or defer.**

### Step 1: Find Items Needing Images

```bash
npx wrangler d1 execute [PROJECT]-db --remote --command "
  SELECT slug, name FROM [TABLE]
  WHERE [CATEGORY_FIELD] = '[category]'
    AND (image_url IS NULL OR image_url = '')
  LIMIT 20;"
```

### Step 2: For EACH Item (all 3 steps before moving to next)

**A. Find the actual image URL (try in order, stop when found):**

1. **Wikipedia API** — Check for lead image:
   ```bash
   curl -s "https://en.wikipedia.org/w/api.php?action=query&titles=[Article_Name]&prop=pageimages&piprop=original&format=json"
   ```

2. **Wikimedia Commons** — Search for photos:
   ```bash
   curl -s "https://commons.wikimedia.org/w/api.php?action=query&list=search&srsearch=[Item+Name]&srnamespace=6&format=json"
   ```
   Then get URL: `action=query&titles=File:[filename]&prop=imageinfo&iiprop=url&format=json`

3. **Official website** — WebSearch + WebFetch:
   ```
   WebSearch: "[item name]" official site
   WebFetch: [url] -> "Find the main image URL"
   ```

4. **Flickr Creative Commons** — Search with license filter

5. **Other sources** — Industry-specific image sources

**VERIFY it shows the real item before proceeding.**

**B. Download, upload to R2, update DB — ALL IN ONE GO:**

```bash
curl -L "[IMAGE_URL]" -o temp/[slug]-new.jpg
npx wrangler r2 object put [PROJECT]-images/items/[slug].jpg --file=./temp/[slug]-new.jpg --remote
npx wrangler d1 execute [PROJECT]-db --remote --command "UPDATE [TABLE] SET image_url = 'items/[slug].jpg' WHERE slug = '[slug]';"
```

**C. Verify the upload worked:**

```bash
curl -sI "https://[DOMAIN]/images/items/[slug].jpg" | head -3
```

### Step 3: Report

Update CHANGELOG.md and include verification URLs:
- **Production:** `https://[DOMAIN]/images/items/[slug].jpg`

---

## Image Sources (Priority Order)

**We want photos of the ACTUAL item, not generic stock photos.**

1. **Wikimedia Commons** — Creative Commons, safest
   ```bash
   curl -s "https://commons.wikimedia.org/w/api.php?action=query&list=search&srsearch=[Item+Name]&srnamespace=6&format=json"
   ```

2. **Wikipedia API** — Lead image for the article
   ```bash
   curl -s "https://en.wikipedia.org/w/api.php?action=query&titles=[Article_Name]&prop=pageimages&piprop=original&format=json"
   ```

3. **Official website/social media** — The item's own site
   ```
   WebSearch: "[item name]" official site
   WebFetch: [url] -> "Find the main image URL"
   ```

4. **Openverse** — Creative Commons search engine (images.google.com alternative)
   ```
   WebSearch: site:openverse.org "[item name]"
   ```

5. **DPLA (Digital Public Library of America)** — Historical photos, archives
   ```
   WebSearch: site:dp.la "[item name]"
   ```

6. **National Register / NPGallery** — For registered historic items
   ```
   WebSearch: site:npgallery.nps.gov "[item name]"
   ```

7. **Internet Archive** — Historical photos and documents
   ```
   WebSearch: site:archive.org "[item name]" photo
   ```

8. **Library of Congress** — Historical images
   ```
   WebSearch: site:loc.gov "[item name]" photo
   ```

9. **Flickr Creative Commons** — Search with license filter

10. **Unsplash** — Free high-quality photos (check for actual item, not generic)

11. **Industry-specific sources** — Customize for directory topic

**If you cannot find an image of the actual item, skip it.** A missing image is better than a wrong image.

---

## Remember

- Always use `--remote` for R2 and D1 commands
- Store only filename in image_url (e.g., `items/[slug].jpg`)
- Update CHANGELOG.md when done
- Deploy after adding images
