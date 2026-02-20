-- Placeholder items so the directory isn't empty during development
INSERT OR IGNORE INTO items (slug, name, description, category, featured, created_at) VALUES
  ('alpha-widget', 'Alpha Widget', 'A versatile tool for everyday tasks. Reliable, efficient, and well-designed.', 'Tools', 1, datetime('now')),
  ('beta-gadget', 'Beta Gadget', 'Compact and powerful. Perfect for on-the-go use with a clean interface.', 'Tools', 1, datetime('now')),
  ('gamma-service', 'Gamma Service', 'Premium service with outstanding support and fast turnaround times.', 'Services', 1, datetime('now')),
  ('delta-platform', 'Delta Platform', 'All-in-one platform that brings everything together in one place.', 'Platforms', 1, datetime('now')),
  ('epsilon-app', 'Epsilon App', 'Beautifully designed app with intuitive navigation and smooth performance.', 'Apps', 0, datetime('now')),
  ('zeta-resource', 'Zeta Resource', 'Comprehensive resource library with curated content and regular updates.', 'Resources', 0, datetime('now')),
  ('eta-toolkit', 'Eta Toolkit', 'Professional-grade toolkit trusted by thousands of users worldwide.', 'Tools', 0, datetime('now')),
  ('theta-hub', 'Theta Hub', 'Central hub connecting communities and enabling collaboration at scale.', 'Platforms', 0, datetime('now')),
  ('iota-studio', 'Iota Studio', 'Creative studio for building, designing, and shipping projects faster.', 'Apps', 0, datetime('now'));
