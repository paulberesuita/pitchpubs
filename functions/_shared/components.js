/**
 * Shared UI components — cards, empty states, pagination
 */

import { ITEMS_PATH } from './config.js';
import { escapeHtml } from './utils.js';

/**
 * Render item card with image dimensions for CLS prevention
 */
export function renderCard(item, basePath = ITEMS_PATH) {
  const imageHtml = item.image_url
    ? `<img src="${escapeHtml(item.image_url)}" alt="${escapeHtml(item.name)}"
         width="400" height="300"
         class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500 ease-out" loading="lazy"
         onerror="this.style.display='none';this.nextElementSibling.style.display='flex'">
       <div class="w-full h-full bg-surface items-center justify-center" style="display:none">
         <span class="text-4xl opacity-20">&#128230;</span>
       </div>`
    : `<div class="w-full h-full bg-surface flex items-center justify-center">
         <span class="text-4xl opacity-20">&#128230;</span>
       </div>`;

  // Show location if available
  const locationHtml = (item.city || item.state)
    ? `<p class="text-xs text-muted mt-1">${escapeHtml([item.city, item.state].filter(Boolean).join(', '))}</p>`
    : '';

  const categoryHtml = item.category
    ? `<span class="text-[11px] text-muted">${escapeHtml(item.category)}</span>`
    : '';

  return `
  <a href="/${basePath}/${escapeHtml(item.slug)}" class="group block bg-white rounded-2xl overflow-hidden border border-border card-hover">
    <div class="aspect-[4/3] overflow-hidden">
      ${imageHtml}
    </div>
    <div class="p-5">
      <div class="flex items-start justify-between gap-2">
        <h3 class="font-display font-semibold group-hover:text-muted transition-colors">${escapeHtml(item.name)}</h3>
        ${categoryHtml}
      </div>
      ${item.description ? `<p class="text-sm text-muted mt-1.5 line-clamp-2 leading-relaxed">${escapeHtml(item.description)}</p>` : ''}
      ${locationHtml}
    </div>
  </a>
  `;
}

/**
 * Render empty state
 */
export function renderEmptyState({ emoji = '&#128237;', title = 'No items yet', message = '', action = null }) {
  const actionHtml = action
    ? `<a href="${escapeHtml(action.href)}" class="bg-primary hover:bg-primary-hover text-white font-medium px-6 py-3 rounded-xl transition-colors">${escapeHtml(action.label)}</a>`
    : '';

  return `
  <div class="flex flex-col items-center justify-center py-24 text-center">
    <span class="text-5xl opacity-20 mb-6">${emoji}</span>
    <h3 class="font-display text-xl font-semibold mb-2">${escapeHtml(title)}</h3>
    ${message ? `<p class="text-muted mb-8 max-w-md leading-relaxed">${escapeHtml(message)}</p>` : ''}
    ${actionHtml}
  </div>
  `;
}

/**
 * Render pagination
 */
export function renderPagination({ currentPage, totalPages, baseUrl }) {
  if (totalPages <= 1) return '';

  const pages = [];
  const maxVisible = 5;

  let start = Math.max(1, currentPage - Math.floor(maxVisible / 2));
  let end = Math.min(totalPages, start + maxVisible - 1);

  if (end - start < maxVisible - 1) {
    start = Math.max(1, end - maxVisible + 1);
  }

  const sep = baseUrl.includes('?') ? '&' : '?';

  if (currentPage > 1) {
    pages.push(`
      <a href="${baseUrl}${sep}page=${currentPage - 1}" class="w-10 h-10 flex items-center justify-center text-muted hover:text-primary hover:bg-surface rounded-xl transition-colors">
        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7"></path>
        </svg>
      </a>
    `);
  }

  if (start > 1) {
    pages.push(`<a href="${baseUrl}${sep}page=1" class="w-10 h-10 flex items-center justify-center text-sm text-muted hover:text-primary hover:bg-surface rounded-xl transition-colors">1</a>`);
    if (start > 2) {
      pages.push(`<span class="px-1 text-muted">...</span>`);
    }
  }

  for (let i = start; i <= end; i++) {
    if (i === currentPage) {
      pages.push(`<span class="w-10 h-10 flex items-center justify-center text-sm bg-primary text-white rounded-xl font-medium">${i}</span>`);
    } else {
      pages.push(`<a href="${baseUrl}${sep}page=${i}" class="w-10 h-10 flex items-center justify-center text-sm text-muted hover:text-primary hover:bg-surface rounded-xl transition-colors">${i}</a>`);
    }
  }

  if (end < totalPages) {
    if (end < totalPages - 1) {
      pages.push(`<span class="px-1 text-muted">...</span>`);
    }
    pages.push(`<a href="${baseUrl}${sep}page=${totalPages}" class="w-10 h-10 flex items-center justify-center text-sm text-muted hover:text-primary hover:bg-surface rounded-xl transition-colors">${totalPages}</a>`);
  }

  if (currentPage < totalPages) {
    pages.push(`
      <a href="${baseUrl}${sep}page=${currentPage + 1}" class="w-10 h-10 flex items-center justify-center text-muted hover:text-primary hover:bg-surface rounded-xl transition-colors">
        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"></path>
        </svg>
      </a>
    `);
  }

  return `
  <nav class="flex items-center justify-center gap-1.5 mt-16" aria-label="Pagination">
    ${pages.join('\n')}
  </nav>
  `;
}