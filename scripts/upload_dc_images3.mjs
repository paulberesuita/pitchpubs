// Third batch of DC bar images
import { execSync } from "child_process";
import { unlinkSync, existsSync } from "fs";

const images = [
  // The Big Board - from TimeOut
  {
    slug: "the-big-board-dc",
    url: "https://media.timeout.com/images/103737593/750/422/image.jpg",
    r2path: "bars/washington/the-big-board-dc.jpg",
  },
  // Ireland's Four Courts - GetBento logo (best we have)
  {
    slug: "irelands-four-courts-arlington",
    url: "https://images.getbento.com/accounts/83570759b98cbb03ab91cc1ab7c83562/media/images/32565LOGO_LOGO.jpg",
    r2path: "bars/arlington/irelands-four-courts-arlington.jpg",
  },
  // Lou's City Bar - no good image found, try OpenTable
  // Elephant & Castle - try from elephantcastle.com directly
  {
    slug: "elephant-and-castle-dc",
    url: "https://www.elephantcastle.com/media/1049/elephant-castle-penn-ave-1201-pennsylvania-ave-nw.jpg",
    r2path: "bars/washington/elephant-and-castle-dc.jpg",
  },
  // The Commodore - OpenTable
  {
    slug: "the-commodore-dc",
    url: "https://resizer.otstatic.com/v3/photos/30044914-1?width=1280&height=720&format=jpeg",
    r2path: "bars/washington/the-commodore-dc.jpg",
  },
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
