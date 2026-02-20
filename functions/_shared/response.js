/**
 * Response helpers — page wrapper, HTTP responses
 */

/**
 * Wrap content in full page HTML
 */
export function renderPage(head, body) {
  return `<!DOCTYPE html>
<html lang="en">
<head>
${head}
</head>
<body class="bg-background text-stone-900 min-h-screen font-sans antialiased">
${body}
</body>
</html>`;
}

/**
 * Create HTML response with proper headers and caching
 */
export function htmlResponse(html, status = 200) {
  return new Response(html, {
    status,
    headers: {
      'Content-Type': 'text/html; charset=utf-8',
      'Cache-Control': 'public, max-age=300'
    }
  });
}

/**
 * Create JSON API response with CORS
 */
export function jsonResponse(data, status = 200) {
  return new Response(JSON.stringify(data), {
    status,
    headers: {
      'Content-Type': 'application/json',
      'Cache-Control': 'public, max-age=300',
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Methods': 'GET, OPTIONS',
      'Access-Control-Allow-Headers': 'Content-Type'
    }
  });
}

/**
 * Create error response
 */
export function errorResponse(message, status = 500) {
  return new Response(message, {
    status,
    headers: { 'Content-Type': 'text/plain' }
  });
}
