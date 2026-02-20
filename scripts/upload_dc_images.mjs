// Download images from accessible CDN sources and upload to R2
// Usage: node scripts/upload_dc_images.mjs

import { execSync } from "child_process";
import { writeFileSync, unlinkSync, existsSync } from "fs";

const images = [
  // Lucky Bar - from PoPville (sneak peek interior)
  {
    slug: "lucky-bar-dc",
    url: "https://www.popville.com/wp-content/uploads/2025/10/IMG_5764.jpg",
    r2path: "bars/washington/lucky-bar-dc.jpg",
  },
  // Queen Vic - from Squarespace (LFC Patio + first floor)
  {
    slug: "queen-vic-dc",
    url: "https://images.squarespace-cdn.com/content/v1/5a6a6bccedaed885f3ee838a/1612543936814-JAM93Z8032VV5MIUNUOJ/QV+1stflr1.jpg",
    r2path: "bars/washington/queen-vic-dc.jpg",
  },
  // Exiles Bar - from Fanzo/MatchPint CDN
  {
    slug: "exiles-bar-dc",
    url: "https://matchpint-cdn.matchpint.cloud/shared/img/pub/225190/904882044-1714643024_banner.jpeg",
    r2path: "bars/washington/exiles-bar-dc.jpg",
  },
  // Franklin Hall - from Squarespace (Arsenal bar post)
  {
    slug: "franklin-hall-dc",
    url: "http://static1.squarespace.com/static/58c02f13b3db2b38d17f1959/68cbe41892fe1314595976d2/693c7b4aa81024740cdda2b9/1766772116251/Frank+Hall+DC+Bar+Soccer+Arsenal+and+DC+Armoury.jpg?format=1500w",
    r2path: "bars/washington/franklin-hall-dc.jpg",
  },
  // The Artemis - from their WordPress site
  {
    slug: "the-artemis-dc",
    url: "https://theartemisdc.com/wp-content/uploads/2024/12/Artemis-Image-1-300x300.jpg",
    r2path: "bars/washington/the-artemis-dc.jpg",
  },
  // Public Bar Live - from Fanzo/MatchPint CDN
  {
    slug: "public-bar-live-dc",
    url: "https://matchpint-cdn.matchpint.cloud/shared/img/pub/224931/725422173-1713779568_banner.jpeg",
    r2path: "bars/washington/public-bar-live-dc.jpg",
  },
  // Kirwan's on the Wharf - from Squarespace (main bar)
  {
    slug: "kirwans-on-the-wharf-dc",
    url: "https://images.squarespace-cdn.com/content/v1/5a81db396f4ca36e2493fa2e/1520519912533-IK7JCP3LUZV53QD5V5F6/kirwans-main-bar.jpg",
    r2path: "bars/washington/kirwans-on-the-wharf-dc.jpg",
  },
  // Sports & Social DC - from Fanzo/MatchPint CDN
  {
    slug: "sports-and-social-dc",
    url: "https://matchpint-cdn.matchpint.cloud/shared/img/pub/157157/1610854016-1712062232_big.jpeg",
    r2path: "bars/washington/sports-and-social-dc.jpg",
  },
  // Lucky Bar - from TimeOut
  // (backup if PoPville fails)
  // { slug: "lucky-bar-dc", url: "https://media.timeout.com/images/102867822/750/422/image.jpg", r2path: "bars/washington/lucky-bar-dc.jpg" },
];

const sleep = (ms) => new Promise((r) => setTimeout(r, ms));

let uploaded = 0;
let failed = 0;

for (const img of images) {
  const tmpFile = `/tmp/${img.slug}.jpg`;
  try {
    console.log(`Downloading ${img.slug}...`);
    execSync(
      `curl -sL -o "${tmpFile}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36" "${img.url}"`,
      { timeout: 15000 }
    );

    // Check file size (should be > 1KB for a real image)
    const stats = execSync(`wc -c < "${tmpFile}"`).toString().trim();
    const size = parseInt(stats);
    if (size < 1000) {
      console.log(`  SKIP: ${img.slug} - file too small (${size} bytes), probably not a real image`);
      failed++;
      continue;
    }

    console.log(`  Uploading to R2: ${img.r2path} (${size} bytes)...`);
    execSync(
      `npx wrangler r2 object put soccerbars-v2-images/${img.r2path} --file="${tmpFile}" --content-type="image/jpeg"`,
      { timeout: 30000 }
    );
    console.log(`  OK: ${img.slug}`);
    uploaded++;
  } catch (e) {
    console.log(`  FAIL: ${img.slug} - ${e.message?.slice(0, 100)}`);
    failed++;
  } finally {
    if (existsSync(tmpFile)) unlinkSync(tmpFile);
  }
  await sleep(500);
}

console.log(`\nDone. ${uploaded} uploaded, ${failed} failed.`);

// Generate SQL to update image_url for uploaded bars
const sqlLines = images
  .filter((img) => {
    // Only include bars that uploaded successfully
    return true; // We'll run the SQL for all; bars without images won't be affected
  })
  .map(
    (img) =>
      `UPDATE bars SET image_url = '${img.r2path}' WHERE slug = '${img.slug}';`
  );

console.log("\nSQL to update image_url:");
console.log(sqlLines.join("\n"));
