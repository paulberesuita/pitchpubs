// Second batch of DC bar images
import { execSync } from "child_process";
import { writeFileSync, unlinkSync, existsSync } from "fs";

const images = [
  // Tom's Watch Bar - from their WordPress
  {
    slug: "toms-watch-bar-dc",
    url: "https://tomswatchbar.com/wp-content/uploads/2025/02/people-at-event_500x419.jpg",
    r2path: "bars/washington/toms-watch-bar-dc.jpg",
  },
  // Nanny O'Brien's - from their WordPress
  {
    slug: "nanny-obriens-dc",
    url: "https://nannyobriens.com/wp-content/uploads/2019/03/daily-happy-hour-2.jpg",
    r2path: "bars/washington/nanny-obriens-dc.jpg",
  },
  // Irish Channel - using TimeOut or other source
  // Queen Vic exterior/facade
  {
    slug: "queen-vic-dc-exterior",
    url: "https://images.squarespace-cdn.com/content/v1/5a6a6bccedaed885f3ee838a/1612543845865-LE6DB5K71OLR1WCXDRSE/QV+Facade+and+Sign+small.jpg",
    r2path: "bars/washington/queen-vic-dc-exterior.jpg",
    skipDb: true, // Already have interior image
  },
  // Crystal City Sports Pub
  {
    slug: "crystal-city-sports-pub-arlington",
    url: "https://www.ccsportspub.com/FRONT.png",
    r2path: "bars/arlington/crystal-city-sports-pub-arlington.jpg",
  },
  // Elephant & Castle - from Elephant Castle website via search
  // Walters Sports Bar - logo from GetBento
  {
    slug: "walters-sports-bar-dc",
    url: "https://images.getbento.com/accounts/a32b77f25b8caec85c59ba7439811db2/media/images/19546Rustic_Color_copy.png",
    r2path: "bars/washington/walters-sports-bar-dc.jpg",
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
