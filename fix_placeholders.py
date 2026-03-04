import os
import glob

folders = {
    'kitchen': ('Kitchen', 'kitchen'),
    'home-outdoor': ('Home & Outdoor', 'home'),
    'gardening': ('Gardening', 'garden'),
    'pets': ('Pets', 'pets')
}

files_to_fix = [
    'pets/automatic-pet-feeders.html',
    'gardening/battery-lawn-mowers.html',
    'gardening/cordless-garden-tools.html',
    'kitchen/air-fryer-ovens.html',
    'gardening/greenhouse-kits.html',
    'pets/gps-pet-trackers.html',
    'pets/heavy-duty-dog-crates.html',
    'kitchen/blenders.html',
    'pets/orthopedic-dog-beds.html',
    'home-outdoor/patio-furniture.html',
    'gardening/raised-garden-beds.html',
    'home-outdoor/pressure-washers.html',
    'home-outdoor/robot-vacuums.html',
    'gardening/smart-irrigation.html',
    'kitchen/espresso-machines.html',
    'pets/self-cleaning-litter-boxes.html',
    'home-outdoor/smart-security.html',
    'kitchen/japanese-knives.html',
    'home-outdoor/stick-vacuums.html',
    'kitchen/stand-mixers.html'
]

for filepath in files_to_fix:
    if not os.path.exists(filepath):
        continue
    
    # Extract info
    folder, filename = os.path.split(filepath)
    slug = filename.replace('.html', '')
    # convert slug to Title Case
    title = ' '.join(word.capitalize() for word in slug.split('-'))
    
    cat_name, cat_slug = folders.get(folder, ('', ''))
    
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Replacements
    # Title tag specifically
    content = content.replace('<title>Best  - Best Home Gear Reviews</title>',
                              f'<title>Best {title} - Best Home Gear Reviews</title>')
    
    # General "Food Prep Gadgets" text replacement
    content = content.replace('Food Prep Gadgets', title)
    
    # Breadcrumb category link
    content = content.replace(
        '<a href="../kitchen.html" style="color:var(--teal);">Kitchen</a>',
        f'<a href="../{folder}.html" style="color:var(--teal);">{cat_name}</a>'
    )
    
    # Category Eyebrow
    content = content.replace(
        '<p class="section-eyebrow">Kitchen</p>',
        f'<p class="section-eyebrow">{cat_name}</p>'
    )
    
    # Icon and card image class
    content = content.replace('>🔪<', '>✨<')
    content = content.replace('cat-card__img--kitchen', f'cat-card__img--{cat_slug}')
    
    with open(filepath, 'w', encoding='utf-8') as f:
        f.write(content)
        
print("Successfully updated placeholder files.")
