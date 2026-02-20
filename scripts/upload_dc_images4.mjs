// Fourth batch of DC bar images
import { execSync } from "child_process";
import { unlinkSync, existsSync } from "fs";

const images = [
  // Elephant & Castle - from OpenTable (main bar interior)
  {
    slug: "elephant-and-castle-dc",
    url: "https://resizer.otstatic.com/v3/photos/91551900-1?width=1280&height=720&format=jpeg",
    r2path: "bars/washington/elephant-and-castle-dc.jpg",
  },
  // Irish Channel - try their OpenTable
  {
    slug: "irish-channel-dc",
    url: "https://static.wixstatic.com/media/7b6d3e_a6d3e2c27c2d4d36b9e3cf6b10a5e5e4~mv2.jpg",
    r2path: "bars/washington/irish-channel-dc.jpg",
    skip: true, // Wix won't work
  },
];

const sleep = (ms) => new Promise((r) => setTimeout(r, ms));

let uploaded = 0;
let failed = 0;

for (const img of images) {
  if (img.skip) continue;
  const tmpFile = `/tmp/${img.slug}.jpg`;
  try {
    console.log(`Downloading ${img.slug}...`);
    execSync(
      `curl -sL -o "${tmpFile}" -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36" "${img.url}"`,
      { timeout: 15000 }
    );

    const stats = execSync(`wc -c < "${tmpFile}"`).toString().trim();
    const size = parseInt(stats);
    if (size < 1000) {
      console.log(`  SKIP: ${img.slug} - file too small (${size} bytes)`);
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
