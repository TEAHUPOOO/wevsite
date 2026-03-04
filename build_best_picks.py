import re

def build_best_picks():
    try:
        with open('c:/Users/youss/Desktop/wevsite/index.html', 'r', encoding='utf-8') as f:
            html = f.read()

        # Extract the 4 category sections
        pattern = r'(<!-- ══════════════════════════════════════════════════════\s*CATEGORY: KITCHEN.*?</section>)\s*\n\s*\n\s*<!-- ══════════════════════════════════════════════════════\s*ARTICLE \+ STICKY TOC'
        match = re.search(pattern, html, re.DOTALL)
        
        if not match:
            print("Could not find the sections in index.html")
            return
            
        sections = match.group(1)
        
        # Remove the 'View Our Best Picks' links, since we are already on the Best Picks page
        sections = re.sub(r'<a href="best-picks\.html" class="category-section__view-all">View Our Best Picks →</a>', '', sections)
        
        with open('c:/Users/youss/Desktop/wevsite/best-picks.html', 'r', encoding='utf-8') as f2:
            bp_html = f2.read()
        
        # Replace the placeholder section with the new header + the 4 sections
        new_header = '''<section class="page-header" style="padding: 100px 20px 40px; text-align: center; background: var(--bg-gradient-hero);">
      <h1 style="font-family: 'Outfit', sans-serif; font-size: clamp(2.5rem, 5vw, 4rem); color: var(--navy); margin-bottom: 1rem; font-weight: 800;">Our Best Picks</h1>
      <p style="font-family: 'Inter', sans-serif; font-size: 1.125rem; color: var(--text); max-width: 700px; margin: 0 auto; line-height: 1.6;">We've spent thousands of hours testing gear so you don't have to. Here are the absolute best products we recommend right now across all our major categories.</p>
    </section>
    
    '''
        
        bp_html = re.sub(r'<section class="placeholder-page">.*?</section>', new_header + sections, bp_html, flags=re.DOTALL)
        
        with open('c:/Users/youss/Desktop/wevsite/best-picks.html', 'w', encoding='utf-8') as f3:
            f3.write(bp_html)
            
        print("Successfully updated best-picks.html")
    except Exception as e:
        print(f"Error: {e}")

if __name__ == '__main__':
    build_best_picks()
