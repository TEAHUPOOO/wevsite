# CLAUDE.md — Affiliate Lifestyle Site (WordPress)

## Role
Act as a Senior WordPress Engineer and UX Lead. Use Adaptive Thinking to build a high-conversion affiliate ecosystem for this project.

## Project Context
- **Platform:** WordPress (Astra Theme + Gutenberg)
- **Type:** Professional US-based lifestyle utility/affiliate site
- **Architecture Goal:** "Trust-First" UI — avoid the cookie-cutter affiliate look
- **Categories:** Kitchen, Home & Outdoor, Gardening, Pets

---

## Design System

### Color Palette
| Name              | Hex       |
|-------------------|-----------|
| Navy              | `#2C3E50` |
| Confidence Green  | `#27AE60` |
| Soft Orange       | `#E67E22` |

### Typography
- **Body:** Inter
- **Headers:** Montserrat

### Core UI Patterns
- Custom `Gutenberg Card` class for post loops — subtle hover-lift effect + custom borders
- Sticky Sidebar TOC that highlights the active section on scroll
- Components should feel editorial/premium, not generic affiliate

---

## Task Priorities

### Task 1 — Global CSS (Master Design System)
- Deliver as `child-theme/style.css` additions or Astra Custom CSS
- Include: color variables, typographic scale, card component, sticky TOC
- Prefer Astra native hooks over pure custom CSS where more efficient — explain the choice when used

### Task 2 — Review Components (HTML/CSS for Gutenberg HTML Blocks)
Three required components:

1. **Dynamic Top 3 Comparison Table**
   - Mobile-responsive
   - "Floating" elevated header for the #1 pick

2. **Verdict Box** (dual-column)
   - Left column: "Who it's for" (bulleted list)
   - Right column: "The Bottom Line" (paragraph + CTA button)

3. **Visual Pros/Cons (Spec Sheet style)**
   - SVG check/cross icons
   - Looks like a spec sheet, not a simple list

### Task 3 — PHP Snippets (`functions.php` / Child Theme)
Three required snippets:

1. **Automated Schema Markup (JSON-LD)**
   - Review schema with `AggregateRating` and Pros/Cons fields

2. **"Last Updated" Timestamp Logic**
   - Only updates the displayed date if post was modified more than 24 hours ago

3. **Affiliate Link Filter**
   - Force all `.wp-block-button` links to `target="_blank"` and `rel="nofollow sponsored"`

### Task 4 — Site Architecture & Strategy
- **Silo/folder structure** for: Kitchen, Home & Outdoor, Gardening, Pets
- **Homepage layout** using 100% native Gutenberg blocks (premium look):
  - Hero → Category Grid → Feature Review Spotlight

---

## Output Order Convention
When generating code for this project, always deliver in this sequence:
1. Global CSS
2. PHP Snippets (child theme)
3. HTML/CSS component patterns

## Self-Correction Rule
If Astra's native hooks can replace custom CSS more efficiently, explain the trade-off and implement the better solution.

---

## File Structure Reference
```
wp-content/
└── themes/
    └── astra-child/
        ├── style.css          # Design system / overrides
        ├── functions.php      # Schema, timestamp, link filters
        └── blocks/            # Reusable HTML/CSS Gutenberg patterns
            ├── comparison-table.html
            ├── verdict-box.html
            └── pros-cons.html
```

## Category Silo Structure
```
/kitchen/
/home-outdoor/
/gardening/
/pets/
```
Each silo should have:
- A category landing page (pillar)
- Sub-category pages (clusters)
- Individual product review posts

---

## Article Structure Format (REQUIRED)

All product review articles MUST follow this exact structure:

### 1. Top Section (Comparison Grid)
```html
<section class="section section--alt">
  <div class="container">
    <div class="comparison-header">...</div>
    <div class="comparison-grid">
      <!-- 5 product cards with clickable images & names -->
      <article class="prod-card prod-card--top">
        <a href="#best-[product-hint]" class="prod-card__img-link">
          <div class="prod-card__img-wrap">...</div>
        </a>
        <div class="prod-card__body">
          <h3 class="prod-card__name">
            <a href="#best-[product-hint]" class="prod-card__name-link">Product Name</a>
          </h3>
          <!-- specs, price, CTA -->
          <a href="#best-[product-hint]" class="prod-card__review-btn">Read Full Review ↓</a>
        </div>
      </article>
      <!-- Repeat for products 2-5 -->
    </div>
  </div>
</section>
```

### 2. Article Introduction
```html
<section class="section">
  <div class="container" style="max-width:820px">
    <p>Opening paragraph about the category...</p>
    <h2 id="overview-[category]">Overview section...</h2>
    <p>Category context and buying guide intro...</p>
  </div>
</section>
```

### 3. Individual Product Reviews (5 products)
Each product review MUST use this structure:

```html
<article class="product-review" style="margin-bottom: 4rem;">
  <h2 id="best-[product-hint]">1. Product Title: Subtitle</h2>
  <p>Product introduction paragraph describing key features...</p>

  <!-- WRAPPER: Pros/Cons + Verdict Box -->
  <div class="review-components">

    <!-- Pros/Cons Section (FIRST - Top) -->
    <div class="pros-cons">
      <div class="pros-cons-header">
        <div class="pros-cons-header-col pros-cons-header-col--pros">
          <span class="pros-cons-header-label">✓ Pros</span>
        </div>
        <div class="pros-cons-header-col pros-cons-header-col--cons">
          <span class="pros-cons-header-label">✗ Cons</span>
        </div>
      </div>
      <div class="pros-cons-body">
        <div class="pros-cons-col pros-cons-col--pros">
          <div class="pros-cons-row">
            <svg class="v-check">...</svg>
            <span class="pros-cons-text"><strong>Feature</strong> <small>Detail</small></span>
          </div>
          <!-- 3-4 pros -->
        </div>
        <div class="pros-cons-col pros-cons-col--cons">
          <div class="pros-cons-row">
            <svg class="v-cross">...</svg>
            <span class="pros-cons-text"><strong>Limitation</strong> <small>Detail</small></span>
          </div>
          <!-- 3-4 cons -->
        </div>
      </div>
      <div class="pros-cons-footer">Based on specifications &amp; verified reviews</div>
    </div>

    <!-- Verdict Box (SECOND - Below Pros/Cons) -->
    <div class="verdict-box">
      <div class="verdict-topbar"></div>
      <div class="verdict-header">
        <span class="verdict-header-icon">✅</span>
        <span class="verdict-header-text">Our Verdict — Product Name</span>
      </div>
      <div class="verdict-body">
        <div class="verdict-left">
          <p class="verdict-col-label verdict-col-label--left">Who It's For</p>
          <ul class="verdict-list">
            <li class="verdict-item">
              <svg class="v-check">...</svg>
              Persona description
            </li>
            <!-- 3-4 personas -->
          </ul>
        </div>
        <div class="verdict-right">
          <p class="verdict-col-label verdict-col-label--right">The Bottom Line</p>
          <div class="verdict-rating-row">
            <span class="stars">★★★★★</span>
            <span class="verdict-rating-label">Our Score</span>
            <span class="verdict-rating-value">4.8 / 5</span>
          </div>
          <p class="verdict-summary">2-3 sentence verdict summary...</p>
          <a href="#" class="verdict-cta">Check Price on Amazon</a>
        </div>
      </div>
    </div>

  </div><!-- /.review-components -->
</article>
```

**Repeat this structure for all 5 products.**

### Key Requirements:
1. ✅ **Comparison grid** has clickable product images and names linking to `#best-[product-hint]`
2. ✅ **Each product review** wrapped in `<article class="product-review">`
3. ✅ **review-components wrapper** contains BOTH pros/cons (top) and verdict box (bottom)
4. ✅ **Pros/Cons appears FIRST** (above verdict box) and spans full width
5. ✅ **Verdict box appears SECOND** (below pros/cons) and spans full width
6. ✅ **Both sections stack vertically** within the review-components wrapper
7. ✅ **NO duplicate comparison grids** - only ONE at the top of the article
8. ✅ **Read Full Review button** appears in each comparison grid product card

### Pipeline Note:
The current article generation pipeline (agent 09 - WordPress Formatter) does NOT output this structure correctly. Articles generated by the pipeline will need manual post-processing to wrap verdict boxes and pros/cons in the `review-components` div and ensure proper ordering (pros/cons first, verdict second).

**Reference Article:** `kitchen/food-prep-gadgets.html` follows this structure correctly.
