/**
 * Crew / Team Page
 * GET /crew
 *
 * Adds brand personality and E-E-A-T trust.
 * Customize during setup — replace placeholder team with real or fictional members.
 */

import {
  SITE_NAME, EXPERTISE_AREAS,
  escapeHtml, renderHead, renderNav, renderFooter, renderBreadcrumbs,
  renderPage, htmlResponse
} from './_shared.js';

// Team members — customize during setup
// Each member adds E-E-A-T signal (expertise, experience, authoritativeness)
const CREW = [
  {
    name: 'Alex',
    role: 'Founder & Lead Researcher',
    bio: 'Quit a desk job to work from cafes full-time. Has visited 200+ cafes across 15 states.',
    emoji: '\u2615', // coffee
    funFact: 'Can identify a cafe\'s WiFi speed by how fast the menu loads.'
  },
  {
    name: 'Jordan',
    role: 'Community Lead',
    bio: 'Manages submissions and keeps the data accurate. Former barista turned remote worker.',
    emoji: '\uD83D\uDCBB', // laptop
    funFact: 'Has a personal rule: never order just a water.'
  },
  {
    name: 'Sam',
    role: 'Data & Verification',
    bio: 'Verifies every listing. Cross-references reviews, checks hours, and confirms WiFi speeds.',
    emoji: '\uD83D\uDD0D', // magnifying glass
    funFact: 'Once spent 8 hours in a cafe verifying its "all-day" WiFi claim.'
  }
];

export async function onRequestGet(context) {
  const { request } = context;
  const url = new URL(request.url);
  const baseUrl = `${url.protocol}//${url.host}`;

  const jsonLd = {
    "@context": "https://schema.org",
    "@type": "AboutPage",
    "name": `The Crew | ${SITE_NAME}`,
    "url": `${baseUrl}/crew`,
    "mainEntity": {
      "@type": "Organization",
      "name": SITE_NAME,
      "url": baseUrl,
      "knowsAbout": EXPERTISE_AREAS,
      "member": CREW.map(m => ({
        "@type": "Person",
        "name": m.name,
        "jobTitle": m.role
      }))
    }
  };

  const head = renderHead({
    title: 'The Crew',
    description: `Meet the team behind ${SITE_NAME}. ${CREW.length} people dedicated to finding the best spots.`,
    url: `${baseUrl}/crew`,
    jsonLd
  });

  const crewCards = CREW.map((member, i) => `
  <div class="bg-surface rounded-2xl border border-border p-8 reveal" style="transition-delay: ${i * 100}ms">
    <div class="flex items-start gap-5">
      <div class="w-16 h-16 rounded-2xl bg-background border border-border flex items-center justify-center shrink-0">
        <span class="text-2xl">${member.emoji}</span>
      </div>
      <div class="flex-1">
        <h2 class="font-display text-xl font-bold tracking-tight">${escapeHtml(member.name)}</h2>
        <p class="text-sm text-muted mt-1">${escapeHtml(member.role)}</p>
      </div>
    </div>
    <p class="text-muted mt-5 leading-relaxed">${escapeHtml(member.bio)}</p>
    <div class="mt-5 pt-5 border-t border-border">
      <p class="text-sm text-muted"><span class="font-medium text-primary">Fun fact:</span> ${escapeHtml(member.funFact)}</p>
    </div>
  </div>
  `).join('\n');

  const body = `
  ${renderNav('/crew')}

  <!-- Breadcrumbs -->
  <div class="border-b border-border">
    <div class="max-w-4xl mx-auto px-6 py-4">
      ${renderBreadcrumbs([
        { label: 'Home', href: '/' },
        { label: 'The Crew' }
      ], baseUrl)}
    </div>
  </div>

  <!-- Header -->
  <section class="border-b border-border">
    <div class="max-w-4xl mx-auto px-6 py-14">
      <h1 class="font-display text-3xl md:text-5xl font-bold tracking-tight mb-3 animate-fade-in-up">The Crew</h1>
      <p class="text-lg text-muted animate-fade-in-up stagger-2">The people behind ${escapeHtml(SITE_NAME)}.</p>
    </div>
  </section>

  <!-- Crew Cards -->
  <main class="max-w-4xl mx-auto px-6 py-14">
    <div class="grid grid-cols-1 md:grid-cols-2 gap-7">
      ${crewCards}
    </div>

    <!-- Join CTA -->
    <div class="mt-16 bg-surface rounded-2xl border border-border p-8 text-center reveal">
      <h2 class="font-display text-xl font-bold tracking-tight mb-3">Know a spot we're missing?</h2>
      <p class="text-muted mb-6 max-w-md mx-auto">We're always looking for great recommendations from the community.</p>
      <a href="/submit" class="inline-block bg-primary hover:bg-primary-hover text-white font-medium px-6 py-3 rounded-xl transition-colors">
        Submit a Spot
      </a>
    </div>
  </main>

  ${renderFooter()}
  `;

  return htmlResponse(renderPage(head, body));
}
