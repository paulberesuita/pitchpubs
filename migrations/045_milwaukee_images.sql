-- Milwaukee area bar images
-- All images uploaded to R2: soccerbars-v2-images/bars/{city}/
-- Sources: FourDollarJacks CDN (7 bars), The Rooftop Guide (Red Lion),
--          Urban Milwaukee WordPress (SportClub), Squarespace CDN (Three Lions)
-- Added: 2026-02-20

-- Milwaukee bars
UPDATE bars SET image_url = 'bars/milwaukee/highbury-pub-milwaukee.webp' WHERE slug = 'highbury-pub-milwaukee';
UPDATE bars SET image_url = 'bars/milwaukee/red-lion-pub-milwaukee.jpg' WHERE slug = 'red-lion-pub-milwaukee';
UPDATE bars SET image_url = 'bars/milwaukee/nomad-world-pub-milwaukee.webp' WHERE slug = 'nomad-world-pub-milwaukee';
UPDATE bars SET image_url = 'bars/milwaukee/old-german-beer-hall-milwaukee.webp' WHERE slug = 'old-german-beer-hall-milwaukee';
UPDATE bars SET image_url = 'bars/milwaukee/sportclub-milwaukee.png' WHERE slug = 'sportclub-milwaukee';
UPDATE bars SET image_url = 'bars/milwaukee/puddlers-hall-milwaukee.webp' WHERE slug = 'puddlers-hall-milwaukee';
UPDATE bars SET image_url = 'bars/milwaukee/bremen-cafe-milwaukee.webp' WHERE slug = 'bremen-cafe-milwaukee';
UPDATE bars SET image_url = 'bars/milwaukee/brass-boars-den-milwaukee.webp' WHERE slug = 'brass-boars-den-milwaukee';

-- Shorewood
UPDATE bars SET image_url = 'bars/shorewood/three-lions-pub-shorewood.jpg' WHERE slug = 'three-lions-pub-shorewood';

-- South Milwaukee
UPDATE bars SET image_url = 'bars/south-milwaukee/morans-pub-south-milwaukee.webp' WHERE slug = 'morans-pub-south-milwaukee';
