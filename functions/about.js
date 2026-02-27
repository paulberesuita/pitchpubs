/**
 * About Page
 * GET /about
 */

import {
  SITE_NAME, PROD_BASE,
  renderHead, renderNav, renderFooter, renderBreadcrumbs,
  renderPage, htmlResponse
} from './_shared.js';

export async function onRequestGet(context) {
  const { request } = context;
  const url = new URL(request.url);
  const baseUrl = `${url.protocol}//${url.host}`;

  const jsonLd = {
    "@context": "https://schema.org",
    "@type": "AboutPage",
    "name": `About ${SITE_NAME}`,
    "url": `${PROD_BASE}/about`,
    "mainEntity": {
      "@type": "Organization",
      "name": SITE_NAME,
      "url": PROD_BASE
    }
  };

  const head = renderHead({
    title: 'About',
    description: `Learn more about ${SITE_NAME} — why we built the definitive guide to soccer bars in America.`,
    url: `${baseUrl}/about`,
    jsonLd
  });

  const body = `
  ${renderNav('/about')}
      ${renderBreadcrumbs([
        { label: 'Home', href: '/' },
        { label: 'About' }
      ], baseUrl)}

  <!-- Content -->
  <main class="max-w-3xl mx-auto px-6 py-14">
    <article class="bg-surface rounded-2xl border border-border p-8 md:p-12 animate-fade-in-up">
      <h1 class="font-display text-3xl md:text-5xl font-bold tracking-tight mb-8">About ${SITE_NAME}</h1>

      <div class="prose prose-stone max-w-none text-muted leading-relaxed space-y-6">
        <p class="text-lg leading-relaxed">
          ${SITE_NAME} is a curated directory of the best soccer-friendly bars across America. We help fans find the right place to watch — whether it's a 7:30 AM Premier League kickoff, a Champions League night, or a World Cup 2026 match.
        </p>

        <h2 id="our-mission" class="font-display text-xl font-bold text-primary mt-12 mb-4">Why We Built This</h2>
        <p>
          Finding a good soccer bar shouldn't be guesswork. You want to know: Will they actually have the match on? Will they open early for a morning kickoff? Is there a supporters' group that watches here? ${SITE_NAME} answers those questions so you can just show up and watch.
        </p>

        <h2 class="font-display text-xl font-bold text-primary mt-12 mb-4">What We Look For</h2>
        <p>
          Not every sports bar is a soccer bar. We look for places where football is the priority, not an afterthought:
        </p>
        <ul class="list-disc list-inside space-y-3">
          <li><strong>Match coverage</strong> — Do they show Premier League, La Liga, Champions League, MLS, and international matches?</li>
          <li><strong>Early opens</strong> — Will they open at 7 AM for a morning kickoff?</li>
          <li><strong>Fan culture</strong> — Are there supporter groups, chants, and real atmosphere?</li>
          <li><strong>Screens and sound</strong> — Can you actually hear the commentary, or is it drowned out?</li>
          <li><strong>The vibe</strong> — Does it feel like a match day, or just a bar with a TV?</li>
        </ul>

        <h2 id="how-we-research" class="font-display text-xl font-bold text-primary mt-12 mb-4">How We Research</h2>
        <p>
          Every bar in our directory has been verified through supporter communities, local fan groups, and direct outreach. We cross-reference Google reviews, Reddit threads, and social media to confirm each bar is genuinely soccer-friendly. When things change — a bar stops showing matches or a new spot opens — we update the listing.
        </p>

        <h2 class="font-display text-xl font-bold text-primary mt-12 mb-4">Contribute</h2>
        <p>
          Know a great soccer bar we're missing? We'd love to hear about it. Every submission is reviewed before being added to the directory.
        </p>
        <p>
          <a href="/submit" class="text-accent hover:text-accent-hover font-medium transition-colors duration-200">Submit a bar &rarr;</a>
        </p>
      </div>
    </article>
  </main>

  ${renderFooter()}
  `;

  return htmlResponse(renderPage(head, body));
}
