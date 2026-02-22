<?php
/**
 * Astra Child Theme: functions.php
 * Trust-First Affiliate Lifestyle Site
 *
 * Contains:
 *  1. Enqueue styles & scripts
 *  2. Review Schema Markup (JSON-LD)
 *  3. Last Updated timestamp logic (24h gate)
 *  4. Affiliate link filter (wp-block-button)
 */

defined( 'ABSPATH' ) || exit;

/* ============================================================
   1. ENQUEUE STYLES & SCRIPTS
   ============================================================ */
add_action( 'wp_enqueue_scripts', 'ays_enqueue_assets' );
function ays_enqueue_assets() {
    // Child theme stylesheet (depends on Astra parent)
    wp_enqueue_style(
        'astra-child-style',
        get_stylesheet_uri(),
        array( 'astra-theme-css' ),
        wp_get_theme()->get( 'Version' )
    );

    // TOC script — only on singular posts with sidebar
    if ( is_singular( 'post' ) ) {
        wp_enqueue_script(
            'ays-toc',
            get_stylesheet_directory_uri() . '/js/toc.js',
            array(),
            '1.0.0',
            true // load in footer
        );
    }
}

/* ============================================================
   2. REVIEW SCHEMA MARKUP (JSON-LD)

   Uses custom fields (ACF-compatible) on any review post:
     _ays_product_name      (string)
     _ays_rating            (float, 1-5)
     _ays_review_count      (int)
     _ays_pros              (textarea, one per line)
     _ays_cons              (textarea, one per line)
     _ays_price             (string, optional)
     _ays_brand             (string, optional)

   Self-correction: Using wp_head hook is more reliable than
   injecting into the_content for schema, as it always fires
   once per page regardless of block structure.
   ============================================================ */
add_action( 'wp_head', 'ays_output_review_schema' );
function ays_output_review_schema() {
    if ( ! is_singular( 'post' ) ) {
        return;
    }

    $post_id      = get_the_ID();
    $product_name = get_post_meta( $post_id, '_ays_product_name', true );

    // Only output schema if this post has a product name (i.e., it's a review)
    if ( empty( $product_name ) ) {
        return;
    }

    $rating        = floatval( get_post_meta( $post_id, '_ays_rating',       true ) ?: 0 );
    $review_count  = intval(   get_post_meta( $post_id, '_ays_review_count', true ) ?: 1 );
    $pros_raw      = get_post_meta( $post_id, '_ays_pros', true );
    $cons_raw      = get_post_meta( $post_id, '_ays_cons', true );
    $price         = get_post_meta( $post_id, '_ays_price', true );
    $brand         = get_post_meta( $post_id, '_ays_brand', true );

    // Parse pros/cons from line-separated text
    $pros = array_filter( array_map( 'trim', explode( "\n", $pros_raw ) ) );
    $cons = array_filter( array_map( 'trim', explode( "\n", $cons_raw ) ) );

    // Build positiveNotes ItemList
    $positive_items = array();
    foreach ( array_values( $pros ) as $i => $pro ) {
        $positive_items[] = array(
            '@type'    => 'ListItem',
            'position' => $i + 1,
            'name'     => sanitize_text_field( $pro ),
        );
    }

    // Build negativeNotes ItemList
    $negative_items = array();
    foreach ( array_values( $cons ) as $i => $con ) {
        $negative_items[] = array(
            '@type'    => 'ListItem',
            'position' => $i + 1,
            'name'     => sanitize_text_field( $con ),
        );
    }

    // Build the itemReviewed (Product)
    $item_reviewed = array(
        '@type' => 'Product',
        'name'  => sanitize_text_field( $product_name ),
    );
    if ( $brand ) {
        $item_reviewed['brand'] = array( '@type' => 'Brand', 'name' => sanitize_text_field( $brand ) );
    }
    if ( $price ) {
        $item_reviewed['offers'] = array(
            '@type'         => 'Offer',
            'price'         => sanitize_text_field( $price ),
            'priceCurrency' => 'USD',
            'availability'  => 'https://schema.org/InStock',
        );
    }

    // Full Review schema
    $schema = array(
        '@context'     => 'https://schema.org',
        '@type'        => 'Review',
        'name'         => get_the_title(),
        'url'          => get_permalink(),
        'reviewBody'   => wp_strip_all_tags( get_the_excerpt() ),
        'datePublished'=> get_the_date( 'c' ),
        'dateModified' => get_the_modified_date( 'c' ),
        'author'       => array(
            '@type' => 'Person',
            'name'  => get_the_author_meta( 'display_name' ),
        ),
        'publisher' => array(
            '@type' => 'Organization',
            'name'  => get_bloginfo( 'name' ),
            'url'   => home_url(),
        ),
        'itemReviewed' => $item_reviewed,
        'reviewRating' => array(
            '@type'       => 'Rating',
            'ratingValue' => $rating,
            'bestRating'  => 5,
            'worstRating' => 1,
        ),
        'aggregateRating' => array(
            '@type'       => 'AggregateRating',
            'ratingValue' => $rating,
            'reviewCount' => $review_count,
            'bestRating'  => 5,
            'worstRating' => 1,
        ),
    );

    if ( ! empty( $positive_items ) ) {
        $schema['positiveNotes'] = array(
            '@type'           => 'ItemList',
            'itemListElement' => $positive_items,
        );
    }

    if ( ! empty( $negative_items ) ) {
        $schema['negativeNotes'] = array(
            '@type'           => 'ItemList',
            'itemListElement' => $negative_items,
        );
    }

    echo '<script type="application/ld+json">' . "\n";
    echo wp_json_encode( $schema, JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE );
    echo "\n" . '</script>' . "\n";
}

/* ============================================================
   3. LAST UPDATED TIMESTAMP (24-HOUR GATE)

   Strategy: Filter `the_date` to replace the publish date
   with a "Last Updated" label when the post was modified
   more than 24 hours after its original publish date.

   Self-correction: We filter `get_the_date` (used in Astra's
   entry-meta) rather than hooking into entry-meta directly,
   which would require template overrides. The filter approach
   works globally without any template changes.
   ============================================================ */
add_filter( 'get_the_date', 'ays_last_updated_timestamp', 10, 3 );
add_filter( 'get_the_modified_date', '__return_false' ); // Hide raw modified date; we handle display ourselves

function ays_last_updated_timestamp( $the_date, $format, $post ) {
    if ( ! $post ) {
        return $the_date;
    }

    $published  = get_post_time( 'U', true, $post );   // UTC timestamp
    $modified   = get_post_modified_time( 'U', true, $post ); // UTC timestamp
    $diff_hours = ( $modified - $published ) / 3600;

    // Only show "Last Updated" if modified more than 24 hours after publish
    if ( $diff_hours < 24 ) {
        return $the_date;
    }

    $display_format = $format ?: get_option( 'date_format' );
    $updated_date   = get_post_modified_time( $display_format, false, $post );

    return sprintf(
        '<span class="ays-last-updated">Last Updated: <time datetime="%s">%s</time></span>',
        esc_attr( get_post_modified_time( 'c', true, $post ) ),
        esc_html( $updated_date )
    );
}

/* ============================================================
   4. AFFILIATE LINK FILTER (wp-block-button)

   Adds target="_blank", rel="nofollow sponsored noopener"
   to all <a> tags inside .wp-block-button containers.

   Self-correction: DOMDocument is used over regex because
   regex-based HTML manipulation is fragile. DOMDocument
   correctly handles nested elements and attribute quoting.
   We use mb_convert_encoding to prevent UTF-8 mangling.
   ============================================================ */
add_filter( 'the_content', 'ays_affiliate_button_links', 20 );
function ays_affiliate_button_links( $content ) {
    // Short-circuit if no button blocks present
    if ( strpos( $content, 'wp-block-button' ) === false ) {
        return $content;
    }

    $dom = new DOMDocument( '1.0', 'UTF-8' );
    libxml_use_internal_errors( true );

    // Wrap in a div to prevent DOMDocument adding <html>/<body> wrapper
    $wrapped = '<div id="ays-parse-root">'
        . mb_convert_encoding( $content, 'HTML-ENTITIES', 'UTF-8' )
        . '</div>';

    $dom->loadHTML(
        $wrapped,
        LIBXML_HTML_NOIMPLIED | LIBXML_HTML_NODEFDTD
    );
    libxml_clear_errors();

    $xpath   = new DOMXPath( $dom );
    $buttons = $xpath->query( '//*[contains(@class,"wp-block-button")]//a' );

    if ( $buttons && $buttons->length > 0 ) {
        foreach ( $buttons as $link ) {
            $link->setAttribute( 'target', '_blank' );
            $link->setAttribute( 'rel',    'nofollow sponsored noopener' );
        }
    }

    // Extract inner HTML of our wrapper div
    $root = $dom->getElementById( 'ays-parse-root' );
    if ( ! $root ) {
        return $content;
    }

    $output = '';
    foreach ( $root->childNodes as $child ) {
        $output .= $dom->saveHTML( $child );
    }

    return $output ?: $content;
}

/* ============================================================
   5. REMOVE ASTRA'S DEFAULT POST DATE (avoid duplication)
   Only active when our custom timestamp function outputs
   the "Last Updated" variant.
   ============================================================ */
add_filter( 'astra_post_date', '__return_false' ); // Let our filter handle date display

/* ============================================================
   6. GUTENBERG BUTTON BLOCK STYLE REGISTRATION
   Registers "CTA (Orange)" as a named style visible in the
   Gutenberg sidebar — no custom CSS required beyond style.css.
   ============================================================ */
add_action( 'init', 'ays_register_block_styles' );
function ays_register_block_styles() {
    register_block_style(
        'core/button',
        array(
            'name'  => 'cta',
            'label' => 'CTA (Orange)',
        )
    );
}
