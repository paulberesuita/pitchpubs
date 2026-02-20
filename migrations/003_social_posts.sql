-- Social posts table — tracks programmatic social content generation
-- Used by the marketing agent's /programmatic-social skill

CREATE TABLE IF NOT EXISTS social_posts (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  item_slug TEXT NOT NULL,
  platform TEXT NOT NULL DEFAULT 'instagram',
  post_type TEXT NOT NULL DEFAULT 'image',
  caption TEXT,
  image_url TEXT,
  status TEXT NOT NULL DEFAULT 'draft',
  posted_at TEXT,
  external_id TEXT,
  created_at TEXT NOT NULL DEFAULT (datetime('now')),

  UNIQUE(item_slug, platform)
);

CREATE INDEX IF NOT EXISTS idx_social_posts_status ON social_posts(status);
CREATE INDEX IF NOT EXISTS idx_social_posts_platform ON social_posts(platform);
