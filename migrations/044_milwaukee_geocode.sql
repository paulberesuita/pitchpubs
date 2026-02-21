-- Geocode Milwaukee area bars
-- Coordinates from US Census Geocoding API
-- Added: 2026-02-20

-- Milwaukee bars
UPDATE bars SET latitude = 43.002695, longitude = -87.903964 WHERE slug = 'highbury-pub-milwaukee';
UPDATE bars SET latitude = 43.054828, longitude = -87.901695 WHERE slug = 'red-lion-pub-milwaukee';
UPDATE bars SET latitude = 43.052884, longitude = -87.893862 WHERE slug = 'nomad-world-pub-milwaukee';
UPDATE bars SET latitude = 43.043077, longitude = -87.914551 WHERE slug = 'old-german-beer-hall-milwaukee';
UPDATE bars SET latitude = 43.040114, longitude = -87.905329 WHERE slug = 'sportclub-milwaukee';
UPDATE bars SET latitude = 42.998783, longitude = -87.892881 WHERE slug = 'puddlers-hall-milwaukee';
UPDATE bars SET latitude = 43.065574, longitude = -87.900301 WHERE slug = 'bremen-cafe-milwaukee';
UPDATE bars SET latitude = 43.012689, longitude = -88.001729 WHERE slug = 'brass-boars-den-milwaukee';

-- Shorewood
UPDATE bars SET latitude = 43.098578, longitude = -87.887494 WHERE slug = 'three-lions-pub-shorewood';

-- South Milwaukee
UPDATE bars SET latitude = 42.910706, longitude = -87.859055 WHERE slug = 'morans-pub-south-milwaukee';
