#!/bin/bash
# Generate subcategory pages for Everest & Hearth
cd /c/Users/youss/Desktop/wevsite

generate_page() {
  local DIR="$1"
  local SLUG="$2"
  local TITLE="$3"
  local ICON="$4"
  local PARENT_NAME="$5"
  local PARENT_FILE="$6"
  local PARENT_NAV="$7"
  local HERO_BG="$8"
  local IMG_CLASS="$9"
  local DESC="${10}"
  local P1_TITLE="${11}"
  local P1_EXCERPT="${12}"
  local P1_PRICE="${13}"
  local P1_ICON="${14}"
  local P2_TITLE="${15}"
  local P2_EXCERPT="${16}"
  local P2_PRICE="${17}"
  local P2_ICON="${18}"
  local P3_TITLE="${19}"
  local P3_EXCERPT="${20}"
  local P3_PRICE="${21}"
  local P3_ICON="${22}"
  local TIP1_TITLE="${23}"
  local TIP1_TEXT="${24}"
  local TIP2_TITLE="${25}"
  local TIP2_TEXT="${26}"

  local FILEPATH="${DIR}/${SLUG}.html"
  local NAV_ACTIVE=""
  case "$PARENT_NAV" in
    kitchen) NAV_ACTIVE='kitchen' ;;
    home) NAV_ACTIVE='home' ;;
    garden) NAV_ACTIVE='garden' ;;
    pets) NAV_ACTIVE='pets' ;;
  esac

  cat > "$FILEPATH" << 'HEADEREOF'
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
HEADEREOF

  cat >> "$FILEPATH" << EOF
  <title>${TITLE} — Everest &amp; Hearth</title>
  <meta name="description" content="${DESC}" />
  <link rel="canonical" href="https://everest-hearth.com/${DIR}/${SLUG}/" />
  <meta property="og:type" content="website" />
  <meta property="og:title" content="${TITLE} — Everest &amp; Hearth" />
  <meta property="og:description" content="${DESC}" />
  <meta property="og:site_name" content="Everest &amp; Hearth" />
  <meta name="twitter:card" content="summary_large_image" />
  <script type="application/ld+json">
  {
    "@context": "https://schema.org",
    "@type": "CollectionPage",
    "name": "${TITLE}",
    "description": "${DESC}",
    "url": "https://everest-hearth.com/${DIR}/${SLUG}/",
    "isPartOf": { "@type": "WebSite", "name": "Everest &amp; Hearth", "url": "https://everest-hearth.com" }
  }
  </script>
EOF

  cat >> "$FILEPATH" << 'HEADEOF'
  <script>if(localStorage.getItem('theme')==='dark')document.documentElement.setAttribute('data-theme','dark');</script>
  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Montserrat:wght@600;700;800&display=swap" rel="stylesheet" />
  <link rel="stylesheet" href="../style.css" />
</head>
<body>
  <a href="#main-content" class="skip-link">Skip to main content</a>
  <header class="site-header" role="banner">
    <div class="header-inner">
      <a href="../index.html" class="logo" aria-label="Everest &amp; Hearth — Home">
        <div class="logo-icon" aria-hidden="true">🏡</div>
        <div class="logo-text">Everest <span>&amp;</span> Hearth</div>
      </a>
      <button class="menu-toggle" aria-expanded="false" aria-controls="main-nav" aria-label="Toggle navigation menu">
        <span class="bar" aria-hidden="true"></span>
      </button>
      <nav class="main-nav" id="main-nav" role="navigation" aria-label="Main navigation">
HEADEOF

  # Nav links - set active based on parent
  if [ "$NAV_ACTIVE" = "kitchen" ]; then
    echo '        <div class="nav-item"><a href="../kitchen.html" class="nav-link active">Kitchen <span class="nav-link__arrow" aria-hidden="true">▼</span></a>' >> "$FILEPATH"
  else
    echo '        <div class="nav-item"><a href="../kitchen.html" class="nav-link">Kitchen <span class="nav-link__arrow" aria-hidden="true">▼</span></a>' >> "$FILEPATH"
  fi

  cat >> "$FILEPATH" << 'KITDROPEOF'
          <div class="mega-dropdown" aria-label="Kitchen subcategories">
            <ul class="mega-dropdown__list">
              <li><a href="../kitchen/food-prep-gadgets.html" class="mega-dropdown__link"><span class="mega-dropdown__badge">Popular</span> Food Prep Gadgets</a></li>
              <li><a href="../kitchen/kitchen-scales-measuring-tools.html" class="mega-dropdown__link">Kitchen Scales &amp; Measuring Tools</a></li>
              <li><a href="../kitchen/storage-meal-prep-containers.html" class="mega-dropdown__link">Storage &amp; Meal Prep Containers</a></li>
              <li><a href="../kitchen/cookware-bakeware-essentials.html" class="mega-dropdown__link"><span class="mega-dropdown__badge">Popular</span> Cookware &amp; Bakeware Essentials</a></li>
              <li><a href="../kitchen/coffee-drink-tools.html" class="mega-dropdown__link">Coffee &amp; Drink Tools</a></li>
              <li><a href="../kitchen/cutting-boards-knife-accessories.html" class="mega-dropdown__link">Cutting Boards &amp; Knife Accessories</a></li>
              <li><a href="../kitchen/air-fryer-small-appliance-accessories.html" class="mega-dropdown__link">Air Fryer &amp; Small Appliance Accessories</a></li>
              <li><a href="../kitchen/kitchen-organization-tools.html" class="mega-dropdown__link">Kitchen Organization Tools</a></li>
            </ul>
            <a href="../kitchen.html" class="mega-dropdown__cta">All Kitchen Guides →</a>
          </div>
        </div>
KITDROPEOF

  if [ "$NAV_ACTIVE" = "home" ]; then
    echo '        <div class="nav-item"><a href="../home-outdoor.html" class="nav-link active">Home &amp; Outdoor <span class="nav-link__arrow" aria-hidden="true">▼</span></a>' >> "$FILEPATH"
  else
    echo '        <div class="nav-item"><a href="../home-outdoor.html" class="nav-link">Home &amp; Outdoor <span class="nav-link__arrow" aria-hidden="true">▼</span></a>' >> "$FILEPATH"
  fi

  cat >> "$FILEPATH" << 'HOMEDROPEOF'
          <div class="mega-dropdown mega-dropdown--wide" aria-label="Home and Outdoor subcategories">
            <div class="mega-dropdown__columns">
              <div>
                <p class="mega-dropdown__group-label">🏠 Home</p>
                <ul class="mega-dropdown__list">
                  <li><a href="../home-outdoor/cleaning-tools-gadgets.html" class="mega-dropdown__link"><span class="mega-dropdown__badge">Popular</span> Cleaning Tools &amp; Gadgets</a></li>
                  <li><a href="../home-outdoor/storage-organization.html" class="mega-dropdown__link">Storage &amp; Organization</a></li>
                  <li><a href="../home-outdoor/laundry-tools.html" class="mega-dropdown__link">Laundry Tools</a></li>
                  <li><a href="../home-outdoor/home-safety-maintenance-gadgets.html" class="mega-dropdown__link">Home Safety &amp; Maintenance</a></li>
                  <li><a href="../home-outdoor/bedroom-comfort-essentials.html" class="mega-dropdown__link">Bedroom Comfort Essentials</a></li>
                </ul>
              </div>
              <div>
                <p class="mega-dropdown__group-label">🌳 Outdoor</p>
                <ul class="mega-dropdown__list">
                  <li><a href="../home-outdoor/patio-cleaning-maintenance-tools.html" class="mega-dropdown__link">Patio Cleaning &amp; Maintenance</a></li>
                  <li><a href="../home-outdoor/outdoor-lighting-solar-gadgets.html" class="mega-dropdown__link"><span class="mega-dropdown__badge">Popular</span> Outdoor Lighting &amp; Solar</a></li>
                  <li><a href="../home-outdoor/outdoor-storage-utility.html" class="mega-dropdown__link">Outdoor Storage &amp; Utility</a></li>
                  <li><a href="../home-outdoor/camping-backyard-utility-tools.html" class="mega-dropdown__link">Camping / Backyard Utility</a></li>
                  <li><a href="../home-outdoor/seasonal-outdoor-essentials.html" class="mega-dropdown__link">Seasonal Outdoor Essentials</a></li>
                </ul>
              </div>
            </div>
            <a href="../home-outdoor.html" class="mega-dropdown__cta">All Home &amp; Outdoor Guides →</a>
          </div>
        </div>
HOMEDROPEOF

  if [ "$NAV_ACTIVE" = "garden" ]; then
    echo '        <div class="nav-item"><a href="../gardening.html" class="nav-link active">Gardening <span class="nav-link__arrow" aria-hidden="true">▼</span></a>' >> "$FILEPATH"
  else
    echo '        <div class="nav-item"><a href="../gardening.html" class="nav-link">Gardening <span class="nav-link__arrow" aria-hidden="true">▼</span></a>' >> "$FILEPATH"
  fi

  cat >> "$FILEPATH" << 'GARDDROPEOF'
          <div class="mega-dropdown" aria-label="Gardening subcategories">
            <ul class="mega-dropdown__list">
              <li><a href="../gardening/hand-tools-for-beginners.html" class="mega-dropdown__link"><span class="mega-dropdown__badge">Popular</span> Hand Tools for Beginners</a></li>
              <li><a href="../gardening/watering-tools-irrigation.html" class="mega-dropdown__link">Watering Tools &amp; Irrigation</a></li>
              <li><a href="../gardening/pruning-cutting-tools.html" class="mega-dropdown__link">Pruning &amp; Cutting Tools</a></li>
              <li><a href="../gardening/weeding-tools.html" class="mega-dropdown__link">Weeding Tools</a></li>
              <li><a href="../gardening/raised-bed-soil-tools.html" class="mega-dropdown__link"><span class="mega-dropdown__badge">Popular</span> Raised Bed &amp; Soil Tools</a></li>
              <li><a href="../gardening/plant-support-training.html" class="mega-dropdown__link">Plant Support &amp; Training</a></li>
              <li><a href="../gardening/seed-starting-indoor-grow.html" class="mega-dropdown__link">Seed Starting &amp; Indoor Grow</a></li>
              <li><a href="../gardening/garden-storage-tool-organization.html" class="mega-dropdown__link">Garden Storage &amp; Organization</a></li>
              <li><a href="../gardening/pest-plant-protection.html" class="mega-dropdown__link">Pest &amp; Plant Protection</a></li>
              <li><a href="../gardening/balcony-small-space-gardening.html" class="mega-dropdown__link">Balcony / Small-Space Gardening</a></li>
            </ul>
            <a href="../gardening.html" class="mega-dropdown__cta">All Garden Guides →</a>
          </div>
        </div>
GARDDROPEOF

  if [ "$NAV_ACTIVE" = "pets" ]; then
    echo '        <div class="nav-item"><a href="../pets.html" class="nav-link active">Pets <span class="nav-link__arrow" aria-hidden="true">▼</span></a>' >> "$FILEPATH"
  else
    echo '        <div class="nav-item"><a href="../pets.html" class="nav-link">Pets <span class="nav-link__arrow" aria-hidden="true">▼</span></a>' >> "$FILEPATH"
  fi

  cat >> "$FILEPATH" << 'PETSDROPEOF'
          <div class="mega-dropdown" aria-label="Pet subcategories">
            <ul class="mega-dropdown__list">
              <li><a href="../pets/dog-feeding-watering.html" class="mega-dropdown__link"><span class="mega-dropdown__badge">Popular</span> Dog Feeding &amp; Watering</a></li>
              <li><a href="../pets/dog-grooming-tools.html" class="mega-dropdown__link">Dog Grooming Tools</a></li>
              <li><a href="../pets/dog-walking-gear.html" class="mega-dropdown__link">Dog Walking Gear</a></li>
              <li><a href="../pets/pet-cleaning-odor-control.html" class="mega-dropdown__link">Pet Cleaning &amp; Odor Control</a></li>
              <li><a href="../pets/cat-litter-litter-box-accessories.html" class="mega-dropdown__link"><span class="mega-dropdown__badge">Popular</span> Cat Litter &amp; Litter Box</a></li>
              <li><a href="../pets/cat-enrichment-toys.html" class="mega-dropdown__link">Cat Enrichment &amp; Toys</a></li>
              <li><a href="../pets/pet-beds-comfort.html" class="mega-dropdown__link">Pet Beds &amp; Comfort</a></li>
              <li><a href="../pets/travel-car-accessories.html" class="mega-dropdown__link">Travel &amp; Car Accessories</a></li>
              <li><a href="../pets/pet-training-aids.html" class="mega-dropdown__link">Pet Training Aids</a></li>
              <li><a href="../pets/smart-pet-gadgets.html" class="mega-dropdown__link">Smart Pet Gadgets</a></li>
            </ul>
            <a href="../pets.html" class="mega-dropdown__cta">All Pet Guides →</a>
          </div>
        </div>
PETSDROPEOF

  cat >> "$FILEPATH" << 'NAVEND'
        <a href="../index.html#section-article" class="nav-link">Reviews</a>
      </nav>
      <div class="header-utils">
        <div class="search-bar" role="search">
          <label for="site-search" class="search-icon" aria-hidden="true">🔍</label>
          <input type="search" id="site-search" placeholder="Search reviews…" aria-label="Search reviews" />
        </div>
        <a href="../index.html#section-comparison" class="header-cta">Best Picks</a>
      </div>
      <button class="darkmode-toggle" id="darkmode-btn" aria-label="Toggle dark mode">
        <span class="dm-icon-moon" aria-hidden="true">🌙</span>
        <span class="dm-icon-sun" aria-hidden="true">☀️</span>
      </button>
    </div>
  </header>

  <main id="main-content">
NAVEND

  # Breadcrumb + Hero + Content
  cat >> "$FILEPATH" << EOF
    <!-- Breadcrumb -->
    <nav class="breadcrumb" aria-label="Breadcrumb" style="padding:1rem 0;background:#fff;border-bottom:1px solid var(--gray-200);">
      <div class="container" style="font-size:.8125rem;color:var(--gray-600);">
        <a href="../index.html" style="color:var(--teal);">Home</a> <span style="margin:0 .375rem;">›</span>
        <a href="../${PARENT_FILE}" style="color:var(--teal);">${PARENT_NAME}</a> <span style="margin:0 .375rem;">›</span>
        <span style="color:var(--text);font-weight:600;">${TITLE}</span>
      </div>
    </nav>

    <!-- Hero -->
    <section class="category-hero" style="background:${HERO_BG};padding:3rem 0;">
      <div class="container" style="text-align:center;">
        <div style="font-size:3rem;margin-bottom:1rem;">${ICON}</div>
        <h1 class="section-title" style="margin-bottom:.5rem;">${TITLE}</h1>
        <p class="section-sub">${DESC}</p>
      </div>
    </section>

    <!-- Products -->
    <section class="category-section" style="padding-top:2.5rem;padding-bottom:2.5rem;">
      <div class="container">
        <div class="category-section__header">
          <div>
            <p class="section-eyebrow">${PARENT_NAME}</p>
            <h2 class="section-title">Best ${TITLE} of 2025</h2>
            <p class="section-sub">Our top-rated picks, tested and reviewed by the Everest &amp; Hearth team.</p>
          </div>
        </div>
        <div class="category-grid" style="grid-template-columns:repeat(auto-fill,minmax(280px,1fr));">
          <div class="cat-card">
            <div class="cat-card__img ${IMG_CLASS}"><span class="cat-card__tag cat-card__tag--top">Top Pick</span>${P1_ICON}</div>
            <div class="cat-card__body">
              <p class="cat-card__category">${TITLE}</p>
              <h3 class="cat-card__title">${P1_TITLE}</h3>
              <div class="cat-card__rating"><span class="stars">★★★★★</span><span class="rating-val">4.9</span></div>
              <p class="cat-card__price-hint">${P1_PRICE}</p>
              <p class="cat-card__excerpt">${P1_EXCERPT}</p>
              <a href="#" class="cat-card__link">Read Full Review →</a>
            </div>
          </div>
          <div class="cat-card">
            <div class="cat-card__img ${IMG_CLASS}"><span class="cat-card__tag cat-card__tag--new">New</span>${P2_ICON}</div>
            <div class="cat-card__body">
              <p class="cat-card__category">${TITLE}</p>
              <h3 class="cat-card__title">${P2_TITLE}</h3>
              <div class="cat-card__rating"><span class="stars">★★★★★</span><span class="rating-val">4.7</span></div>
              <p class="cat-card__price-hint">${P2_PRICE}</p>
              <p class="cat-card__excerpt">${P2_EXCERPT}</p>
              <a href="#" class="cat-card__link">Read Full Review →</a>
            </div>
          </div>
          <div class="cat-card">
            <div class="cat-card__img ${IMG_CLASS}"><span class="cat-card__tag cat-card__tag--pick">Editor's Pick</span>${P3_ICON}</div>
            <div class="cat-card__body">
              <p class="cat-card__category">${TITLE}</p>
              <h3 class="cat-card__title">${P3_TITLE}</h3>
              <div class="cat-card__rating"><span class="stars">★★★★☆</span><span class="rating-val">4.6</span></div>
              <p class="cat-card__price-hint">${P3_PRICE}</p>
              <p class="cat-card__excerpt">${P3_EXCERPT}</p>
              <a href="#" class="cat-card__link">Read Full Review →</a>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Tips -->
    <section class="section" style="padding:3rem 0;">
      <div class="container">
        <p class="section-eyebrow">Buying Advice</p>
        <h2 class="section-title">${TITLE} Buying Guide</h2>
        <div class="tips-grid">
          <div class="tip-card">
            <h3>${TIP1_TITLE}</h3>
            <p>${TIP1_TEXT}</p>
          </div>
          <div class="tip-card">
            <h3>${TIP2_TITLE}</h3>
            <p>${TIP2_TEXT}</p>
          </div>
        </div>
      </div>
    </section>
  </main>
EOF

  # Footer + Scripts (static)
  cat >> "$FILEPATH" << 'FOOTEREOF'
  <section class="trust-bar" aria-label="Our promises">
    <div class="trust-grid">
      <div><div class="trust-icon" aria-hidden="true">✓</div><div class="trust-title">Hands-On Tested</div><div class="trust-sub">Every pick tested in real homes — not a lab</div></div>
      <div><div class="trust-icon" aria-hidden="true">✓</div><div class="trust-title">No Paid Placements</div><div class="trust-sub">Rankings based on performance only</div></div>
      <div><div class="trust-icon" aria-hidden="true">✓</div><div class="trust-title">Updated Monthly</div><div class="trust-sub">Reviews refreshed when new models launch</div></div>
      <div><div class="trust-icon" aria-hidden="true">✓</div><div class="trust-title">FTC Compliant</div><div class="trust-sub">Affiliate relationships always disclosed</div></div>
    </div>
  </section>
  <footer class="site-footer" role="contentinfo">
    <div class="footer-inner">
      <div>
        <div class="footer-brand-name">Everest <span>&amp;</span> Hearth</div>
        <p class="footer-tagline">Honest, hands-on reviews for the products that matter in your home, garden, and beyond. Buy it once. Use it forever.</p>
        <div class="footer-social"><a href="#" class="social-btn" aria-label="Facebook">f</a><a href="#" class="social-btn" aria-label="X (Twitter)">𝕏</a><a href="#" class="social-btn" aria-label="LinkedIn">in</a><a href="#" class="social-btn" aria-label="YouTube">▶</a></div>
      </div>
      <div>
        <p class="footer-col-title">Categories</p>
        <ul class="footer-links">
          <li><a href="../kitchen.html">Kitchen</a></li>
          <li><a href="../home-outdoor.html">Home &amp; Outdoor</a></li>
          <li><a href="../gardening.html">Gardening</a></li>
          <li><a href="../pets.html">Pets</a></li>
        </ul>
      </div>
      <div>
        <p class="footer-col-title">Reviews</p>
        <ul class="footer-links"><li><a href="#">Best Picks 2025</a></li><li><a href="#">Editor's Choice</a></li><li><a href="#">Budget Finds</a></li><li><a href="#">New Arrivals</a></li></ul>
      </div>
      <div>
        <p class="footer-col-title">Company</p>
        <ul class="footer-links"><li><a href="#">About Us</a></li><li><a href="#">How We Test</a></li><li><a href="#">Affiliate Disclosure</a></li><li><a href="#">Contact</a></li></ul>
      </div>
    </div>
    <div class="footer-bottom">
      <p>&copy; 2025 Everest &amp; Hearth. All rights reserved.</p>
      <p><a href="#">Privacy Policy</a> · <a href="#">Terms</a> · <a href="#">Affiliate Disclosure</a></p>
    </div>
  </footer>
  <script>
    (function(){
      'use strict';
      var dmBtn=document.getElementById('darkmode-btn');
      if(dmBtn){dmBtn.addEventListener('click',function(){var d=document.documentElement.getAttribute('data-theme')==='dark';if(d){document.documentElement.removeAttribute('data-theme');localStorage.setItem('theme','light');}else{document.documentElement.setAttribute('data-theme','dark');localStorage.setItem('theme','dark');}});}
      var menuBtn=document.querySelector('.menu-toggle'),nav=document.getElementById('main-nav');
      if(menuBtn&&nav){menuBtn.addEventListener('click',function(){var o=nav.classList.toggle('is-open');menuBtn.setAttribute('aria-expanded',o);document.body.classList.toggle('nav-open',o);});document.addEventListener('keydown',function(e){if(e.key==='Escape'&&nav.classList.contains('is-open')){nav.classList.remove('is-open');menuBtn.setAttribute('aria-expanded','false');document.body.classList.remove('nav-open');menuBtn.focus();}});}
      var navItems=document.querySelectorAll('.nav-item'),isDesktop=window.matchMedia('(min-width:1024px)'),allNavLinks=nav?nav.querySelectorAll('.nav-link'):[];
      function setActiveNav(a){allNavLinks.forEach(function(l){l.classList.remove('active');});a.classList.add('active');}
      navItems.forEach(function(item){var link=item.querySelector('.nav-link'),dd=item.querySelector('.mega-dropdown');if(!link||!dd)return;link.addEventListener('click',function(e){setActiveNav(link);if(!isDesktop.matches){e.preventDefault();var w=dd.classList.contains('is-open');navItems.forEach(function(o){var d=o.querySelector('.mega-dropdown');if(d)d.classList.remove('is-open');});if(!w)dd.classList.add('is-open');}});});
      allNavLinks.forEach(function(link){if(link.closest('.nav-item'))return;link.addEventListener('click',function(){setActiveNav(link);});});
      if(nav){nav.addEventListener('click',function(e){if(e.target.closest('.mega-dropdown__link')||e.target.closest('.mega-dropdown__cta')){navItems.forEach(function(i){var d=i.querySelector('.mega-dropdown');if(d)d.classList.remove('is-open');});nav.classList.remove('is-open');if(menuBtn)menuBtn.setAttribute('aria-expanded','false');document.body.classList.remove('nav-open');}});}
    })();
  </script>
</body>
</html>
FOOTEREOF

  echo "  Created: $FILEPATH"
}

echo "=== Generating Kitchen subcategory pages ==="

generate_page "kitchen" "food-prep-gadgets" "Food Prep Gadgets" "🥄" "Kitchen" "kitchen.html" "kitchen" "linear-gradient(135deg,#fff4e6 0%,#ffe8cc 100%)" "cat-card__img--kitchen" "The best food prep gadgets tested in real kitchens. Mandolines, peelers, choppers, and prep tools that save time without sacrificing quality." \
  "Best Mandoline Slicers for Safe, Even Cuts" "We tested 8 mandolines on potatoes, onions, and zucchini. The winner cut prep time by 70% with zero nicks." "\$25–\$80" "🥕" \
  "5 Best Vegetable Choppers That Actually Work" "Dice, julienne, and spiral — which choppers handle hard vegetables without jamming?" "\$15–\$45" "🧅" \
  "Electric vs. Manual Food Processors Compared" "KitchenAid, Cuisinart, and Ninja tested on salsa, dough, and nut butter." "\$30–\$200" "⚡" \
  "🔪 What to Look For" "A good mandoline needs a sharp blade, stable feet, and a hand guard that actually works. Avoid cheap plastic — stainless steel blades stay sharp 5x longer." \
  "💡 Pro Tip" "Most prep gadgets are dishwasher-safe on the top rack. Always check — hand-washing dulls blades faster than you think."

generate_page "kitchen" "kitchen-scales-measuring-tools" "Kitchen Scales & Measuring Tools" "⚖️" "Kitchen" "kitchen.html" "kitchen" "linear-gradient(135deg,#fff4e6 0%,#ffe8cc 100%)" "cat-card__img--kitchen" "Precision kitchen scales and measuring tools reviewed. Digital scales, measuring cups, and thermometers tested for accuracy and durability." \
  "7 Best Digital Kitchen Scales Under \$50" "Accuracy to 0.1g, tare function, and battery life tested across 200 weigh-ins." "\$12–\$50" "⚖️" \
  "Best Measuring Cup Sets: Glass vs. Stainless" "OXO, Pyrex, and stainless sets tested for accuracy, readability, and durability." "\$10–\$35" "🥛" \
  "5 Best Instant-Read Thermometers for Cooking" "ThermoWorks, MEATER, and budget picks tested on steaks, bread, and candy." "\$15–\$100" "🌡️" \
  "⚖️ Accuracy Matters" "For baking, a scale accurate to 1g is essential. For coffee, you need 0.1g precision. Check the spec sheet — not all digital scales are equal." \
  "🔋 Battery Life" "Look for scales with auto-off to save battery. USB-rechargeable models eliminate the AA battery hassle entirely."

generate_page "kitchen" "storage-meal-prep-containers" "Storage & Meal Prep Containers" "📦" "Kitchen" "kitchen.html" "kitchen" "linear-gradient(135deg,#fff4e6 0%,#ffe8cc 100%)" "cat-card__img--kitchen" "Best meal prep containers and food storage solutions reviewed. Glass, stainless, and plastic containers tested for leak-proofness and durability." \
  "Best Glass Meal Prep Containers (Oven-Safe)" "Pyrex, Rubbermaid, and Prep Naturals tested for leak-proof lids and microwave safety." "\$20–\$45" "🥗" \
  "5 Best Vacuum Seal Systems for Food Storage" "FoodSaver vs. budget sealers — which ones actually extend food freshness?" "\$30–\$150" "🫙" \
  "Stainless Steel vs. Glass: Which Lasts Longer?" "6-month durability test with daily dishwasher cycles, drops, and stain resistance." "\$15–\$60" "🍱" \
  "🔒 Leak-Proof Matters Most" "The #1 complaint with containers is leaking. Look for snap-lock lids with silicone gaskets — they survive being tossed in a bag." \
  "♻️ Sustainability Tip" "Glass containers last 10+ years vs. 1-2 for plastic. The upfront cost pays for itself in replacements avoided."

generate_page "kitchen" "cookware-bakeware-essentials" "Cookware & Bakeware Essentials" "🍳" "Kitchen" "kitchen.html" "kitchen" "linear-gradient(135deg,#fff4e6 0%,#ffe8cc 100%)" "cat-card__img--kitchen" "Expert cookware and bakeware reviews. Cast iron, stainless steel, and non-stick pans tested through hundreds of meals." \
  "Cast Iron vs. Stainless vs. Non-Stick Showdown" "Lodge, All-Clad, and T-fal tested on searing, eggs, and deglazing over 60 days." "\$25–\$300" "🍳" \
  "5 Best Baking Sheet Sets That Won't Warp" "Nordic Ware, USA Pan, and budget picks tested at 450°F through 100 bakes." "\$15–\$50" "🍪" \
  "Dutch Ovens: Le Creuset vs. Lodge vs. Staub" "Bread, stew, and braising tested. Is the \$350 pot really 5x better than \$60?" "\$60–\$400" "🫕" \
  "🔥 Heat Distribution" "Tri-ply stainless (aluminum core) heats most evenly. Cast iron retains heat longest. Non-stick is convenience — not performance." \
  "🧽 Care Basics" "Never put cast iron in the dishwasher. Season after every use. Stainless handles Bar Keeper's Friend. Non-stick dies after 2-3 years regardless of price."

generate_page "kitchen" "coffee-drink-tools" "Coffee & Drink Tools" "☕" "Kitchen" "kitchen.html" "kitchen" "linear-gradient(135deg,#fff4e6 0%,#ffe8cc 100%)" "cat-card__img--kitchen" "Best coffee makers, grinders, and drink tools reviewed. Pour-over, French press, and espresso gear tested by actual coffee enthusiasts." \
  "Best Coffee Grinders: Burr vs. Blade Compared" "Baratza, Fellow, and JavaPresse tested on espresso, pour-over, and French press grind." "\$30–\$250" "⚙️" \
  "5 Best Pour-Over Coffee Makers for Beginners" "Chemex, Hario V60, and Kalita Wave compared for flavor, ease, and cleanup." "\$20–\$80" "☕" \
  "Electric Kettles With Temperature Control" "Fellow Stagg, Bonavita, and budget gooseneck kettles tested for pour accuracy." "\$30–\$170" "🫖" \
  "☕ Grind Size Matters" "Espresso needs fine, pour-over needs medium, French press needs coarse. A burr grinder gives consistent results — blade grinders create uneven particles." \
  "💧 Water Temperature" "195-205°F is the sweet spot for coffee extraction. Too hot = bitter, too cold = sour. A temperature-controlled kettle removes the guesswork."

generate_page "kitchen" "cutting-boards-knife-accessories" "Cutting Boards & Knife Accessories" "🔪" "Kitchen" "kitchen.html" "kitchen" "linear-gradient(135deg,#fff4e6 0%,#ffe8cc 100%)" "cat-card__img--kitchen" "Best cutting boards, knife sharpeners, and blade accessories reviewed. Wood, plastic, and composite boards tested for hygiene and durability." \
  "Best Wood Cutting Boards That Last a Decade" "End-grain walnut, edge-grain maple, and teak boards tested through 1,000 cuts." "\$30–\$150" "🪵" \
  "Electric vs. Manual Knife Sharpeners Compared" "Work Sharp, Chef's Choice, and whetstones tested on dull chef's knives." "\$15–\$130" "🔧" \
  "Magnetic Knife Strips vs. Knife Blocks" "Wall-mounted strips save counter space but are they safe? 6-month test." "\$15–\$60" "🧲" \
  "🪵 Wood vs. Plastic" "Wood boards are self-healing and gentler on blades. Plastic is dishwasher-safe but scores deeply. Replace plastic boards when grooves appear." \
  "🔪 Sharpening Schedule" "Home cooks should sharpen every 2-3 months and hone (steel rod) before every use. A sharp knife is safer than a dull one."

generate_page "kitchen" "air-fryer-small-appliance-accessories" "Air Fryer & Small Appliances" "🍗" "Kitchen" "kitchen.html" "kitchen" "linear-gradient(135deg,#fff4e6 0%,#ffe8cc 100%)" "cat-card__img--kitchen" "Best air fryer accessories and small kitchen appliances reviewed. Racks, liners, and companion tools tested for fit and performance." \
  "Best Air Fryer Accessories That Actually Fit" "Silicone liners, racks, and skewer sets tested across Ninja, Cosori, and Philips models." "\$10–\$35" "🧺" \
  "5 Must-Have Small Appliances Under \$100" "Immersion blender, rice cooker, electric griddle — which earn counter space?" "\$25–\$100" "🔌" \
  "Air Fryer Parchment vs. Silicone Liners" "100 uses each — which prevents sticking, cleans easier, and lasts longer?" "\$5–\$20" "📄" \
  "📐 Size Matters" "Measure your air fryer basket before buying accessories. A 5.8qt Cosori and a 6qt Ninja have different basket shapes — universal doesn't always mean universal." \
  "🧹 Easy Cleanup" "Silicone liners beat parchment for reusability (200+ uses vs. single-use). They also prevent basket coating from wearing off."

generate_page "kitchen" "kitchen-organization-tools" "Kitchen Organization Tools" "🗄️" "Kitchen" "kitchen.html" "kitchen" "linear-gradient(135deg,#fff4e6 0%,#ffe8cc 100%)" "cat-card__img--kitchen" "Best kitchen organization tools and storage solutions. Drawer organizers, shelf risers, and pantry systems tested for real kitchen spaces." \
  "Best Drawer Organizers for Messy Kitchens" "Bamboo, expandable, and modular systems tested in standard 15-inch and 18-inch drawers." "\$15–\$45" "📐" \
  "5 Best Pantry Organization Systems" "Clear containers, lazy susans, and shelf risers compared for space savings." "\$20–\$80" "🫙" \
  "Under-Sink Organizers That Maximize Dead Space" "Pull-out trays, stackable bins, and tension rods tested in 3 different cabinet sizes." "\$15–\$50" "🚰" \
  "📏 Measure First" "The #1 mistake is buying organizers before measuring your space. Measure drawer depth, width, and height — then shop. Returns on organizers are a hassle." \
  "🔄 The Container Rule" "Use clear containers for dry goods so you can see levels at a glance. Label everything. A labeled pantry saves 10+ minutes per grocery trip."

echo ""
echo "=== Generating Home & Outdoor subcategory pages ==="

generate_page "home-outdoor" "cleaning-tools-gadgets" "Cleaning Tools & Gadgets" "🧹" "Home & Outdoor" "home-outdoor.html" "home" "linear-gradient(135deg,#e8f4fd 0%,#d0e9fa 100%)" "cat-card__img--home" "Best cleaning tools and gadgets for your home. Mops, vacuums, and steam cleaners tested on every surface type." \
  "Best Spin Mops vs. Spray Mops Compared" "O-Cedar, Swiffer, and Bona tested on tile, hardwood, and laminate for 30 days." "\$25–\$60" "🧹" \
  "5 Best Handheld Steam Cleaners" "Bissell, PurSteam, and budget picks tested on grout, ovens, and upholstery." "\$30–\$80" "💨" \
  "Robot Mops: Are They Worth It in 2025?" "iRobot Braava, Roborock S8, and Narwal tested on real kitchen floors." "\$200–\$500" "🤖" \
  "🧪 Surface Matching" "Not all cleaners work on all surfaces. Vinegar damages marble, bleach yellows grout. Match your cleaner to your floor type." \
  "⏱️ Time Savings" "A robot mop running daily keeps floors cleaner than weekly manual mopping. Set it and forget it — your baseboards will thank you."

generate_page "home-outdoor" "storage-organization" "Storage & Organization" "📦" "Home & Outdoor" "home-outdoor.html" "home" "linear-gradient(135deg,#e8f4fd 0%,#d0e9fa 100%)" "cat-card__img--home" "Best home storage and organization solutions reviewed. Closet systems, bins, and shelving units tested for durability and space efficiency." \
  "Best Closet Organization Systems Under \$200" "ClosetMaid, Elfa, and IKEA PAX compared for customization and build quality." "\$50–\$200" "👔" \
  "5 Best Storage Bins for Every Room" "Sterilite, IRIS, and fabric bins tested for stackability, lids, and durability." "\$10–\$40" "📦" \
  "Garage Storage: Wall-Mount vs. Freestanding" "Gladiator, Husky, and budget options tested for weight capacity and installation." "\$40–\$250" "🏠" \
  "📐 Vertical Space" "Most people organize horizontally and waste vertical space. Tall shelving units and over-door organizers can double your storage capacity." \
  "🏷️ Label Everything" "A labeled bin is found in 5 seconds. An unlabeled bin takes 5 minutes. Invest in a label maker — it pays for itself immediately."

generate_page "home-outdoor" "laundry-tools" "Laundry Tools" "👕" "Home & Outdoor" "home-outdoor.html" "home" "linear-gradient(135deg,#e8f4fd 0%,#d0e9fa 100%)" "cat-card__img--home" "Best laundry tools and accessories reviewed. Steamers, drying racks, and stain removers tested for real-world laundry performance." \
  "Best Clothes Steamers vs. Traditional Irons" "Conair, PurSteam, and Rowenta tested on dress shirts, suits, and delicates." "\$25–\$100" "♨️" \
  "5 Best Drying Racks for Small Spaces" "Wall-mounted, foldable, and ceiling-hung racks tested in apartments under 800 sq ft." "\$20–\$60" "🧺" \
  "Laundry Stain Removers That Actually Work" "OxiClean, Zout, and DIY solutions tested on wine, grease, grass, and blood stains." "\$5–\$15" "✨" \
  "🧴 Less Is More" "Most people use 2-3x too much detergent. Excess soap traps dirt in fabric. Follow the line on the cap — your clothes will actually be cleaner." \
  "🌡️ Cold Water Wins" "Cold water cleans just as well as hot for most loads and saves \$100+/year in energy. Reserve hot water for towels, sheets, and heavily soiled items."

generate_page "home-outdoor" "home-safety-maintenance-gadgets" "Home Safety & Maintenance" "🔧" "Home & Outdoor" "home-outdoor.html" "home" "linear-gradient(135deg,#e8f4fd 0%,#d0e9fa 100%)" "cat-card__img--home" "Best home safety and maintenance gadgets reviewed. Smoke detectors, tool kits, and leak sensors tested for reliability." \
  "Best Smart Smoke Detectors in 2025" "Nest Protect, First Alert, and Kidde tested for response time and false alarm rates." "\$30–\$130" "🚨" \
  "5 Best Home Tool Kits for Beginners" "Stanley, DeWalt, and Amazon Basics sets compared for quality and completeness." "\$25–\$100" "🧰" \
  "Smart Water Leak Sensors That Save Thousands" "Govee, Ring, and Flo tested for detection speed and app reliability." "\$15–\$200" "💧" \
  "🔔 Test Monthly" "Press the test button on your smoke detectors every month. Replace batteries yearly. Replace the entire unit every 10 years — even if it still beeps." \
  "🔧 DIY vs. Pro" "Change filters, fix leaky faucets, and patch drywall yourself. Call a pro for electrical, gas, and structural work. Know your limits."

generate_page "home-outdoor" "bedroom-comfort-essentials" "Bedroom Comfort Essentials" "🛏️" "Home & Outdoor" "home-outdoor.html" "home" "linear-gradient(135deg,#e8f4fd 0%,#d0e9fa 100%)" "cat-card__img--home" "Best bedroom comfort essentials reviewed. Pillows, mattress toppers, and blackout curtains tested for better sleep quality." \
  "Best Pillows for Every Sleep Position" "Coop, Purple, and Beckham tested by side, back, and stomach sleepers for 30 nights." "\$20–\$80" "🛏️" \
  "Memory Foam vs. Down Mattress Toppers" "Tempur-Pedic, Sleep Innovations, and featherbed toppers compared for comfort and cooling." "\$50–\$200" "☁️" \
  "5 Best Blackout Curtains That Block 99% Light" "Nicetown, BGMENT, and thermal curtains tested for light blocking and insulation." "\$20–\$60" "🌙" \
  "😴 Pillow Replacement" "Replace pillows every 1-2 years. Fold test: fold your pillow in half — if it doesn't spring back, it's dead. Memory foam lasts longer than down." \
  "🌡️ Temperature Control" "The ideal sleep temperature is 60-67°F. Cooling mattress toppers and breathable sheets make more difference than cranking the AC."

generate_page "home-outdoor" "patio-cleaning-maintenance-tools" "Patio Cleaning & Maintenance" "🪣" "Home & Outdoor" "home-outdoor.html" "home" "linear-gradient(135deg,#e8f4fd 0%,#d0e9fa 100%)" "cat-card__img--home" "Best patio cleaning and maintenance tools reviewed. Pressure washer attachments, deck cleaners, and outdoor brooms tested across seasons." \
  "Best Surface Cleaners for Pressure Washers" "Ryobi, Greenworks, and Simpson surface cleaners tested on concrete and pavers." "\$30–\$80" "💦" \
  "5 Best Deck Cleaning Solutions" "Wet &amp; Forget, 30 Seconds, and Olympic tested on mold, algae, and green stains." "\$10–\$30" "🪵" \
  "Heavy-Duty Outdoor Brooms for Every Surface" "Push brooms tested on concrete, composite decking, and gravel driveways." "\$15–\$40" "🧹" \
  "📅 Seasonal Schedule" "Clean your deck twice a year — spring and fall. Power wash concrete annually. Seal wood decks every 2-3 years to prevent rot and graying." \
  "⚠️ Pressure Safety" "Never exceed 1500 PSI on wood decks — it strips the grain. Use a fan tip (25° or 40°) and maintain 12 inches distance."

generate_page "home-outdoor" "outdoor-lighting-solar-gadgets" "Outdoor Lighting & Solar" "💡" "Home & Outdoor" "home-outdoor.html" "home" "linear-gradient(135deg,#e8f4fd 0%,#d0e9fa 100%)" "cat-card__img--home" "Best outdoor lighting and solar-powered gadgets reviewed. Path lights, string lights, and security floodlights tested for brightness and durability." \
  "Best Solar Path Lights That Actually Stay Bright" "GIGALUMI, BEAU JARDIN, and Ring tested through winter for charge retention." "\$20–\$60" "🔆" \
  "5 Best Outdoor String Lights for Patios" "Brightech, Addlon, and Amazon Basics tested for weather resistance and ambiance." "\$15–\$50" "✨" \
  "Solar vs. Wired Security Floodlights" "Ring, LITOM, and hard-wired options compared for brightness, reliability, and installation." "\$20–\$100" "🔦" \
  "☀️ Solar Placement" "Solar lights need 6-8 hours of direct sunlight to charge fully. North-facing spots won't work. Test placement before permanent installation." \
  "💡 Lumens Guide" "Path lights: 100-200 lumens. String lights: 40-60 per bulb. Security lights: 1000+ lumens. More lumens = brighter, but also more power draw."

generate_page "home-outdoor" "outdoor-storage-utility" "Outdoor Storage & Utility" "🏠" "Home & Outdoor" "home-outdoor.html" "home" "linear-gradient(135deg,#e8f4fd 0%,#d0e9fa 100%)" "cat-card__img--home" "Best outdoor storage solutions and utility products reviewed. Deck boxes, shed organizers, and weatherproof containers tested for all climates." \
  "Best Deck Boxes for Cushion Storage" "Keter, Suncast, and Rubbermaid tested for waterproofing, capacity, and UV resistance." "\$60–\$200" "📦" \
  "5 Best Small Sheds Under \$500" "Arrow, Lifetime, and Suncast storage sheds tested for assembly ease and weather sealing." "\$200–\$500" "🏚️" \
  "Weatherproof Storage Bins for Outdoor Use" "HDX, Sterilite, and IRIS tested through rain, snow, and 100°F heat for 6 months." "\$15–\$50" "🫙" \
  "💧 Waterproof vs. Water-Resistant" "Water-resistant keeps out rain. Waterproof survives floods. For cushion storage, you need waterproof with ventilation to prevent mold." \
  "🔒 Security" "Outdoor storage is a theft target. Choose boxes with padlock-compatible lids. Anchor sheds to concrete. A simple lock deters 90% of opportunistic theft."

generate_page "home-outdoor" "camping-backyard-utility-tools" "Camping & Backyard Utility" "⛺" "Home & Outdoor" "home-outdoor.html" "home" "linear-gradient(135deg,#e8f4fd 0%,#d0e9fa 100%)" "cat-card__img--home" "Best camping and backyard utility tools reviewed. Portable grills, fire pits, and multi-tools tested for outdoor performance." \
  "Best Portable Grills for Camping and Tailgating" "Weber Go-Anywhere, Coleman, and Blackstone tested on burgers, steaks, and vegetables." "\$30–\$200" "🔥" \
  "5 Best Fire Pits Under \$300" "Solo Stove, Breeo, and budget steel pits tested for smoke output and heat radius." "\$50–\$300" "🔥" \
  "Multi-Tools Every Homeowner Needs" "Leatherman, Gerber, and Victorinox tested on real home repair and camping tasks." "\$25–\$120" "🔧" \
  "🌲 Leave No Trace" "For camping: pack out everything. Use established fire rings. Biodegradable soap only. The backcountry stays beautiful when everyone follows the rules." \
  "🏠 Backyard Setup" "Fire pits need 10+ feet clearance from structures. Check local burn ordinances. A spark screen prevents flying embers — never skip it."

generate_page "home-outdoor" "seasonal-outdoor-essentials" "Seasonal Outdoor Essentials" "🌤️" "Home & Outdoor" "home-outdoor.html" "home" "linear-gradient(135deg,#e8f4fd 0%,#d0e9fa 100%)" "cat-card__img--home" "Best seasonal outdoor essentials reviewed. Snow removal tools, rain gear, and summer cooling products tested for real weather conditions." \
  "Best Electric Snow Blowers for Small Driveways" "EGO, Greenworks, and Toro tested in 6-12 inches of snow on paved and gravel surfaces." "\$150–\$400" "❄️" \
  "5 Best Portable Fans for Outdoor Cooling" "O2COOL, OPOLAR, and clip-on fans tested for airflow, battery life, and portability." "\$15–\$50" "🌀" \
  "Rain Gear That Works: Boots, Jackets, and Tarps" "BOGS, Columbia, and Frogg Toggs tested through 3 months of Pacific Northwest rain." "\$20–\$150" "🌧️" \
  "📅 Seasonal Prep" "Spring: clean gutters, check AC. Summer: seal deck, maintain sprinklers. Fall: rake leaves, winterize pipes. Winter: stock salt, check furnace filters." \
  "❄️ Winter Readiness" "Buy snow removal gear in October — prices jump 40% after the first storm. Electric snow blowers start instantly unlike gas models in freezing temps."

echo ""
echo "=== Generating Gardening subcategory pages ==="

generate_page "gardening" "hand-tools-for-beginners" "Hand Tools for Beginners" "🧤" "Gardening" "gardening.html" "garden" "linear-gradient(135deg,#e6f7ee 0%,#c8f0d8 100%)" "cat-card__img--garden" "Best beginner gardening hand tools reviewed. Trowels, pruners, and gloves tested for comfort, durability, and ease of use." \
  "Best Garden Trowel Sets for New Gardeners" "Fiskars, Radius, and budget steel sets tested in clay, sand, and loam soil." "\$10–\$40" "🌱" \
  "5 Best Gardening Gloves That Last" "Pine Tree Tools, Showa, and leather gloves tested for thorn protection and dexterity." "\$8–\$25" "🧤" \
  "Bypass vs. Anvil Pruners Explained" "Felco, Fiskars, and Corona tested on green stems, dead wood, and thick branches." "\$15–\$60" "✂️" \
  "🌱 Start Simple" "New gardeners need only 5 tools: trowel, pruners, gloves, watering can, and a garden fork. Master these before buying specialized equipment." \
  "💪 Ergonomics" "Choose tools with padded, non-slip grips. Arthritis-friendly models with spring-action handles reduce hand fatigue by 50%."

generate_page "gardening" "watering-tools-irrigation" "Watering Tools & Irrigation" "💧" "Gardening" "gardening.html" "garden" "linear-gradient(135deg,#e6f7ee 0%,#c8f0d8 100%)" "cat-card__img--garden" "Best garden watering tools and irrigation systems reviewed. Hoses, sprinklers, and drip systems tested across full growing seasons." \
  "Best Expandable Garden Hoses That Don't Kink" "Flexi Hose, TBI Pro, and Aterod tested for durability over 500 expansion cycles." "\$20–\$50" "🚿" \
  "Drip Irrigation Kits for Raised Beds" "Rain Bird, DIG, and Orbit starter kits tested for even water distribution." "\$20–\$60" "💧" \
  "5 Best Oscillating Sprinklers for Large Lawns" "Melnor, Orbit, and Gardena tested for coverage, evenness, and durability." "\$15–\$45" "🌧️" \
  "💧 Water Early" "Water in the early morning (6-10 AM). Evening watering promotes fungal growth. Midday watering wastes 30% to evaporation." \
  "📐 Drip vs. Sprinkler" "Drip irrigation uses 50% less water than sprinklers and delivers water directly to roots. Worth the setup time for vegetable gardens."

generate_page "gardening" "pruning-cutting-tools" "Pruning & Cutting Tools" "✂️" "Gardening" "gardening.html" "garden" "linear-gradient(135deg,#e6f7ee 0%,#c8f0d8 100%)" "cat-card__img--garden" "Best pruning and cutting tools for gardeners. Loppers, hedge shears, and pruning saws tested on real trees, shrubs, and hedges." \
  "Best Loppers for Thick Branches (2+ inches)" "Fiskars PowerGear, Corona, and Tabor tested on oak, maple, and fruit tree branches." "\$25–\$60" "🌳" \
  "5 Best Hedge Shears for Clean Lines" "Okatsune, ARS, and Fiskars tested on boxwood, privet, and holly hedges." "\$20–\$70" "🌿" \
  "Folding Pruning Saws vs. Bow Saws" "Silky, Corona, and Bahco tested on branches up to 6 inches in diameter." "\$15–\$50" "🪚" \
  "✂️ Clean Cuts Heal" "Dull blades crush stems, inviting disease. Sharp bypass pruners make clean cuts that heal 3x faster. Sharpen blades every 2 weeks during growing season." \
  "🧼 Sanitize Between Plants" "Dip blades in 70% rubbing alcohol between plants to prevent spreading disease. Takes 10 seconds — saves entire shrubs."

generate_page "gardening" "weeding-tools" "Weeding Tools" "🌿" "Gardening" "gardening.html" "garden" "linear-gradient(135deg,#e6f7ee 0%,#c8f0d8 100%)" "cat-card__img--garden" "Best weeding tools reviewed. Stand-up weeders, hoes, and weed torches tested for effectiveness on dandelions, crabgrass, and bindweed." \
  "Best Stand-Up Weeders (No Bending Required)" "Fiskars, Grampa's Weeder, and Worth tested on dandelions and tap-rooted weeds." "\$20–\$40" "🌾" \
  "5 Best Garden Hoes for Weed Prevention" "Stirrup hoe, warren hoe, and collinear hoe compared for efficiency." "\$15–\$45" "⛏️" \
  "Weed Torches: Do They Actually Work?" "Flame and infrared weed torches tested on driveway cracks and garden paths." "\$25–\$60" "🔥" \
  "🌱 Prevention First" "A 3-inch layer of mulch prevents 90% of weed seeds from germinating. Mulch once in spring — it's cheaper and easier than weeding all summer." \
  "⏰ Timing Matters" "Weed after rain when soil is moist — roots pull out cleanly. Dry soil breaks roots, leaving pieces that regrow. Early morning weeding is the sweet spot."

generate_page "gardening" "raised-bed-soil-tools" "Raised Bed & Soil Tools" "🌻" "Gardening" "gardening.html" "garden" "linear-gradient(135deg,#e6f7ee 0%,#c8f0d8 100%)" "cat-card__img--garden" "Best raised bed kits and soil tools reviewed. Metal, cedar, and composite beds tested alongside soil testers and amendment tools." \
  "Best Soil pH Testers for Home Gardeners" "Sonkir, Luster Leaf, and lab test kits compared for accuracy and ease of use." "\$8–\$30" "🧪" \
  "5 Best Garden Soil Mixes for Raised Beds" "Mel's Mix, FoxFarm, and DIY blends tested for vegetable growth over 2 seasons." "\$15–\$50" "🪴" \
  "Compost Bins: Tumbler vs. Stationary" "FCMP, Envirocycle, and open bin composting compared for speed and convenience." "\$40–\$150" "♻️" \
  "🧪 Test Your Soil" "Get a soil test before adding amendments. Most vegetables want pH 6.0-7.0. Adding lime to already-alkaline soil wastes money and harms plants." \
  "🌱 Bed Depth" "12 inches minimum for vegetables. 6 inches for herbs and lettuce. Deeper beds mean less watering and better root development."

generate_page "gardening" "plant-support-training" "Plant Support & Training" "🌱" "Gardening" "gardening.html" "garden" "linear-gradient(135deg,#e6f7ee 0%,#c8f0d8 100%)" "cat-card__img--garden" "Best plant supports, trellises, and training systems reviewed. Tomato cages, garden netting, and stake systems tested through full growing seasons." \
  "Best Tomato Cages That Don't Topple Over" "Heavy-gauge, Texas-style, and spiral cages tested with indeterminate tomatoes." "\$10–\$30" "🍅" \
  "5 Best Garden Trellises for Climbing Plants" "A-frame, fan, and wall-mounted trellises tested with cucumbers, beans, and clematis." "\$15–\$60" "🌿" \
  "Plant Clips vs. Velcro Ties vs. Twine" "3 methods tested for hold strength, plant damage, and reusability." "\$5–\$15" "🧵" \
  "🍅 Cage Early" "Install tomato cages when transplanting, not after plants are 3 feet tall. Late caging breaks stems and stresses plants." \
  "📐 Vertical Growing" "Trellising saves 50% of garden floor space. Cucumbers, beans, peas, and squash all grow vertically — freeing ground space for other crops."

generate_page "gardening" "seed-starting-indoor-grow" "Seed Starting & Indoor Grow" "🌾" "Gardening" "gardening.html" "garden" "linear-gradient(135deg,#e6f7ee 0%,#c8f0d8 100%)" "cat-card__img--garden" "Best seed starting kits and indoor growing equipment reviewed. Grow lights, heat mats, and seedling trays tested for germination success rates." \
  "Best Grow Lights for Seed Starting" "Spider Farmer, Barrina, and GE bulbs tested for spectrum, coverage, and seedling growth." "\$15–\$80" "💡" \
  "5 Best Seedling Heat Mats" "Vivosun, Jump Start, and budget mats tested for temperature consistency and safety." "\$15–\$40" "🌡️" \
  "Seed Starting Mix vs. Potting Soil" "Jiffy, Espoma, and DIY mixes compared for germination rate and root development." "\$5–\$15" "🪴" \
  "💡 Light Distance" "Keep grow lights 2-4 inches above seedlings. Too far = leggy, weak plants. Too close = leaf burn. Adjust daily as seedlings grow." \
  "📅 Timing" "Start seeds 6-8 weeks before your last frost date. Use your USDA zone to calculate. Starting too early creates rootbound, stressed transplants."

generate_page "gardening" "garden-storage-tool-organization" "Garden Storage & Organization" "🏠" "Gardening" "gardening.html" "garden" "linear-gradient(135deg,#e6f7ee 0%,#c8f0d8 100%)" "cat-card__img--garden" "Best garden tool storage and organization solutions reviewed. Tool racks, garden carts, and shed organizers tested for durability and convenience." \
  "Best Garden Tool Racks and Wall Organizers" "Berry&Bird, Stalwart, and wall-mount pegboard systems tested in sheds and garages." "\$15–\$50" "🧰" \
  "5 Best Garden Carts and Wheelbarrows" "Gorilla Carts, True Temper, and folding wagons tested for load capacity and terrain." "\$40–\$150" "🛒" \
  "Tool Maintenance: Cleaning and Sharpening Guide" "How to clean, sharpen, and oil garden tools for 10+ years of reliable service." "\$10–\$25" "🔧" \
  "🧼 Clean After Use" "Rinse soil off tools after every use. Dry them to prevent rust. A bucket of sand mixed with mineral oil makes cleaning and oiling a one-step process." \
  "🪵 Hanging Beats Piling" "Tools stored on wall hooks last 3x longer than tools piled on the floor. Moisture, weight, and tangling damage tools stored on ground level."

generate_page "gardening" "pest-plant-protection" "Pest & Plant Protection" "🐛" "Gardening" "gardening.html" "garden" "linear-gradient(135deg,#e6f7ee 0%,#c8f0d8 100%)" "cat-card__img--garden" "Best pest control and plant protection products reviewed. Row covers, neem oil, and traps tested for organic and conventional garden protection." \
  "Best Row Covers for Pest Protection" "Agribon, Gardener's Supply, and budget mesh covers tested against cabbage worms and beetles." "\$10–\$40" "🛡️" \
  "5 Best Organic Pest Sprays That Work" "Neem oil, insecticidal soap, and BT spray tested on aphids, caterpillars, and mites." "\$8–\$25" "🌿" \
  "Deer Fencing: Which Type Keeps Them Out?" "Poly mesh, electric, and metal fencing tested in suburban deer-heavy areas." "\$30–\$200" "🦌" \
  "🐞 Beneficial Bugs" "Ladybugs eat 50 aphids per day. Attract them with dill, fennel, and yarrow. Don't spray insecticide — you'll kill the good bugs too." \
  "🕐 Spray Timing" "Apply organic sprays in the evening when bees are inactive. Never spray in direct sun — it burns leaves. Reapply after rain."

generate_page "gardening" "balcony-small-space-gardening" "Balcony & Small-Space Gardening" "🏢" "Gardening" "gardening.html" "garden" "linear-gradient(135deg,#e6f7ee 0%,#c8f0d8 100%)" "cat-card__img--garden" "Best balcony and small-space gardening products reviewed. Railing planters, vertical gardens, and compact containers tested in apartments." \
  "Best Railing Planters for Apartment Balconies" "FOYUEE, Greenbo, and Home-X tested for fit, drainage, and wind resistance." "\$15–\$40" "🌺" \
  "5 Best Vertical Garden Systems" "GreenStalk, Lettuce Grow, and wall pocket planters tested for yield and maintenance." "\$30–\$200" "🌿" \
  "Compact Self-Watering Planters for Herbs" "LECHUZA, Bloem, and Gardenix tested for water retention and herb growth." "\$10–\$40" "🌿" \
  "📐 Weight Limits" "Check your balcony's weight limit before filling containers with soil. A 5-gallon pot of wet soil weighs 50+ lbs. Distribute weight evenly." \
  "☀️ Sun Assessment" "Track your balcony's sun exposure for a week before planting. 6+ hours = tomatoes and peppers. 3-6 hours = herbs and lettuce. Under 3 = shade-lovers only."

echo ""
echo "=== Generating Pets subcategory pages ==="

generate_page "pets" "dog-feeding-watering" "Dog Feeding & Watering" "🍽️" "Pets" "pets.html" "pets" "linear-gradient(135deg,#fce8f3 0%,#f9d0e8 100%)" "cat-card__img--pets" "Best dog feeding and watering products reviewed. Bowls, feeders, and water fountains tested for durability, hygiene, and ease of cleaning." \
  "Best Stainless Steel Dog Bowls (Non-Slip)" "Basis Pet, PEGGY11, and budget bowls tested for stability, rust resistance, and dishwashability." "\$10–\$30" "🥣" \
  "5 Best Dog Water Fountains" "PetSafe, Catit, and Veken tested for filter quality, noise level, and water flow." "\$20–\$50" "💧" \
  "Slow Feeder Bowls: Do They Really Work?" "Outward Hound, Lickimat, and maze bowls tested on fast eaters for bloat prevention." "\$8–\$25" "🐕" \
  "🥣 Material Matters" "Stainless steel is safest — no BPA, no chin acne from plastic, and dishwasher-safe. Ceramic looks nice but chips. Plastic harbors bacteria in scratches." \
  "💧 Fresh Water" "Dogs need 1 oz of water per pound of body weight daily. Water fountains encourage drinking and filter out debris. Change filters monthly."

generate_page "pets" "dog-grooming-tools" "Dog Grooming Tools" "✂️" "Pets" "pets.html" "pets" "linear-gradient(135deg,#fce8f3 0%,#f9d0e8 100%)" "cat-card__img--pets" "Best dog grooming tools reviewed. Brushes, clippers, and nail grinders tested on every coat type from poodles to huskies." \
  "Best Deshedding Tools for Heavy Shedders" "FURminator, SleekEZ, and Hertzko tested on labs, huskies, and golden retrievers." "\$10–\$30" "🐕" \
  "5 Best Dog Nail Grinders (Stress-Free)" "Dremel, Casfuy, and LuckyTail tested for noise, vibration, and grind smoothness." "\$15–\$40" "💅" \
  "Quiet Dog Clippers for Home Grooming" "Wahl, oneisall, and Hatteker tested on anxious dogs for noise and cut quality." "\$25–\$70" "✂️" \
  "🧴 Brush Frequency" "Long-haired breeds: daily. Medium coats: 2-3x/week. Short coats: weekly. Regular brushing prevents mats, distributes oils, and reduces shedding by 90%." \
  "💅 Nail Comfort" "Grinders are less scary than clippers for most dogs. Start slow — 5 seconds per nail — and pair with treats. In 2 weeks, most dogs accept it calmly."

generate_page "pets" "dog-walking-gear" "Dog Walking Gear" "🦮" "Pets" "pets.html" "pets" "linear-gradient(135deg,#fce8f3 0%,#f9d0e8 100%)" "cat-card__img--pets" "Best dog walking gear reviewed. Leashes, harnesses, and poop bag holders tested for safety, comfort, and durability." \
  "Best No-Pull Harnesses for Strong Dogs" "Ruffwear, Kurgo, and PetSafe Easy Walk tested on pullers from 30 to 100 lbs." "\$20–\$50" "🦺" \
  "5 Best Retractable Leashes That Don't Break" "Flexi, TUG, and dual-handle leashes tested for locking mechanism and cord strength." "\$10–\$30" "🦮" \
  "Hands-Free Leashes for Running and Hiking" "Tuff Mutt, SparklyPets, and waist-belt leashes tested on 5K runs and trail hikes." "\$15–\$40" "🏃" \
  "🦺 Harness vs. Collar" "Harnesses distribute force across the chest — safer for dogs that pull. Collars can damage the trachea. Use a collar for ID tags, a harness for walks." \
  "📏 Fit Check" "You should fit two fingers between the harness and your dog's body. Too loose = escape. Too tight = chafing. Recheck fit monthly for growing puppies."

generate_page "pets" "pet-cleaning-odor-control" "Pet Cleaning & Odor Control" "🧹" "Pets" "pets.html" "pets" "linear-gradient(135deg,#fce8f3 0%,#f9d0e8 100%)" "cat-card__img--pets" "Best pet cleaning and odor control products reviewed. Enzyme cleaners, air purifiers, and stain removers tested on real pet messes." \
  "Best Enzyme Cleaners for Pet Urine" "Nature's Miracle, Rocco &amp; Roxie, and Angry Orange tested on carpet, hardwood, and tile." "\$10–\$25" "🧪" \
  "5 Best Air Purifiers for Pet Owners" "Levoit, Winix, and Honeywell tested for pet dander, hair, and odor removal." "\$60–\$200" "🌬️" \
  "Best Handheld Vacuums for Pet Hair" "Dyson V8, BLACK+DECKER, and Bissell tested on furniture, stairs, and car seats." "\$30–\$150" "🧹" \
  "🧪 Enzyme is Key" "Regular cleaners mask odor — enzyme cleaners break down urine proteins permanently. If your dog can still smell it, they'll mark the same spot again." \
  "🌬️ HEPA Filters" "For pet allergies, use a HEPA-rated air purifier running 24/7 in the bedroom. Replace filters every 6 months for maximum dander capture."

generate_page "pets" "cat-litter-litter-box-accessories" "Cat Litter & Litter Box" "🐱" "Pets" "pets.html" "pets" "linear-gradient(135deg,#fce8f3 0%,#f9d0e8 100%)" "cat-card__img--pets" "Best cat litter and litter box accessories reviewed. Clumping, crystal, and pine litters tested alongside mats, liners, and scoops." \
  "Best Clumping Cat Litters Compared" "Dr. Elsey's, World's Best, and Arm &amp; Hammer tested for clumping, tracking, and dust." "\$8–\$25" "🐱" \
  "5 Best Litter Mats That Trap Tracking" "Gorilla Grip, PetFusion, and Phthalate-free mats tested for litter capture efficiency." "\$10–\$30" "🧹" \
  "Hooded vs. Open Litter Boxes: Which Do Cats Prefer?" "Top-entry, front-entry, and open pans tested with 6 cats for usage preference." "\$15–\$50" "📦" \
  "🐱 One Plus One Rule" "You need one litter box per cat plus one extra. A two-cat house needs 3 boxes. Fewer boxes = stress, avoidance, and inappropriate elimination." \
  "🧹 Scoop Daily" "Scoop at least once daily. Full litter changes every 2-3 weeks for clumping, weekly for non-clumping. Cats will avoid dirty boxes."

generate_page "pets" "cat-enrichment-toys" "Cat Enrichment & Toys" "🧶" "Pets" "pets.html" "pets" "linear-gradient(135deg,#fce8f3 0%,#f9d0e8 100%)" "cat-card__img--pets" "Best cat enrichment toys and interactive products reviewed. Puzzle feeders, wand toys, and cat trees tested for engagement and durability." \
  "Best Interactive Cat Toys That Hold Attention" "PetDroid, Potaroma, and Bergan Turbo tested for battery life and cat engagement." "\$10–\$30" "🎯" \
  "5 Best Cat Trees for Large Cats" "Go Pet Club, Feandrea, and Armarkat tested for stability, sisal quality, and weight capacity." "\$50–\$200" "🏠" \
  "Puzzle Feeders: Do They Really Slow Down Eating?" "Trixie, Catit Senses, and Doc &amp; Phoebe tested on food-motivated cats." "\$8–\$25" "🧩" \
  "🎯 Rotate Toys" "Cats lose interest in the same toy after 3-4 days. Keep 3 sets and rotate weekly. Novel = exciting, familiar = boring." \
  "🐱 Play Schedule" "Two 15-minute play sessions daily prevents behavior problems, obesity, and furniture destruction. Morning and evening match cats' natural hunting schedule."

generate_page "pets" "pet-beds-comfort" "Pet Beds & Comfort" "🛏️" "Pets" "pets.html" "pets" "linear-gradient(135deg,#fce8f3 0%,#f9d0e8 100%)" "cat-card__img--pets" "Best pet beds and comfort products reviewed. Orthopedic, bolster, and cooling beds tested for support, durability, and washability." \
  "Best Orthopedic Dog Beds for Senior Dogs" "Big Barker, PetFusion, and Furhaven tested for foam density and joint support." "\$40–\$200" "🐕" \
  "5 Best Calming Dog Beds (Donut Style)" "Best Friends, Active Pets, and Bedsure tested for anxiety reduction and washability." "\$20–\$60" "🍩" \
  "Cooling Beds for Hot Weather" "The Green Pet Shop, Arf Pets, and K&amp;H tested for temperature drop and durability." "\$20–\$50" "❄️" \
  "📐 Right Size" "Measure your pet curled up AND stretched out. The bed should accommodate the stretch position with 6 inches extra. Most owners buy too small." \
  "🧺 Washability" "Choose beds with removable, machine-washable covers. Dogs shed 15,000 hairs daily — unwashable beds become allergen magnets within weeks."

generate_page "pets" "travel-car-accessories" "Travel & Car Accessories" "🚗" "Pets" "pets.html" "pets" "linear-gradient(135deg,#fce8f3 0%,#f9d0e8 100%)" "cat-card__img--pets" "Best pet travel and car accessories reviewed. Seat covers, carriers, and travel bowls tested for safety, comfort, and convenience." \
  "Best Dog Car Seat Covers (Waterproof)" "4Knines, BarksBar, and Vailge tested for waterproofing, installation ease, and durability." "\$25–\$60" "🚗" \
  "5 Best Airline-Approved Pet Carriers" "Sherpa, Sturdibag, and Henkelion tested for airline size compliance and pet comfort." "\$25–\$60" "✈️" \
  "Collapsible Travel Bowls vs. Bottle Dispensers" "Ruffwear, Messy Mutts, and MalsiPree tested for leak-proofing and portability." "\$8–\$20" "🥤" \
  "🚗 Car Safety" "An unrestrained 60-lb dog in a 35 mph crash becomes a 2,700-lb projectile. Use a crash-tested harness or secured crate. Never let dogs ride unsecured." \
  "✈️ Airline Rules" "Most airlines require carriers that fit under the seat (18x11x11 max). Call ahead — policies change frequently. Book early as pet spots are limited per flight."

generate_page "pets" "pet-training-aids" "Pet Training Aids" "📋" "Pets" "pets.html" "pets" "linear-gradient(135deg,#fce8f3 0%,#f9d0e8 100%)" "cat-card__img--pets" "Best pet training aids reviewed. Clickers, treat pouches, and training pads tested for effectiveness and ease of use." \
  "Best Dog Training Clickers and Kits" "Karen Pryor, PetSafe, and EcoCity tested for click consistency and ergonomics." "\$5–\$15" "🔔" \
  "5 Best Treat Pouches for Training Sessions" "PetSafe, Doggone Good, and Dicky Bag tested for capacity, access speed, and closure." "\$10–\$25" "🎒" \
  "Puppy Training Pads: Reusable vs. Disposable" "Amazon Basics, Bulldogology, and washable pads compared for absorption and cost." "\$10–\$40" "📰" \
  "🔔 Timing is Everything" "Click within 1 second of the desired behavior. Late clicks confuse dogs. Practice your timing without the dog first — click when a ball bounces." \
  "🎁 High-Value Rewards" "Use boring treats for easy commands and high-value treats (cheese, chicken) for hard ones. Jackpot rewards (5 treats at once) cement breakthrough moments."

generate_page "pets" "smart-pet-gadgets" "Smart Pet Gadgets" "📱" "Pets" "pets.html" "pets" "linear-gradient(135deg,#fce8f3 0%,#f9d0e8 100%)" "cat-card__img--pets" "Best smart pet gadgets reviewed. Pet cameras, GPS trackers, and automated feeders tested for reliability, app quality, and real-world usefulness." \
  "Best Pet Cameras With Treat Tossers" "Furbo, Petcube, and Wyze tested for video quality, two-way audio, and treat accuracy." "\$30–\$200" "📹" \
  "5 Best Smart Pet Doors (App-Controlled)" "SureFlap, PetSafe, and Wayzn tested for selective access, weather sealing, and security." "\$80–\$300" "🚪" \
  "Smart Collar Activity Trackers" "Fi, Whistle, and FitBark tested for step accuracy, sleep tracking, and GPS range." "\$50–\$150" "⌚" \
  "📱 App Quality" "The best hardware with a bad app is useless. Read app reviews separately from product reviews. Look for 4+ star ratings and recent updates." \
  "🔋 Battery Life" "GPS trackers drain batteries fast. Fi lasts 3 months, Whistle lasts 20 days, AirTags last 1 year. Choose based on how often you want to charge."

echo ""
echo "=== All 38 subcategory pages generated! ==="
ls -la kitchen/*.html | wc -l
ls -la home-outdoor/*.html | wc -l
ls -la gardening/*.html | wc -l
ls -la pets/*.html | wc -l
