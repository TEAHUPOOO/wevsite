import os
import glob
import re

dirs = {
    'kitchen': 'kitchen_hero_bg.png',
    'home-outdoor': 'home_hero_bg.png',
    'gardening': 'garden_hero_bg.png',
    'pets': 'pets_hero_bg.png'
}

for folder, bg_img in dirs.items():
    files = glob.glob(f"{folder}/*.html")
    for filepath in files:
        with open(filepath, 'r', encoding='utf-8') as f:
            content = f.read()

        # Update section style
        content = re.sub(
            r'<section class="category-hero" style="background:linear-gradient\(135deg,[^"]+">',
            f'<section class="category-hero" style="background:linear-gradient(rgba(10, 25, 47, 0.7), rgba(10, 25, 47, 0.8)), url(\'../{bg_img}\') center/cover no-repeat;padding:4rem 0;color:#ffffff;text-shadow:0 2px 4px rgba(0,0,0,0.5);">',
            content
        )

        # Update emoji div style
        content = re.sub(
            r'<div style="font-size:3rem;margin-bottom:1rem;">',
            r'<div style="font-size:3rem;margin-bottom:1rem;color:#ffffff;">',
            content
        )

        # Update h1 style
        content = re.sub(
            r'<h1 class="section-title" style="margin-bottom:\.5rem;">',
            r'<h1 class="section-title" style="margin-bottom:.5rem;color:#ffffff;">',
            content
        )

        # Update p.section-sub
        content = re.sub(
            r'<p class="section-sub">(.*?)</p>\s*</div>\s*</section>',
            r'<p class="section-sub" style="color:#ffffff;max-width:800px;margin:0 auto;">\1</p>\n      </div>\n    </section>',
            content,
            flags=re.DOTALL
        )

        with open(filepath, 'w', encoding='utf-8') as f:
            f.write(content)

print("Update completed successfully.")
