/**
 * LOVE CAKE HOUSE - SCRIPT
 * Trincomalee, Sri Lanka | WhatsApp: 0707070021
 */

document.addEventListener('DOMContentLoaded', () => {
  // Mobile Navigation Toggle
  const mobileToggle = document.getElementById('mobileMenuToggle');
  const mainNav = document.getElementById('mainNav');

  if (mobileToggle && mainNav) {
    mobileToggle.addEventListener('click', () => {
      mainNav.classList.toggle('open');
      mobileToggle.textContent = mainNav.classList.contains('open') ? '✕' : '☰';
    });

    mainNav.querySelectorAll('.nav-link').forEach(link => {
      link.addEventListener('click', () => {
        mainNav.classList.remove('open');
        mobileToggle.textContent = '☰';
      });
    });
  }

  // Active Nav Link highlighting on scroll
  const sections = document.querySelectorAll('section[id]');
  const navLinks = document.querySelectorAll('.main-nav .nav-link');

  window.addEventListener('scroll', () => {
    let current = '';
    const scrollY = window.pageYOffset;

    sections.forEach(section => {
      const sectionTop = section.offsetTop - 120;
      const sectionHeight = section.offsetHeight;
      if (scrollY >= sectionTop && scrollY < sectionTop + sectionHeight) {
        current = section.getAttribute('id');
      }
    });

    navLinks.forEach(link => {
      link.classList.remove('active');
      if (link.getAttribute('href') === `#${current}`) {
        link.classList.add('active');
      }
    });
  });

  // Category Filter Buttons for Our Cakes
  const filterBtns = document.querySelectorAll('.filter-btn');
  const cakeCards = document.querySelectorAll('.cake-product-card');

  filterBtns.forEach(btn => {
    btn.addEventListener('click', () => {
      filterBtns.forEach(b => b.classList.remove('active'));
      btn.classList.add('active');

      const filter = btn.getAttribute('data-filter');

      cakeCards.forEach(card => {
        const category = card.getAttribute('data-category');
        if (filter === 'all' || category === filter) {
          card.style.display = 'flex';
        } else {
          card.style.display = 'none';
        }
      });
    });
  });

  // Contact Order Form -> Direct WhatsApp to 0707070021
  const contactForm = document.getElementById('contactForm');
  if (contactForm) {
    contactForm.addEventListener('submit', (e) => {
      e.preventDefault();

      const name = document.getElementById('custName').value.trim();
      const cakeType = document.getElementById('custCake').value;
      const date = document.getElementById('custDate').value;
      const message = document.getElementById('custMessage').value.trim();

      let text = `Hello Love Cake House! I would like to order a cake:%0A%0A`;
      if (name) text += `*Name:* ${encodeURIComponent(name)}%0A`;
      text += `*Cake:* ${encodeURIComponent(cakeType)}%0A`;
      if (date) text += `*Date Needed:* ${encodeURIComponent(date)}%0A`;
      if (message) text += `*Message / Requirements:* ${encodeURIComponent(message)}%0A`;
      text += `%0APlease let me know the price and confirmation. Thank you!`;

      // Official WhatsApp Number: 075 437 5356 -> International: 94754375356
      window.open(`https://wa.me/94754375356?text=${text}`, '_blank');
    });
  }

  // ============================================================
  // COMPACT WHATSAPP POPUP CHAT LOGIC
  // ============================================================
  const waPopup = document.getElementById('whatsappPopup');
  const waTriggerBtn = document.getElementById('waTriggerBtn');
  const waCloseBtn = document.getElementById('waCloseBtn');

  if (waPopup) {
    // Pop up automatically after 1.8 seconds
    const autoPopTimer = setTimeout(() => {
      waPopup.classList.add('open');
    }, 1800);

    // When floating button is clicked, dismiss popup and proceed to WhatsApp
    if (waTriggerBtn) {
      waTriggerBtn.addEventListener('click', () => {
        clearTimeout(autoPopTimer);
        waPopup.classList.remove('open');
      });
    }

    // Close on ✕ button click
    if (waCloseBtn) {
      waCloseBtn.addEventListener('click', (e) => {
        e.preventDefault();
        e.stopPropagation();
        clearTimeout(autoPopTimer);
        waPopup.classList.remove('open');
      });
    }

    // Close if clicked outside
    document.addEventListener('click', (e) => {
      if (!e.target.closest('#whatsappWidget')) {
        waPopup.classList.remove('open');
      }
    });
  }
});



