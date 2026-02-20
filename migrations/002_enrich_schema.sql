-- Add location, content, and source tracking fields
-- These columns are optional — NULL values are fine for non-geographic directories

ALTER TABLE items ADD COLUMN content TEXT;
ALTER TABLE items ADD COLUMN city TEXT;
ALTER TABLE items ADD COLUMN state TEXT;
ALTER TABLE items ADD COLUMN address TEXT;
ALTER TABLE items ADD COLUMN latitude REAL;
ALTER TABLE items ADD COLUMN longitude REAL;
ALTER TABLE items ADD COLUMN sources TEXT;
ALTER TABLE items ADD COLUMN source_count INTEGER DEFAULT 0;

-- Indexes for location queries
CREATE INDEX IF NOT EXISTS idx_items_state ON items(state);
CREATE INDEX IF NOT EXISTS idx_items_city ON items(city);

-- Submissions table
CREATE TABLE IF NOT EXISTS submissions (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL,
  slug TEXT,
  description TEXT NOT NULL,
  category TEXT,
  city TEXT,
  state TEXT,
  source_url TEXT,
  email TEXT,
  status TEXT DEFAULT 'pending',
  created_at TEXT DEFAULT (datetime('now'))
);

CREATE INDEX IF NOT EXISTS idx_submissions_status ON submissions(status);
