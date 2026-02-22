/**
 * Sticky Sidebar Table of Contents
 * Astra Child Theme — ays-toc.js
 *
 * - Auto-builds TOC from h2/h3 in .entry-content
 * - IntersectionObserver highlights the active section
 * - Smooth scrolls to anchors
 * - No jQuery dependency
 */
(function () {
  'use strict';

  document.addEventListener('DOMContentLoaded', function () {
    var tocContainer = document.getElementById('ays-toc');
    if (!tocContainer) return;

    var article = document.querySelector('.entry-content');
    if (!article) return;

    var headings = Array.from(article.querySelectorAll('h2, h3'));
    if (!headings.length) {
      // No headings — hide the TOC widget entirely
      var widget = tocContainer.closest('.widget') || tocContainer.parentElement;
      if (widget) widget.style.display = 'none';
      return;
    }

    /* ----------------------------------------------------------
       BUILD THE TOC LIST
    ---------------------------------------------------------- */
    var tocList = document.createElement('ul');
    tocList.className = 'ays-toc__list';
    tocList.setAttribute('role', 'list');

    headings.forEach(function (heading, index) {
      // Ensure each heading has a unique ID for anchor linking
      if (!heading.id) {
        var slug = heading.textContent
          .toLowerCase()
          .trim()
          .replace(/[^\w\s-]/g, '')   // strip special chars
          .replace(/[\s_-]+/g, '-')   // spaces → hyphens
          .replace(/^-+|-+$/g, '');   // trim leading/trailing hyphens

        heading.id = slug ? slug : 'section-' + index;
      }

      var li = document.createElement('li');
      li.className =
        'ays-toc__item ays-toc__item--' + heading.tagName.toLowerCase();

      var a = document.createElement('a');
      a.href      = '#' + heading.id;
      a.textContent = heading.textContent.replace(/^#+\s*/, ''); // strip any markdown #
      a.className = 'ays-toc__link';
      a.setAttribute('data-target', heading.id);

      li.appendChild(a);
      tocList.appendChild(li);
    });

    tocContainer.appendChild(tocList);

    /* ----------------------------------------------------------
       ACTIVE SECTION HIGHLIGHTING via IntersectionObserver
       rootMargin pushes the trigger point ~30% down from top,
       so the active link updates just before the section reaches
       mid-screen — feels natural during reading.
    ---------------------------------------------------------- */
    var activeLink = null;

    var observer = new IntersectionObserver(
      function (entries) {
        entries.forEach(function (entry) {
          if (!entry.isIntersecting) return;

          var targetId = entry.target.id;
          var newLink  = tocContainer.querySelector(
            '.ays-toc__link[data-target="' + targetId + '"]'
          );

          if (!newLink || newLink === activeLink) return;

          // Remove previous active state
          if (activeLink) {
            activeLink.classList.remove('ays-toc__link--active');
            activeLink.removeAttribute('aria-current');
          }

          // Set new active state
          newLink.classList.add('ays-toc__link--active');
          newLink.setAttribute('aria-current', 'location');
          activeLink = newLink;

          // Scroll the TOC itself so the active link is visible
          scrollTocToLink(newLink);
        });
      },
      {
        rootMargin: '-10% 0px -65% 0px',
        threshold:  0,
      }
    );

    headings.forEach(function (h) { observer.observe(h); });

    /* ----------------------------------------------------------
       SMOOTH SCROLL TO ANCHORS
    ---------------------------------------------------------- */
    tocContainer.addEventListener('click', function (e) {
      var link = e.target.closest('.ays-toc__link');
      if (!link) return;

      e.preventDefault();
      var targetId = link.getAttribute('data-target');
      var target   = document.getElementById(targetId);
      if (!target) return;

      // Offset for sticky Astra header
      var headerHeight = getHeaderHeight();
      var targetTop    = target.getBoundingClientRect().top + window.scrollY - headerHeight - 16;

      window.scrollTo({ top: targetTop, behavior: 'smooth' });

      // Update URL hash without jumping
      history.pushState(null, '', '#' + targetId);
    });

    /* ----------------------------------------------------------
       HELPERS
    ---------------------------------------------------------- */
    function getHeaderHeight() {
      var header = document.getElementById('masthead') || document.querySelector('.site-header');
      return header ? header.offsetHeight : 80;
    }

    function scrollTocToLink(link) {
      var linkTop       = link.offsetTop;
      var containerTop  = tocContainer.scrollTop;
      var containerH    = tocContainer.clientHeight;
      var linkH         = link.offsetHeight;

      var isAbove = linkTop < containerTop;
      var isBelow = linkTop + linkH > containerTop + containerH;

      if (isAbove || isBelow) {
        tocContainer.scrollTo({
          top:      linkTop - containerH / 2 + linkH / 2,
          behavior: 'smooth',
        });
      }
    }
  });
})();
