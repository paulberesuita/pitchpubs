/**
 * About Page
 * GET /about
 */

import {
  SITE_NAME,
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
    "url": `${baseUrl}/about`,
    "mainEntity": {
      "@type": "Organization",
      "name": SITE_NAME,
      "url": baseUrl
    }
  };

  const head = renderHead({
    title: 'About',
    description: `Learn more about ${SITE_NAME} — our mission, what we do, and why we built this directory.`,
    url: `${baseUrl}/about`,
    jsonLd
  });

  const body = `
  ${renderNav('/about')}

  <!-- Breadcrumbs -->
  <div class="border-b border-border">
    <div class="max-w-4xl mx-auto px-6 py-4">
      ${renderBreadcrumbs([
        { label: 'Home', href: '/' },
        { label: 'About' }
      ], baseUrl)}
    </div>
  </div>

  <!-- Content -->
  <main class="max-w-3xl mx-auto px-6 py-14">
    <article class="bg-surface rounded-2xl border border-border p-8 md:p-12 animate-fade-in-up">
      <h1 class="font-display text-3xl md:text-5xl font-bold tracking-tight mb-8">About ${SITE_NAME}</h1>

      <div class="prose prose-stone max-w-none text-muted leading-relaxed space-y-6">
        <p class="text-lg leading-relaxed">
          ${SITE_NAME} is a curated directory of work-friendly cafes. We help remote workers, freelancers, and anyone with a laptop find the right place to get things done.
        </p>

        <h2 id="our-mission" class="font-display text-xl font-bold text-primary mt-12 mb-4">Why We Built This</h2>
        <p>
          Finding a good cafe to work from shouldn't require trial and error. You show up, the WiFi is slow, there are no outlets, and the staff gives you looks after an hour. We've been there. ${SITE_NAME} exists so you don't have to guess anymore.
        </p>

        <h2 class="font-display text-xl font-bold text-primary mt-12 mb-4">What We Look For</h2>
        <p>
          Not every cafe is a good work cafe. We evaluate spots on the things that actually matter to people working remotely:
        </p>
        <ul class="list-disc list-inside space-y-3">
          <li><strong>WiFi speed and reliability</strong> — Can you take a video call without buffering?</li>
          <li><strong>Power access</strong> — Are there enough outlets, and are they reachable?</li>
          <li><strong>Seating comfort</strong> — Can you sit for 3 hours without your back giving out?</li>
          <li><strong>Noise level</strong> — Buzzy and social, or quiet and focused?</li>
          <li><strong>Vibe</strong> — Do they welcome laptop workers or barely tolerate them?</li>
        </ul>

        <h2 id="how-we-research" class="font-display text-xl font-bold text-primary mt-12 mb-4">How We Research</h2>
        <p>
          Every cafe in our directory has been visited or verified by remote workers. We cross-reference reviews, check WiFi speeds, and confirm details before publishing. If something changes — a cafe closes, drops its WiFi quality, or stops welcoming workers — we update the listing.
        </p>

        <h2 class="font-display text-xl font-bold text-primary mt-12 mb-4">Contribute</h2>
        <p>
          Know a great work cafe we're missing? We'd love to hear about it. Every submission is reviewed before being added to the directory.
        </p>
        <p>
          <a href="/submit" class="text-primary hover:text-primary-hover font-medium transition-colors duration-200">Submit a cafe &rarr;</a>
        </p>
      </div>
    </article>
  </main>

  ${renderFooter()}
  `;

  return htmlResponse(renderPage(head, body));
}
