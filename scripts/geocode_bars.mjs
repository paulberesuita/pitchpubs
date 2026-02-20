import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const barsPath = path.join(__dirname, 'bars_to_geocode.json');
const outputDir = path.join(__dirname, '..', 'migrations');

const bars = JSON.parse(fs.readFileSync(barsPath, 'utf8'));
console.log(`Loaded ${bars.length} bars to geocode`);

// Rate limit: 1 request per second for Nominatim
const DELAY_MS = 1100; // slightly over 1s to be safe
const USER_AGENT = 'SoccerBars/1.0 (https://soccerbars.fyi)';

async function geocodeAddress(address) {
  const query = encodeURIComponent(address);
  const url = `https://nominatim.openstreetmap.org/search?q=${query}&format=json&limit=1&countrycodes=us`;

  const response = await fetch(url, {
    headers: {
      'User-Agent': USER_AGENT,
    },
  });

  if (!response.ok) {
    throw new Error(`HTTP ${response.status} for ${address}`);
  }

  const data = await response.json();
  if (data.length > 0) {
    return {
      lat: parseFloat(data[0].lat),
      lng: parseFloat(data[0].lon),
      display: data[0].display_name,
    };
  }
  return null;
}

function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}

async function main() {
  const results = [];
  const failures = [];

  // Check if we have a partial results file to resume from
  const partialPath = path.join(__dirname, 'geocode_progress.json');
  let startIndex = 0;
  if (fs.existsSync(partialPath)) {
    const partial = JSON.parse(fs.readFileSync(partialPath, 'utf8'));
    results.push(...partial.results);
    failures.push(...partial.failures);
    startIndex = partial.nextIndex;
    console.log(`Resuming from index ${startIndex} (${results.length} done, ${failures.length} failed)`);
  }

  for (let i = startIndex; i < bars.length; i++) {
    const bar = bars[i];
    const progress = `[${i + 1}/${bars.length}]`;

    try {
      // Use the full address field which already contains city, state, zip
      const result = await geocodeAddress(bar.address);

      if (result) {
        results.push({
          id: bar.id,
          name: bar.name,
          lat: result.lat,
          lng: result.lng,
        });
        console.log(`${progress} OK: ${bar.name} -> ${result.lat}, ${result.lng}`);
      } else {
        // Try with just city + state as fallback
        const fallbackQuery = `${bar.name}, ${bar.city}, ${bar.state}, USA`;
        const fallbackResult = await geocodeAddress(fallbackQuery);
        await sleep(DELAY_MS);

        if (fallbackResult) {
          results.push({
            id: bar.id,
            name: bar.name,
            lat: fallbackResult.lat,
            lng: fallbackResult.lng,
            fallback: true,
          });
          console.log(`${progress} FALLBACK: ${bar.name} -> ${fallbackResult.lat}, ${fallbackResult.lng}`);
        } else {
          failures.push({
            id: bar.id,
            name: bar.name,
            address: bar.address,
            city: bar.city,
            state: bar.state,
          });
          console.log(`${progress} FAIL: ${bar.name} (${bar.address})`);
        }
      }
    } catch (err) {
      failures.push({
        id: bar.id,
        name: bar.name,
        address: bar.address,
        city: bar.city,
        state: bar.state,
        error: err.message,
      });
      console.log(`${progress} ERROR: ${bar.name} - ${err.message}`);
    }

    // Save progress every 20 bars
    if ((i + 1) % 20 === 0) {
      fs.writeFileSync(partialPath, JSON.stringify({
        results,
        failures,
        nextIndex: i + 1,
      }, null, 2));
      console.log(`--- Progress saved at ${i + 1}/${bars.length} ---`);
    }

    // Rate limit
    await sleep(DELAY_MS);
  }

  // Save final progress
  fs.writeFileSync(partialPath, JSON.stringify({
    results,
    failures,
    nextIndex: bars.length,
  }, null, 2));

  console.log(`\n=== RESULTS ===`);
  console.log(`Geocoded: ${results.length}`);
  console.log(`Failed: ${failures.length}`);
  if (results.filter(r => r.fallback).length > 0) {
    console.log(`Used fallback: ${results.filter(r => r.fallback).length}`);
  }

  // Generate SQL migration file
  // Split into batches of 50 for D1 compatibility
  const BATCH_SIZE = 50;
  const batches = [];
  for (let i = 0; i < results.length; i += BATCH_SIZE) {
    batches.push(results.slice(i, i + BATCH_SIZE));
  }

  let sql = `-- Geocode all bars: set latitude and longitude from Nominatim/OpenStreetMap\n`;
  sql += `-- Generated ${new Date().toISOString()}\n`;
  sql += `-- ${results.length} bars geocoded, ${failures.length} failed\n\n`;

  for (const result of results) {
    // Escape single quotes in names for SQL comments
    const safeName = result.name.replace(/'/g, "''");
    sql += `UPDATE bars SET latitude = ${result.lat}, longitude = ${result.lng} WHERE id = ${result.id}; -- ${safeName}\n`;
  }

  const migrationPath = path.join(outputDir, '003_geocode_bars.sql');
  fs.writeFileSync(migrationPath, sql);
  console.log(`\nMigration written to: ${migrationPath}`);

  if (failures.length > 0) {
    console.log(`\n=== FAILURES ===`);
    for (const f of failures) {
      console.log(`  ID ${f.id}: ${f.name} - ${f.address}`);
    }
    fs.writeFileSync(
      path.join(__dirname, 'geocode_failures.json'),
      JSON.stringify(failures, null, 2)
    );
  }
}

main().catch(console.error);
