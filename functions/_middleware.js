/**
 * Middleware — runs before every request
 *
 * 1. Blocks non-production domains from SEO indexing
 * 2. Redirects legacy query-param URLs to clean paths
 */

import { DOMAIN, SHORT_PATHS } from './_shared/config.js';
import { onRequestGet as render404 } from './404.js';

export async function onRequest(context) {
  const { request } = context;
  const url = new URL(request.url);

  // Short-path category routes — /quiet-spots → /category/quiet-spots
  // 301 redirect passes full link equity to the canonical category page
  const shortPath = url.pathname.replace(/^\//, '').replace(/\/$/, '');
  if (SHORT_PATHS[shortPath]) {
    const categorySlug = SHORT_PATHS[shortPath];
    return Response.redirect(`${url.origin}/category/${categorySlug}${url.search}`, 301);
  }

  // 301 redirect: legacy query-param category URLs → clean paths
  // e.g., /items?category=Tools → /category/tools
  if (url.pathname.match(/^\/items\/?$/) && url.searchParams.has('category') && !url.searchParams.has('sort') && !url.searchParams.has('page')) {
    const category = url.searchParams.get('category');
    const slug = category.toLowerCase().replace(/\s+/g, '-');
    return Response.redirect(`${url.origin}/category/${slug}`, 301);
  }

  let response = await context.next();

  // Serve custom 404 page for unmatched routes
  if (response.status === 404) {
    response = await render404(context);
  }

  // Block non-production domains from indexing
  const host = url.hostname;
  const isProduction = host === DOMAIN || host === `www.${DOMAIN}`;

  if (!isProduction) {
    const newResponse = new Response(response.body, response);
    newResponse.headers.set('X-Robots-Tag', 'noindex, nofollow');
    return newResponse;
  }

  return response;
}
