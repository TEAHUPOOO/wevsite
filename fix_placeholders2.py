import os

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
    title = ' '.join(word.capitalize() for word in slug.split('-'))
    
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()
    
    content = content.replace("Food Prep Gadget Reviews", f"{title} Reviews")
    content = content.replace("Expert food prep gadget reviews. Food processors, vegetable choppers, mandoline slicers and immersion blenders tested in real kitchens.", 
                              f"Expert {title.lower()} reviews. We test the top products to help you find the best pick for your home.")
    content = content.replace("Expert food prep gadget reviews. Food processors, vegetable choppers, mandoline slicers and more tested in real kitchens.",
                              f"Expert {title.lower()} reviews. We test the top products to help you find the best pick for your home.")
    content = content.replace("Breville food processor, Mueller chopper, Benriner mandoline, Braun immersion blender &amp; Jenaluca herb scissors — 5 top picks tested.",
                              "We've tested the top models for performance, durability, and value.")
    content = content.replace("Food Prep Gadgets Buying Guide", f"{title} Buying Guide")
    
    with open(filepath, 'w', encoding='utf-8') as f:
        f.write(content)
        
print("Updated extra placeholder text.")
