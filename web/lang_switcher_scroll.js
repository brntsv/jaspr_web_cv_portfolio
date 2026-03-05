(() => {
  const switcher = document.querySelector('.lang-switcher');
  if (!switcher) return;

  const media = window.matchMedia('(max-aspect-ratio: 1/1)');
  const threshold = 4;
  let active = false;
  let raf = null;

  const applyVisibility = () => {
    if (!active) {
      switcher.classList.remove('lang-switcher--hidden');
      return;
    }
    const atTop = window.scrollY <= threshold;
    switcher.classList.toggle('lang-switcher--hidden', !atTop);
  };

  const onScroll = () => {
    if (!active || raf) return;
    raf = requestAnimationFrame(() => {
      raf = null;
      applyVisibility();
    });
  };

  const onMediaChange = (event) => {
    active = event.matches;
    applyVisibility();
  };

  if (media.addEventListener) {
    media.addEventListener('change', onMediaChange);
  } else {
    media.addListener(onMediaChange);
  }

  window.addEventListener('scroll', onScroll, { passive: true });
  window.addEventListener('resize', onScroll);

  active = media.matches;
  applyVisibility();
})();
