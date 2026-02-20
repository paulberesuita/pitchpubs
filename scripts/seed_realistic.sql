-- Realistic placeholder items to demonstrate content structure
INSERT OR IGNORE INTO items (slug, name, description, category, featured, created_at) VALUES
  -- Tools
  ('pixelsnap', 'PixelSnap', 'Measure anything on your screen with pixel-perfect accuracy. Snap to edges, measure distances, and export dimensions instantly.', 'Tools', 1, datetime('now', '-3 days')),
  ('cleanshot', 'CleanShot', 'Screen capture tool with annotation, scrolling capture, and cloud sharing. Replaces the built-in screenshot tool entirely.', 'Tools', 0, datetime('now', '-5 days')),
  ('raycast', 'Raycast', 'Blazing fast launcher that replaces Spotlight. Extensions for GitHub, Jira, Figma, and 500+ integrations.', 'Tools', 1, datetime('now', '-1 days')),
  ('tableplus', 'TablePlus', 'Modern database GUI for Postgres, MySQL, SQLite, and more. Clean interface with inline editing and smart filters.', 'Tools', 0, datetime('now', '-8 days')),

  -- Apps
  ('linear', 'Linear', 'Project management built for speed. Keyboard-first design, automatic cycles, and Git integration that actually works.', 'Apps', 1, datetime('now', '-2 days')),
  ('arc-browser', 'Arc Browser', 'A browser that thinks differently. Spaces, profiles, easels, and a command bar that makes tabs feel ancient.', 'Apps', 1, datetime('now', '-4 days')),
  ('notion', 'Notion', 'All-in-one workspace for notes, docs, wikis, and databases. Flexible blocks system that adapts to any workflow.', 'Apps', 0, datetime('now', '-10 days')),
  ('figma', 'Figma', 'Collaborative design tool that runs in the browser. Real-time multiplayer editing, prototyping, and dev handoff.', 'Apps', 0, datetime('now', '-12 days')),

  -- Platforms
  ('vercel', 'Vercel', 'Deploy frontend apps with zero config. Git push to deploy, edge functions, and automatic preview environments for every PR.', 'Platforms', 1, datetime('now', '-6 days')),
  ('railway', 'Railway', 'Infrastructure platform that makes deploying backends trivial. Postgres, Redis, and cron jobs in a few clicks.', 'Platforms', 0, datetime('now', '-7 days')),
  ('supabase', 'Supabase', 'Open source Firebase alternative. Postgres database, auth, edge functions, and real-time subscriptions out of the box.', 'Platforms', 0, datetime('now', '-9 days')),

  -- Services
  ('cal-com', 'Cal.com', 'Open source scheduling infrastructure. Connects all your calendars, handles time zones, and embeds anywhere.', 'Services', 0, datetime('now', '-11 days')),
  ('resend', 'Resend', 'Email API built for developers. React components for email templates, deliverability analytics, and simple pricing.', 'Services', 0, datetime('now', '-14 days')),
  ('plausible', 'Plausible', 'Privacy-friendly analytics in a single script tag. No cookies, GDPR compliant, and a dashboard you actually enjoy reading.', 'Services', 1, datetime('now', '-13 days')),

  -- Resources
  ('ui-patterns', 'UI Patterns Library', 'Curated collection of interface patterns from the best products. Searchable by component type, industry, and interaction.', 'Resources', 0, datetime('now', '-15 days')),
  ('system-design-primer', 'System Design Primer', 'Learn how to design large-scale systems. Covers load balancing, caching, database sharding, and real-world architectures.', 'Resources', 0, datetime('now', '-18 days')),
  ('dev-fonts', 'Dev Fonts', 'Side-by-side comparison of coding fonts. Preview your code in 30+ monospace typefaces before committing to one.', 'Resources', 1, datetime('now', '-16 days'));
