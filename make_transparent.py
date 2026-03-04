from PIL import Image
import sys

def make_transparent(input_path, output_path):
    print(f"Processing {input_path}...")
    try:
        img = Image.open(input_path)
        img = img.convert("RGBA")
        datas = img.getdata()
        
        newData = []
        for item in datas:
            # If the pixel is close to white (background of logo 1)
            # We want to keep the navy/teal elements and remove the white background.
            # R, G, B > 240 is considered background white
            if item[0] > 240 and item[1] > 240 and item[2] > 240:
                newData.append((255, 255, 255, 0)) # transparent
            else:
                newData.append(item)
                
        img.putdata(newData)
        
        # Crop the transparent borders (autocrop)
        bbox = img.getbbox()
        if bbox:
            img = img.crop(bbox)
            
        img.save(output_path, "PNG")
        print(f"Saved transparent logo to {output_path}")
    except Exception as e:
        print(f"Error: {e}")

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python make_transparent.py <input> <output>")
    else:
        make_transparent(sys.argv[1], sys.argv[2])
