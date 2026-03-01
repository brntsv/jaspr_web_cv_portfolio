(() => {
  const MAX_VISIBLE_DOTS = 7;
  const prefersReduced = () =>
    window.matchMedia && window.matchMedia('(prefers-reduced-motion: reduce)').matches;

  const initPhone = (phone) => {
    if (phone.dataset.autoplayInit === '1') return;
    phone.dataset.autoplayInit = '1';

    const track = phone.querySelector('.phone-track');
    if (!track) return;
    const dotsWrap = phone.querySelector('.dots');
    const dotsTrack = phone.querySelector('.dots-track');
    const dots = Array.from(
      dotsTrack ? dotsTrack.querySelectorAll('.dot') : phone.querySelectorAll('.dot'),
    );

    const slideCountAttr = parseInt(phone.dataset.slideCount || '', 10);
    const slideCount = Number.isFinite(slideCountAttr)
      ? slideCountAttr
      : Math.max(dots.length, track.children.length);
    const intervalMs = parseInt(phone.dataset.slideInterval || '10000', 10);
    const pauseMs = parseInt(phone.dataset.slidePause || String(intervalMs), 10);
    const getCssNumber = (prop, fallback) => {
      if (!dotsWrap) return fallback;
      const value = parseFloat(getComputedStyle(dotsWrap).getPropertyValue(prop));
      return Number.isFinite(value) ? value : fallback;
    };
    const dotSize = getCssNumber('--dot-size', 8);
    const dotGap = getCssNumber('--dot-gap', 4);
    const maxVisibleDots = Math.max(1, Math.round(getCssNumber('--dot-max', MAX_VISIBLE_DOTS)));
    const visibleDots = Math.min(maxVisibleDots, slideCount);

    if (dotsWrap && dotsTrack && dots.length > 0) {
      const width = dotSize * visibleDots + dotGap * Math.max(visibleDots - 1, 0);
      dotsWrap.style.width = `${width}px`;
      dotsWrap.style.justifyContent = slideCount <= visibleDots ? 'center' : 'flex-start';
    }

    let index = 0;
    let timer = null;
    let pauseTimer = null;
    let paused = false;

    const updateDots = (i) => {
      dots.forEach((dot, idx) => {
        if (idx === i) dot.classList.add('active');
        else dot.classList.remove('active');
      });

      if (!dotsWrap || !dotsTrack || dots.length === 0) return;
      if (slideCount <= visibleDots) {
        dotsTrack.style.transform = 'translateX(0px)';
        return;
      }
      const half = Math.floor(visibleDots / 2);
      const start = Math.max(0, Math.min(i - half, slideCount - visibleDots));
      const offset = -(dotSize + dotGap) * start;
      dotsTrack.style.transform = `translateX(${offset}px)`;
    };

    const scrollToIndex = (i, behavior = 'smooth') => {
      track.scrollTo({ left: i * track.clientWidth, behavior });
    };

    const start = () => {
      if (prefersReduced()) return;
      if (timer) clearInterval(timer);
      timer = setInterval(() => {
        if (paused || slideCount <= 1) return;
        index = (index + 1) % slideCount;
        scrollToIndex(index);
        updateDots(index);
      }, intervalMs);
    };

    const stop = () => {
      if (timer) {
        clearInterval(timer);
        timer = null;
      }
    };

    const pause = () => {
      paused = true;
      stop();
      if (pauseTimer) clearTimeout(pauseTimer);
      pauseTimer = setTimeout(() => {
        paused = false;
        start();
      }, pauseMs);
    };

    let isDragging = false;
    let dragPointerId = null;
    let dragStartX = 0;
    let dragStartScrollLeft = 0;
    let dragMoved = false;

    const startDrag = (event) => {
      if (event.pointerType !== 'mouse' && event.pointerType !== 'pen') return;
      if (event.button && event.button !== 0) return;
      isDragging = true;
      dragMoved = false;
      dragPointerId = event.pointerId;
      dragStartX = event.clientX;
      dragStartScrollLeft = track.scrollLeft;
      track.classList.add('dragging');
      if (track.setPointerCapture) track.setPointerCapture(event.pointerId);
      track.style.scrollSnapType = 'none';
    };

    const moveDrag = (event) => {
      if (!isDragging || event.pointerId !== dragPointerId) return;
      const delta = dragStartX - event.clientX;
      if (Math.abs(delta) > 2) dragMoved = true;
      track.scrollLeft = dragStartScrollLeft + delta * 1.15;
      event.preventDefault();
    };

    const endDrag = (event) => {
      if (!isDragging || event.pointerId !== dragPointerId) return;
      isDragging = false;
      dragPointerId = null;
      track.classList.remove('dragging');
      track.style.scrollSnapType = '';
      if (!dragMoved) return;
      const width = track.clientWidth || 1;
      const delta = dragStartX - event.clientX;
      const threshold = Math.max(40, width * 0.2);

      if (delta > threshold) {
        index = index >= slideCount - 1 ? 0 : index + 1;
      } else if (delta < -threshold) {
        index = index <= 0 ? slideCount - 1 : index - 1;
      } else {
        const current = Math.round(track.scrollLeft / width);
        index = Math.max(0, Math.min(slideCount - 1, current));
      }

      scrollToIndex(index);
      updateDots(index);
    };

    let scrollRaf = null;
    track.addEventListener('scroll', () => {
      if (scrollRaf) return;
      scrollRaf = requestAnimationFrame(() => {
        scrollRaf = null;
        const current = Math.round(track.scrollLeft / track.clientWidth);
        if (current !== index) {
          index = current;
          updateDots(index);
        }
      });
    });

    track.addEventListener('pointerdown', (event) => {
      pause();
      startDrag(event);
    });
    track.addEventListener('pointermove', moveDrag);
    track.addEventListener('pointerup', endDrag);
    track.addEventListener('pointercancel', endDrag);
    track.addEventListener('lostpointercapture', endDrag);
    track.addEventListener('touchstart', pause, { passive: true });
    track.addEventListener('wheel', pause, { passive: true });
    phone.addEventListener('pointerenter', () => {
      paused = true;
      stop();
    });
    phone.addEventListener('pointerleave', () => {
      paused = false;
      start();
    });

    updateDots(0);

    if ('IntersectionObserver' in window) {
      const observer = new IntersectionObserver(
        (entries) => {
          entries.forEach((entry) => {
            if (entry.isIntersecting) {
              paused = false;
              start();
            } else {
              paused = true;
              stop();
            }
          });
        },
        { threshold: 0.3 },
      );
      observer.observe(phone);
    } else {
      start();
    }
  };

  const initAll = () => {
    document.querySelectorAll('.phone').forEach(initPhone);
  };

  window.addEventListener('load', () => {
    initAll();

    if ('MutationObserver' in window) {
      const observer = new MutationObserver(() => initAll());
      observer.observe(document.body, { childList: true, subtree: true });
    }
  });
})();
