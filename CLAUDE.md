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
