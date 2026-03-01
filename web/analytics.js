(() => {
  const meta = document.querySelector('meta[name="analytics-domain"]');
  const domain = meta && meta.content ? meta.content.trim() : '';
  if (!domain) return;

  const script = document.createElement('script');
  script.defer = true;
  script.setAttribute('data-domain', domain);
  script.src = 'https://plausible.io/js/script.js';
  document.head.appendChild(script);
})();
