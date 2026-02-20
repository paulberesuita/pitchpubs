/**
 * Full database dump for LLM crawlers
 * GET /llms-full.txt
 *
 * Provides every item with full content for AI systems
 * (ChatGPT, Perplexity, Claude, etc.)
 */

import { SITE_NAME, DOMAIN, TABLE_NAME, ITEMS_PATH, CATEGORY_FIELD } from './_shared.js';

export async function onRequestGet(context) {
  const { env, request } = context;
  const url = new URL(request.url);
  const baseUrl = `${url.protocol}//${url.host}`;

  try {
    const { results: items } = await env.DB.prepare(
      `SELECT name, slug, description, content, ${CATEGORY_FIELD} as category, city, state, source_url, sources
       FROM ${TABLE_NAME} ORDER BY name`
    ).all();

    const { results: categories } = await env.DB.prepare(
      `SELECT ${CATEGORY_FIELD} as category, COUNT(*) as count
       FROM ${TABLE_NAME}
       WHERE ${CATEGORY_FIELD} IS NOT NULL
       GROUP BY ${CATEGORY_FIELD}
       ORDER BY count DESC`
    ).all();

    let output = `# ${SITE_NAME}\n`;
    output += `> Full database for LLM consumption\n\n`;
    output += `URL: ${baseUrl}\n`;
    output += `Items: ${items.length}\n`;
    output += `Categories: ${categories.map(c => `${c.category} (${c.count})`).join(', ')}\n\n`;
    output += `## Pages\n`;
    output += `- Homepage: ${baseUrl}/\n`;
    output += `- Browse: ${baseUrl}/${ITEMS_PATH}\n`;
    output += `- Categories: ${baseUrl}/categories\n`;
    output += `- Best Of: ${baseUrl}/best\n`;
    output += `- Search: ${baseUrl}/search\n`;
    output += `- About: ${baseUrl}/about\n`;
    output += `- FAQ: ${baseUrl}/faq\n`;
    output += `- API: ${baseUrl}/api/items\n\n`;
    output += `---\n\n`;
    output += `## All Items\n\n`;

    for (const item of items) {
      output += `### ${item.name}\n`;
      output += `URL: ${baseUrl}/${ITEMS_PATH}/${item.slug}\n`;
      if (item.category) output += `Category: ${item.category}\n`;
      if (item.city || item.state) output += `Location: ${[item.city, item.state].filter(Boolean).join(', ')}\n`;
      if (item.source_url) output += `Website: ${item.source_url}\n`;
      if (item.description) output += `\n${item.description}\n`;
      if (item.content) output += `\n${item.content}\n`;
      if (item.sources) {
        try {
          const srcs = JSON.parse(item.sources);
          if (srcs.length > 0) output += `\nSources: ${srcs.join(', ')}\n`;
        } catch (e) { /* ignore */ }
      }
      output += `\n---\n\n`;
    }

    return new Response(output, {
      headers: {
        'Content-Type': 'text/plain; charset=utf-8',
        'Cache-Control': 'public, max-age=3600'
      }
    });

  } catch (error) {
    console.error('LLMs full error:', error);
    return new Response(`# ${SITE_NAME}\n\nDatabase not yet configured.`, {
      headers: { 'Content-Type': 'text/plain; charset=utf-8' }
    });
  }
}
