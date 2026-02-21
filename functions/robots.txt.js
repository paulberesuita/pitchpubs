/**
 * Dynamic robots.txt
 * GET /robots.txt
 *
 * Server-rendered to always stay in sync with DOMAIN config.
 * Replaces static public/robots.txt.
 */

import { PROD_BASE } from './_shared.js';

export async function onRequestGet(context) {
  const robots = `User-agent: *
Allow: /
Disallow: /api/

# Sitemap
Sitemap: ${PROD_BASE}/sitemap.xml

# LLM crawlers
User-agent: GPTBot
Allow: /llms.txt
Allow: /llms-full.txt

User-agent: ChatGPT-User
Allow: /llms.txt
Allow: /llms-full.txt

User-agent: Claude-Web
Allow: /llms.txt
Allow: /llms-full.txt
`;

  return new Response(robots, {
    headers: {
      'Content-Type': 'text/plain; charset=utf-8',
      'Cache-Control': 'public, max-age=3600'
    }
  });
}
