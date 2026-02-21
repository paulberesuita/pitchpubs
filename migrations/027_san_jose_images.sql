-- San Jose metro area bar images
-- Added: 2026-02-20
-- 10 images uploaded to R2 bucket soccerbars-v2-images at bars/san-jose/
-- Sources: Squarespace CDN (O'Flaherty's, Duke of Edinburgh), Visit San Jose / Simpleview CMS
--          (Jack's, Old Wagon, The Brit, Rookies Willow Glen), SF Station CDN (Britannia Arms
--          Almaden, Rookies Downtown), Cloudflare Images (St. Stephen's Green),
--          WordPress / Double D's official (Double D's)

UPDATE bars SET image_url = 'bars/san-jose/oflahertys-irish-pub-sj.jpeg' WHERE slug = 'oflahertys-irish-pub-sj';
UPDATE bars SET image_url = 'bars/san-jose/jacks-bar-sj.webp' WHERE slug = 'jacks-bar-sj';
UPDATE bars SET image_url = 'bars/san-jose/old-wagon-saloon-sj.webp' WHERE slug = 'old-wagon-saloon-sj';
UPDATE bars SET image_url = 'bars/san-jose/the-brit-sj.webp' WHERE slug = 'the-brit-sj';
UPDATE bars SET image_url = 'bars/san-jose/britannia-arms-almaden.jpg' WHERE slug = 'britannia-arms-almaden';
UPDATE bars SET image_url = 'bars/san-jose/rookies-sports-lodge-willow-glen.webp' WHERE slug = 'rookies-sports-lodge-willow-glen';
UPDATE bars SET image_url = 'bars/san-jose/rookies-sports-lodge-downtown.png' WHERE slug = 'rookies-sports-lodge-downtown';
UPDATE bars SET image_url = 'bars/san-jose/duke-of-edinburgh-cupertino.jpg' WHERE slug = 'duke-of-edinburgh-cupertino';
UPDATE bars SET image_url = 'bars/san-jose/st-stephens-green-mv.png' WHERE slug = 'st-stephens-green-mv';
UPDATE bars SET image_url = 'bars/san-jose/double-ds-los-gatos.jpeg' WHERE slug = 'double-ds-los-gatos';
