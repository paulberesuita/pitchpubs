/**
 * Best-of Pages
 * GET /best - Best-of index
 * GET /best/[topic] - Specific best-of page
 */

import {
  SITE_NAME, TABLE_NAME, ITEMS_PATH, CATEGORY_FIELD,
  escapeHtml, renderHead, renderNav, renderFooter, renderBreadcrumbs,
  renderCard, renderEmptyState,
  renderPage, htmlResponse
} from '../_shared.js';

export async function onRequestGet(context) {
  const { env, request, params } = context;
  const url = new URL(request.url);
  const baseUrl = `${url.protocol}//${url.host}`;

  const topic = params.slug?.[0];

  // If no topic, show best-of index
  if (!topic) {
    return renderBestOfIndex(context, baseUrl);
  }

  // Otherwise, render specific best-of page
  return renderBestOfPage(context, baseUrl, topic);
}

/**
 * Best-of index page
 */
async function renderBestOfIndex(context, baseUrl) {
  const { env } = context;

  try {
    // Get categories to generate best-of topics
    const { results: categories } = await env.DB.prepare(
      `SELECT ${CATEGORY_FIELD} as category, COUNT(*) as count
       FROM ${TABLE_NAME}
       WHERE ${CATEGORY_FIELD} IS NOT NULL
       GROUP BY ${CATEGORY_FIELD}
       HAVING count >= 3
       ORDER BY count DESC`
    ).all();

    const sampleCats = categories.slice(0, 3).map(c => c.category).join(', ');
    const bestOfJsonLd = {
      "@context": "https://schema.org",
      "@type": "CollectionPage",
      "name": `Best Of | ${SITE_NAME}`,
      "url": `${baseUrl}/best`,
      "numberOfItems": categories.length,
      "hasPart": categories.map(c => ({
        "@type": "ItemList",
        "name": `Best ${c.category}`,
        "url": `${baseUrl}/best/${c.category.toLowerCase().replace(/\s+/g, '-')}`
      }))
    };

    const head = renderHead({
      title: `${categories.length} Best-Of Lists`,
      description: `Curated best-of lists from ${SITE_NAME}.${sampleCats ? ` Including Best ${sampleCats}.` : ''}`,
      url: `${baseUrl}/best`,
      jsonLd: bestOfJsonLd
    });

    const topicsHtml = categories.length > 0
      ? categories.map((cat, i) => {
          const slug = cat.category.toLowerCase().replace(/\s+/g, '-');
          return `
          <a href="/best/${escapeHtml(slug)}" class="group block bg-surface rounded-2xl border border-border card-hover p-7 reveal" style="transition-delay: ${i * 80}ms">
            <div class="flex items-center justify-between">
              <div>
                <h2 class="font-display text-lg font-bold group-hover:text-primary transition-colors duration-200">Best ${escapeHtml(cat.category)}</h2>
                <p class="text-sm text-muted mt-1.5">Top picks from ${cat.count} items</p>
              </div>
              <svg class="w-5 h-5 text-muted group-hover:text-primary transition-colors duration-200" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"></path>
              </svg>
            </div>
          </a>
          `;
        }).join('\n')
      : '';

    const body = `
    ${renderNav('/best')}

    <!-- Breadcrumbs -->
    <div class="border-b border-border">
      <div class="max-w-5xl mx-auto px-6 py-4">
        ${renderBreadcrumbs([
          { label: 'Home', href: '/' },
          { label: 'Best Of' }
        ], baseUrl)}
      </div>
    </div>

    <!-- Content -->
    <main class="max-w-5xl mx-auto px-6 py-14">
      <h1 class="font-display text-3xl md:text-5xl font-bold tracking-tight mb-4 animate-fade-in-up">Best Of</h1>
      <p class="text-lg text-muted mb-10 animate-fade-in-up stagger-2 leading-relaxed">Curated rankings and top picks in each category.</p>

      ${categories.length > 0 ? `
      <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-5">
        ${topicsHtml}
      </div>
      ` : renderEmptyState({
        emoji: '&#127942;',
        title: 'No best-of lists yet',
        message: 'Add more items to generate best-of lists.',
        action: { href: '/submit', label: 'Submit Item' }
      })}
    </main>

    ${renderFooter()}
    `;

    return htmlResponse(renderPage(head, body));

  } catch (error) {
    console.error('Best-of index error:', error);

    const head = renderHead({
      title: 'Best Of',
      description: `Best-of lists from ${SITE_NAME}.`,
      url: `${baseUrl}/best`
    });

    const body = `
    ${renderNav('/best')}
    <main class="max-w-6xl mx-auto px-6 py-12">
      ${renderEmptyState({
        emoji: '🏆',
        title: 'Coming Soon',
        message: 'Best-of lists will appear once we have enough items.',
        action: { href: '/', label: 'Browse All' }
      })}
    </main>
    ${renderFooter()}
    `;

    return htmlResponse(renderPage(head, body));
  }
}

/**
 * Specific best-of page
 */
async function renderBestOfPage(context, baseUrl, topic) {
  const { env } = context;

  try {
    // Convert topic slug to category name
    const categoryResult = await env.DB.prepare(
      `SELECT DISTINCT ${CATEGORY_FIELD} as category FROM ${TABLE_NAME}
       WHERE LOWER(REPLACE(${CATEGORY_FIELD}, ' ', '-')) = ?
       LIMIT 1`
    ).bind(topic.toLowerCase()).first();

    if (!categoryResult) {
      const head = renderHead({
        title: 'Not Found',
        description: 'The requested best-of list could not be found.',
        url: `${baseUrl}/best/${topic}`
      });

      const body = `
      ${renderNav('/best')}
      <main class="max-w-6xl mx-auto px-6 py-12">
        ${renderEmptyState({
          emoji: '🔍',
          title: 'Best-of list not found',
          message: 'This topic doesn\'t exist or has no items.',
          action: { href: '/best', label: 'View All Best-of Lists' }
        })}
      </main>
      ${renderFooter()}
      `;

      return htmlResponse(renderPage(head, body), 404);
    }

    const categoryName = categoryResult.category;

    // Get top items in category (featured first, images-first, then by name)
    const { results: items } = await env.DB.prepare(
      `SELECT * FROM ${TABLE_NAME}
       WHERE ${CATEGORY_FIELD} = ?
       ORDER BY featured DESC, CASE WHEN image_url IS NOT NULL AND image_url != '' THEN 0 ELSE 1 END, name ASC
       LIMIT 10`
    ).bind(categoryName).all();

    // JSON-LD for best-of page
    const jsonLd = {
      "@context": "https://schema.org",
      "@type": "ItemList",
      "name": `Best ${categoryName}`,
      "url": `${baseUrl}/best/${topic}`,
      "numberOfItems": items.length,
      "itemListElement": items.map((item, index) => ({
        "@type": "ListItem",
        "position": index + 1,
        "item": {
          "@type": "Thing",
          "name": item.name,
          "url": `${baseUrl}/${ITEMS_PATH}/${item.slug}`
        }
      }))
    };

    const year = new Date().getFullYear();

    const head = renderHead({
      title: `Best ${categoryName} in ${year}`,
      description: `Top ${items.length} ${categoryName.toLowerCase()} picks. Our curated list of the best options.`,
      url: `${baseUrl}/best/${topic}`,
      jsonLd
    });

    // Render ranked list
    const rankedHtml = items.map((item, index) => {
      const imageHtml = item.image_url
        ? `<img src="${escapeHtml(item.image_url)}" alt="${escapeHtml(item.name)}" width="96" height="96"
             class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500 ease-out" loading="lazy"
             onerror="this.style.display='none';this.nextElementSibling.style.display='flex'">
           <div class="w-full h-full bg-surface items-center justify-center" style="display:none"><span class="text-2xl opacity-20">&#128230;</span></div>`
        : `<div class="w-full h-full bg-surface flex items-center justify-center"><span class="text-2xl opacity-20">&#128230;</span></div>`;

      return `
      <a href="/${ITEMS_PATH}/${escapeHtml(item.slug)}"
         class="group flex gap-6 bg-surface rounded-2xl border border-border card-hover p-5 reveal" style="transition-delay: ${index * 80}ms">
        <!-- Rank -->
        <div class="flex items-center justify-center w-12 h-12 bg-surface rounded-xl text-xl font-display font-bold text-primary shrink-0">
          ${index + 1}
        </div>

        <!-- Image -->
        <div class="w-24 h-24 rounded-xl overflow-hidden bg-surface shrink-0">
          ${imageHtml}
        </div>

        <!-- Content -->
        <div class="flex-1 min-w-0">
          <h3 class="font-display font-bold text-lg group-hover:text-primary transition-colors duration-200">${escapeHtml(item.name)}</h3>
          <p class="text-sm text-muted mt-1.5 line-clamp-2 leading-relaxed">${escapeHtml(item.description || '')}</p>
        </div>

        <!-- Arrow -->
        <svg class="w-5 h-5 text-muted group-hover:text-primary transition-colors duration-200 shrink-0 self-center" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"></path>
        </svg>
      </a>
      `;
    }).join('\n');

    const body = `
    ${renderNav('/best')}

    <!-- Breadcrumbs -->
    <div class="border-b border-border">
      <div class="max-w-4xl mx-auto px-6 py-4">
        ${renderBreadcrumbs([
          { label: 'Home', href: '/' },
          { label: 'Best Of', href: '/best' },
          { label: 'Best ' + escapeHtml(categoryName) }
        ], baseUrl)}
      </div>
    </div>

    <!-- Header with noise texture -->
    <section class="bg-surface border-b border-border">
      <div class="relative z-10 max-w-4xl mx-auto px-6 py-14 text-center">
        <span class="text-5xl mb-5 block animate-fade-in">&#127942;</span>
        <h1 class="font-display text-3xl md:text-5xl font-bold tracking-tight mb-3 animate-fade-in-up stagger-2">Best ${escapeHtml(categoryName)} in ${year}</h1>
        <p class="text-lg text-muted animate-fade-in-up stagger-3">Our top ${items.length} picks, curated for you.</p>
      </div>
    </section>

    <!-- Ranked List -->
    <main class="max-w-4xl mx-auto px-6 py-14">
      <div class="space-y-4">
        ${rankedHtml}
      </div>

      <!-- CTA -->
      <div class="mt-16 text-center">
        <p class="text-muted mb-5">Want to see more options?</p>
        <a href="/category/${topic}" class="bg-primary hover:bg-primary-hover text-white font-medium px-7 py-3.5 rounded-xl transition-all duration-200 inline-block">
          View All ${escapeHtml(categoryName)} &rarr;
        </a>
      </div>
    </main>

    ${renderFooter()}
    `;

    return htmlResponse(renderPage(head, body));

  } catch (error) {
    console.error('Best-of page error:', error);

    const head = renderHead({
      title: 'Error',
      description: 'An error occurred.',
      url: `${baseUrl}/best/${topic}`
    });

    const body = `
    ${renderNav('/best')}
    <main class="max-w-6xl mx-auto px-6 py-12">
      ${renderEmptyState({
        emoji: '⚠️',
        title: 'Something went wrong',
        message: 'Please try again later.',
        action: { href: '/best', label: 'View Best-of Lists' }
      })}
    </main>
    ${renderFooter()}
    `;

    return htmlResponse(renderPage(head, body), 500);
  }
}
