/**
 * Dynamic robots.txt
 * GET /robots.txt
 *
 * Server-rendered to always stay in sync with DOMAIN config.
 * Replaces static public/robots.txt.
 */

import { DOMAIN } from './_shared.js';

export async function onRequestGet(context) {
  const { request } = context;
  const url = new URL(request.url);
  const baseUrl = `${url.protocol}//${url.host}`;

  const robots = `User-agent: *
Allow: /
Disallow: /api/

# Sitemap
Sitemap: ${baseUrl}/sitemap.xml

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
