/**
 * Contact Page
 * GET /contact
 * POST /contact (form submission)
 */

import {
  SITE_NAME, DOMAIN,
  escapeHtml, renderHead, renderNav, renderFooter, renderBreadcrumbs,
  renderPage, htmlResponse
} from './_shared.js';

export async function onRequestGet(context) {
  const { request } = context;
  const url = new URL(request.url);
  const baseUrl = `${url.protocol}//${url.host}`;
  const success = url.searchParams.get('success') === 'true';

  const jsonLd = {
    "@context": "https://schema.org",
    "@type": "ContactPage",
    "name": `Contact ${SITE_NAME}`,
    "url": `${baseUrl}/contact`
  };

  const head = renderHead({
    title: 'Contact',
    description: `Get in touch with ${SITE_NAME}. Questions, suggestions, or feedback — we'd love to hear from you.`,
    url: `${baseUrl}/contact`,
    jsonLd
  });

  const body = `
  ${renderNav('/contact')}

  <!-- Breadcrumbs -->
  <div class="border-b border-border">
    <div class="max-w-4xl mx-auto px-6 py-4">
      ${renderBreadcrumbs([
        { label: 'Home', href: '/' },
        { label: 'Contact' }
      ], baseUrl)}
    </div>
  </div>

  <!-- Content -->
  <main class="max-w-4xl mx-auto px-6 py-12">
    <div class="grid grid-cols-1 lg:grid-cols-3 gap-12">

      <!-- Form -->
      <div class="lg:col-span-2">
        <h1 class="text-3xl md:text-5xl font-bold tracking-tight mb-4">Contact Us</h1>
        <p class="text-lg text-muted mb-8">Have a question, suggestion, or feedback? We'd love to hear from you.</p>

        ${success ? `
        <div class="p-4 bg-success-bg border border-success/20 rounded-lg mb-8">
          <p class="font-medium text-success">Message sent! We'll get back to you soon.</p>
        </div>
        ` : ''}

        <form method="POST" action="/contact" class="space-y-6">
          <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
            <div>
              <label class="block text-sm font-medium mb-2" for="name">Name</label>
              <input
                type="text"
                id="name"
                name="name"
                required
                placeholder="Your name"
                class="w-full border border-border rounded-lg px-3 py-2 focus:outline-none focus:ring-2 focus:ring-primary/20 focus:border-primary transition-all"
              >
            </div>
            <div>
              <label class="block text-sm font-medium mb-2" for="email">Email</label>
              <input
                type="email"
                id="email"
                name="email"
                required
                placeholder="you@example.com"
                class="w-full border border-border rounded-lg px-3 py-2 focus:outline-none focus:ring-2 focus:ring-primary/20 focus:border-primary transition-all"
              >
            </div>
          </div>

          <div>
            <label class="block text-sm font-medium mb-2" for="subject">Subject</label>
            <select
              id="subject"
              name="subject"
              required
              class="w-full border border-border rounded-lg px-3 py-2 focus:outline-none focus:ring-2 focus:ring-primary/20 focus:border-primary transition-all"
            >
              <option value="">Select a topic...</option>
              <option value="general">General Inquiry</option>
              <option value="submission">Item Submission</option>
              <option value="correction">Report Incorrect Info</option>
              <option value="partnership">Partnership</option>
              <option value="feedback">Feedback</option>
              <option value="other">Other</option>
            </select>
          </div>

          <div>
            <label class="block text-sm font-medium mb-2" for="message">Message</label>
            <textarea
              id="message"
              name="message"
              required
              rows="5"
              placeholder="How can we help?"
              class="w-full border border-border rounded-lg px-3 py-2 focus:outline-none focus:ring-2 focus:ring-primary/20 focus:border-primary resize-none transition-all"
            ></textarea>
          </div>

          <button
            type="submit"
            class="bg-primary hover:bg-primary-hover text-white font-medium px-8 py-3 rounded-lg transition-all"
          >
            Send Message
          </button>
        </form>
      </div>

      <!-- Sidebar -->
      <div class="space-y-6">
        <div class="bg-surface rounded-xl p-6 border border-border">
          <h3 class="font-semibold mb-4">Other Ways to Reach Us</h3>
          <div class="space-y-4 text-sm text-muted">
            <p>
              <strong class="text-primary block mb-1">Email</strong>
              hello@${DOMAIN}
            </p>
            <p>
              <strong class="text-primary block mb-1">Response Time</strong>
              We typically respond within 1-2 business days.
            </p>
          </div>
        </div>

        <div class="bg-surface rounded-xl p-6 border border-border">
          <h3 class="font-semibold mb-4">Quick Links</h3>
          <ul class="space-y-2 text-sm">
            <li><a href="/faq" class="text-muted hover:text-primary transition-colors">Frequently Asked Questions</a></li>
            <li><a href="/submit" class="text-muted hover:text-primary transition-colors">Submit an Item</a></li>
            <li><a href="/about" class="text-muted hover:text-primary transition-colors">About Us</a></li>
          </ul>
        </div>
      </div>

    </div>
  </main>

  ${renderFooter()}
  `;

  return htmlResponse(renderPage(head, body));
}

export async function onRequestPost(context) {
  const { request } = context;
  const url = new URL(request.url);

  try {
    const formData = await request.formData();
    const name = formData.get('name');
    const email = formData.get('email');
    const subject = formData.get('subject');
    const message = formData.get('message');

    // TODO: Send email or store in database
    // For now, just log and redirect
    console.log('Contact form submission:', { name, email, subject, message });

    // Redirect to success
    return Response.redirect(`${url.origin}/contact?success=true`, 303);

  } catch (error) {
    console.error('Contact form error:', error);
    return Response.redirect(`${url.origin}/contact?error=true`, 303);
  }
}
