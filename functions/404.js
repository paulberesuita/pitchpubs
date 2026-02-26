/**
 * 404 Error Page
 * Handles all unmatched routes
 */

import {
  SITE_NAME, ITEMS_PATH,
  renderHead, renderNav, renderFooter, renderEmptyState,
  renderPage, htmlResponse
} from './_shared.js';

export async function onRequestGet(context) {
  const { request } = context;
  const url = new URL(request.url);
  const baseUrl = `${url.protocol}//${url.host}`;

  const head = renderHead({
    title: 'Page Not Found',
    description: 'The page you\'re looking for doesn\'t exist.',
    url: `${baseUrl}/`,
    noindex: true
  });

  const body = `
  ${renderNav('')}

  <main class="max-w-4xl mx-auto px-6 py-20">
    <div class="text-center">
      <span class="text-8xl mb-6 block opacity-30">404</span>
      <h1 class="text-3xl font-bold mb-4">Page Not Found</h1>
      <p class="text-lg text-muted mb-8 max-w-md mx-auto">
        The page you're looking for doesn't exist or has been moved.
      </p>
      <div class="flex flex-col sm:flex-row gap-4 justify-center">
        <a href="/" class="bg-primary hover:bg-primary-hover text-white font-medium px-6 py-3 rounded-lg transition-all">
          Go Home
        </a>
        <a href="/${ITEMS_PATH}" class="border border-border hover:border-neutral-400 text-neutral-700 font-medium px-6 py-3 rounded-lg transition-all">
          Browse All
        </a>
      </div>
    </div>
  </main>

  ${renderFooter()}
  `;

  return htmlResponse(renderPage(head, body), 404);
}

// Also handle other methods
export const onRequestPost = onRequestGet;
export const onRequestPut = onRequestGet;
export const onRequestDelete = onRequestGet;
