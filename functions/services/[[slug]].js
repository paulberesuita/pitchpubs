/**
 * Services / Tours Pages
 * GET /services - Services index (all services with filters)
 * GET /services/[slug] - Service detail page
 *
 * Optional monetization layer — related businesses, tours, or services
 * with booking links (affiliate-friendly). Links back to directory items.
 *
 * Renders gracefully even if the services table doesn't exist yet.
 */

import {
  SITE_NAME, TABLE_NAME, ITEMS_PATH, PROD_BASE,
  escapeHtml, slugify, renderHead, renderNav, renderFooter, renderBreadcrumbs,
  renderCard, renderEmptyState,
  renderPage, htmlResponse
} from '../_shared.js';

export async function onRequestGet(context) {
  const { params, request } = context;
  const url = new URL(request.url);
  const baseUrl = `${url.protocol}//${url.host}`;

  const slug = params.slug?.[0];

  if (!slug) {
    return renderServicesIndex(context, baseUrl);
  }

  return renderServiceDetail(context, baseUrl, slug);
}

/**
 * Services index — all services grouped by city
 */
async function renderServicesIndex(context, baseUrl) {
  const { env, request } = context;
  const url = new URL(request.url);
  const cityFilter = url.searchParams.get('city');

  try {
    // Check if services table exists
    let services, cities;
    try {
      let query = 'SELECT * FROM services ORDER BY featured DESC, city ASC, name ASC';
      const bindings = [];

      if (cityFilter) {
        query = 'SELECT * FROM services WHERE city = ? ORDER BY featured DESC, name ASC';
        bindings.push(cityFilter);
      }

      const result = await env.DB.prepare(query).bind(...bindings).all();
      services = result.results;

      const citiesResult = await env.DB.prepare(
        `SELECT city, state, COUNT(*) as count
         FROM services
         WHERE city IS NOT NULL AND city != ''
         GROUP BY city, state
         ORDER BY count DESC, city ASC`
      ).all();
      cities = citiesResult.results;
    } catch (e) {
      // Table doesn't exist yet
      services = [];
      cities = [];
    }

    // Get service types for filter
    let serviceTypes = [];
    try {
      const typesResult = await env.DB.prepare(
        `SELECT service_type, COUNT(*) as count
         FROM services
         WHERE service_type IS NOT NULL AND service_type != ''
         GROUP BY service_type
         ORDER BY count DESC`
      ).all();
      serviceTypes = typesResult.results;
    } catch (e) { /* table doesn't exist */ }

    const jsonLd = {
      "@context": "https://schema.org",
      "@type": "CollectionPage",
      "name": `Services | ${SITE_NAME}`,
      "url": `${PROD_BASE}/services`,
      "numberOfItems": services.length
    };

    const head = renderHead({
      title: cityFilter ? `Services in ${cityFilter}` : 'Services & Tours',
      description: `Explore ${services.length} services and tours related to ${SITE_NAME}.${cityFilter ? ` Filtered by ${cityFilter}.` : ''}`,
      url: `${baseUrl}/services`,
      jsonLd
    });

    // City filter pills
    const cityPills = cities.map(c => {
      const isActive = cityFilter === c.city;
      return `
        <a href="/services?city=${encodeURIComponent(c.city)}"
           class="${isActive ? 'bg-primary text-white font-medium' : 'bg-surface hover:bg-surface-hover text-muted hover:text-primary border border-border'} text-sm px-4 py-2 rounded-xl transition-all duration-200">
          ${escapeHtml(c.city)} (${c.count})
        </a>
      `;
    }).join('\n');

    // Service cards
    const serviceCards = services.map((s, i) => `
    <a href="/services/${escapeHtml(s.slug)}" class="group block bg-white rounded-2xl overflow-hidden border border-border card-hover reveal" style="transition-delay: ${Math.min(i, 12) * 60}ms">
      ${s.image_url ? `
      <div class="aspect-[16/9] overflow-hidden">
        <img src="${escapeHtml(s.image_url)}" alt="${escapeHtml(s.name)}" width="400" height="225"
             class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500 ease-out" loading="lazy">
      </div>
      ` : ''}
      <div class="p-5">
        <div class="flex items-start justify-between gap-3">
          <h3 class="font-display font-semibold group-hover:text-muted transition-colors">${escapeHtml(s.name)}</h3>
          ${s.price_range ? `<span class="text-sm text-muted whitespace-nowrap">${escapeHtml(s.price_range)}</span>` : ''}
        </div>
        ${s.description ? `<p class="text-sm text-muted mt-1.5 line-clamp-2 leading-relaxed">${escapeHtml(s.description)}</p>` : ''}
        <div class="flex items-center gap-3 mt-3">
          ${s.service_type ? `<span class="text-xs bg-surface text-muted px-2.5 py-1 rounded-lg">${escapeHtml(s.service_type)}</span>` : ''}
          ${s.city ? `<span class="text-xs text-muted">${escapeHtml([s.city, s.state].filter(Boolean).join(', '))}</span>` : ''}
        </div>
      </div>
    </a>
    `).join('\n');

    const body = `
    ${renderNav('/services')}

    <!-- Breadcrumbs -->
    <div class="border-b border-border">
      <div class="max-w-5xl mx-auto px-6 py-4">
        ${renderBreadcrumbs([
          { label: 'Home', href: '/' },
          { label: 'Services' }
        ], baseUrl)}
      </div>
    </div>

    <!-- Header -->
    <section class="bg-surface border-b border-border">
      <div class="relative z-10 max-w-5xl mx-auto px-6 py-14">
        <h1 class="font-display text-3xl md:text-5xl font-bold tracking-tight mb-3 animate-fade-in-up">Services & Tours</h1>
        <p class="text-lg text-muted animate-fade-in-up stagger-2">Related businesses and experiences</p>
      </div>
    </section>

    <!-- Items -->
    <main class="max-w-5xl mx-auto px-6 py-14">
      ${services.length > 0 ? `

      <!-- Filters -->
      ${cities.length > 1 ? `
      <div class="flex flex-wrap items-center gap-2.5 mb-10 reveal">
        <a href="/services"
           class="${!cityFilter ? 'bg-primary text-white font-medium' : 'bg-surface hover:bg-surface-hover text-muted hover:text-primary border border-border'} text-sm px-4 py-2 rounded-xl transition-all duration-200">
          All
        </a>
        ${cityPills}
      </div>
      ` : ''}

      <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-7">
        ${serviceCards}
      </div>
      ` : renderEmptyState({
        emoji: '&#127915;',
        title: 'No services yet',
        message: 'Related tours and services will appear here once added.',
        action: { href: '/submit', label: 'Submit' }
      })}
    </main>

    ${renderFooter()}
    `;

    return htmlResponse(renderPage(head, body));

  } catch (error) {
    console.error('Services index error:', error);

    const head = renderHead({
      title: 'Services',
      description: `Services and tours in ${SITE_NAME}.`,
      url: `${baseUrl}/services`
    });

    const body = `
    ${renderNav('/services')}
    <main class="max-w-6xl mx-auto px-6 py-12">
      ${renderEmptyState({
        emoji: '&#127915;',
        title: 'No services yet',
        message: 'Check back later for tours and services.',
        action: { href: '/', label: 'Go Home' }
      })}
    </main>
    ${renderFooter()}
    `;

    return htmlResponse(renderPage(head, body));
  }
}

/**
 * Service detail page — with booking link and linked items
 */
async function renderServiceDetail(context, baseUrl, slug) {
  const { env } = context;

  try {
    let service;
    try {
      service = await env.DB.prepare(
        'SELECT * FROM services WHERE slug = ?'
      ).bind(slug).first();
    } catch (e) {
      service = null; // table doesn't exist
    }

    if (!service) {
      const head = renderHead({
        title: 'Not Found',
        description: 'The requested service could not be found.',
        url: `${baseUrl}/services/${slug}`,
        noindex: true
      });

      const body = `
      ${renderNav('/services')}
      <main class="max-w-6xl mx-auto px-6 py-12">
        ${renderEmptyState({
          emoji: '&#128270;',
          title: 'Service not found',
          message: 'This service doesn\'t exist or has been removed.',
          action: { href: '/services', label: 'View All Services' }
        })}
      </main>
      ${renderFooter()}
      `;

      return htmlResponse(renderPage(head, body), 404);
    }

    // Parse linked items
    let linkedSlugs = [];
    if (service.linked_items) {
      try { linkedSlugs = JSON.parse(service.linked_items); } catch (e) { /* ignore */ }
    }

    // Fetch linked items from main table
    let linkedItems = [];
    if (linkedSlugs.length > 0) {
      const placeholders = linkedSlugs.map(() => '?').join(',');
      const result = await env.DB.prepare(
        `SELECT * FROM ${TABLE_NAME} WHERE slug IN (${placeholders}) LIMIT 8`
      ).bind(...linkedSlugs).all();
      linkedItems = result.results;
    }

    // Get related services in same city
    let relatedServices = [];
    if (service.city) {
      try {
        const result = await env.DB.prepare(
          `SELECT * FROM services WHERE city = ? AND slug != ? ORDER BY RANDOM() LIMIT 4`
        ).bind(service.city, slug).all();
        relatedServices = result.results;
      } catch (e) { /* ignore */ }
    }

    // Parse sources
    let sources = [];
    if (service.sources) {
      try { sources = JSON.parse(service.sources); } catch (e) { /* ignore */ }
    }

    // JSON-LD — LocalBusiness schema for services
    const jsonLd = {
      "@context": "https://schema.org",
      "@type": "LocalBusiness",
      "name": service.name,
      "description": service.description,
      "url": `${PROD_BASE}/services/${slug}`,
      ...(service.image_url && { "image": service.image_url.startsWith('http') ? service.image_url : `${PROD_BASE}/images/${service.image_url}` }),
      ...(service.price_range && { "priceRange": service.price_range }),
      ...(service.booking_url && { "url": service.booking_url }),
      ...((service.city || service.state) && {
        "address": {
          "@type": "PostalAddress",
          ...(service.city && { "addressLocality": service.city }),
          ...(service.state && { "addressRegion": service.state })
        }
      })
    };

    const head = renderHead({
      title: service.name,
      description: (service.description || `${service.name} — a service listed on ${SITE_NAME}.`).substring(0, 155),
      url: `${baseUrl}/services/${slug}`,
      image: service.image_url,
      jsonLd
    });

    const imageHtml = service.image_url
      ? `<img src="${escapeHtml(service.image_url)}" alt="${escapeHtml(service.name)}" width="800" height="400" class="w-full h-full object-cover" loading="eager">`
      : `<div class="w-full h-full bg-surface flex items-center justify-center"><span class="text-4xl opacity-30">&#127915;</span></div>`;

    const body = `
    ${renderNav('/services')}

    <!-- Breadcrumbs -->
    <div class="border-b border-border">
      <div class="max-w-4xl mx-auto px-6 py-4">
        ${renderBreadcrumbs([
          { label: 'Home', href: '/' },
          { label: 'Services', href: '/services' },
          { label: service.name }
        ], baseUrl)}
      </div>
    </div>

    <!-- Main Content -->
    <main class="max-w-4xl mx-auto px-6 py-12">

      <!-- Header Card -->
      <div class="bg-surface rounded-2xl border border-border overflow-hidden mb-10 animate-fade-in-up">
        <div class="aspect-[2/1] bg-surface overflow-hidden">
          ${imageHtml}
        </div>
        <div class="p-8 md:p-10">
          <div class="flex flex-col md:flex-row md:items-start md:justify-between gap-6">
            <div class="flex-1">
              <h1 class="font-display text-3xl md:text-5xl font-bold tracking-tight mb-4">${escapeHtml(service.name)}</h1>
              <p class="text-lg text-muted mb-5 leading-relaxed">${escapeHtml(service.description || '')}</p>
              <div class="flex flex-wrap items-center gap-3">
                ${service.service_type ? `<span class="text-sm bg-background text-muted px-4 py-1.5 rounded-xl border border-border">${escapeHtml(service.service_type)}</span>` : ''}
                ${service.price_range ? `<span class="text-sm font-medium text-primary">${escapeHtml(service.price_range)}</span>` : ''}
              </div>
            </div>
            ${service.booking_url ? `
            <div class="flex flex-col gap-3 md:min-w-[180px]">
              <a href="${escapeHtml(service.booking_url)}" target="_blank" rel="nofollow noopener noreferrer"
                 class="bg-primary hover:bg-primary-hover text-white font-medium px-6 py-3.5 rounded-xl transition-all duration-200 text-center">
                Book Now &rarr;
              </a>
              ${service.website_url ? `
              <a href="${escapeHtml(service.website_url)}" target="_blank" rel="nofollow noopener noreferrer"
                 class="text-sm text-muted hover:text-primary text-center transition-colors">
                Visit Website
              </a>
              ` : ''}
            </div>
            ` : service.website_url ? `
            <div class="flex flex-col gap-3 md:min-w-[180px]">
              <a href="${escapeHtml(service.website_url)}" target="_blank" rel="nofollow noopener noreferrer"
                 class="bg-primary hover:bg-primary-hover text-white font-medium px-6 py-3.5 rounded-xl transition-all duration-200 text-center">
                Visit Website &rarr;
              </a>
            </div>
            ` : ''}
          </div>
        </div>
      </div>

      <!-- Content Grid -->
      <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">

        <!-- Main Content -->
        <div class="lg:col-span-2 space-y-8">
          ${service.content ? `
          <section class="bg-surface rounded-2xl border border-border p-8 reveal">
            <h2 class="font-display text-2xl font-bold tracking-tight mb-5">About</h2>
            <div class="prose prose-stone max-w-none text-muted leading-relaxed">
              <p>${escapeHtml(service.content)}</p>
            </div>
          </section>
          ` : ''}

          ${linkedItems.length > 0 ? `
          <section class="reveal">
            <h2 class="font-display text-2xl font-bold tracking-tight mb-6">Related Places</h2>
            <div class="grid grid-cols-1 sm:grid-cols-2 gap-5">
              ${linkedItems.map((item, i) => `<div class="reveal" style="transition-delay: ${i * 80}ms">${renderCard(item)}</div>`).join('\n')}
            </div>
          </section>
          ` : ''}
        </div>

        <!-- Sidebar -->
        <div class="space-y-6">
          <div class="bg-surface rounded-2xl border border-border p-6 reveal">
            <h3 class="font-display font-bold text-xs uppercase tracking-[0.15em] text-muted mb-5">Details</h3>
            <dl class="space-y-5">
              ${service.service_type ? `
              <div>
                <dt class="text-sm text-muted mb-1">Type</dt>
                <dd class="font-medium">${escapeHtml(service.service_type)}</dd>
              </div>
              ` : ''}
              ${service.price_range ? `
              <div class="border-t border-border pt-5">
                <dt class="text-sm text-muted mb-1">Price</dt>
                <dd class="font-medium">${escapeHtml(service.price_range)}</dd>
              </div>
              ` : ''}
              ${(service.city || service.state) ? `
              <div class="border-t border-border pt-5">
                <dt class="text-sm text-muted mb-1">Location</dt>
                <dd>${escapeHtml([service.city, service.state].filter(Boolean).join(', '))}</dd>
              </div>
              ` : ''}
              <div class="border-t border-border pt-5">
                <dt class="text-sm text-muted mb-1">Last Updated</dt>
                <dd>${(service.updated_at || service.created_at) ? new Date(service.updated_at || service.created_at).toLocaleDateString('en-US', { year: 'numeric', month: 'long', day: 'numeric' }) : 'Unknown'}</dd>
              </div>
            </dl>
          </div>
        </div>

      </div>

      ${relatedServices.length > 0 ? `
      <section class="mt-16 reveal">
        <h2 class="font-display text-2xl font-bold tracking-tight mb-8">More Services in ${escapeHtml(service.city)}</h2>
        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-5">
          ${relatedServices.map((s, i) => `
          <a href="/services/${escapeHtml(s.slug)}" class="group block bg-surface rounded-2xl border border-border p-5 card-hover reveal" style="transition-delay: ${i * 80}ms">
            <h3 class="font-display font-semibold text-sm group-hover:text-muted transition-colors">${escapeHtml(s.name)}</h3>
            ${s.price_range ? `<p class="text-xs text-muted mt-1">${escapeHtml(s.price_range)}</p>` : ''}
          </a>
          `).join('\n')}
        </div>
      </section>
      ` : ''}

    </main>

    ${renderFooter()}
    `;

    return htmlResponse(renderPage(head, body));

  } catch (error) {
    console.error('Service detail error:', error);

    const head = renderHead({
      title: 'Error',
      description: 'An error occurred.',
      url: `${baseUrl}/services/${slug}`
    });

    const body = `
    ${renderNav('/services')}
    <main class="max-w-6xl mx-auto px-6 py-12">
      ${renderEmptyState({
        emoji: '&#9888;',
        title: 'Something went wrong',
        message: 'Please try again later.',
        action: { href: '/services', label: 'View All Services' }
      })}
    </main>
    ${renderFooter()}
    `;

    return htmlResponse(renderPage(head, body), 500);
  }
}
