from PIL import Image
import os
import sys

import os
from PIL import Image
import sys

def resize_image(image_path, output_folder, sizes):
    """
    Resize the image in `image_path` and save it to `output_folder` with different sizes.
    :param image_path: The path to the image to resize.
    :param output_folder: The folder to save the resized images.
    :param sizes: A list of sizes to resize the image to.
    """
    with Image.open(os.path.join("img", image_path)) as img:
        # Get the image name without extension
        image_name = os.path.splitext(os.path.basename(image_path))[0]

        # Create the output folder if it doesn't exist
        os.makedirs(output_folder, exist_ok=True)

        # Iterate over each size and resize the image
        for size in sizes:
            new_img = img.resize(size)
            # Construct the output filename with the new size
            output_filename = f"{image_name}-{(size[0]+size[1])//2}.jpg"  # Change 'jpg' to the actual image extension
            output_path = os.path.join(output_folder, output_filename)
            print(output_path)
            new_img.save(output_path)

if __name__ == "__main__":
    images = ["Anxiety img 1.jpg", "anxiety img 2.jpg", "depression img 1.webp", "depression img 2.jpg", "substance abuse img 1.jpg"]
    sizes = [(1600, 900), (1500, 500), (400, 400), (1080, 1080), (1200, 628)]

    # Assuming the image path is provided as a command line argument
    if len(sys.argv) < 2:
        for image in images:
            out_path = os.path.join("build", "img", os.path.splitext(image)[0])
            resize_image(image, out_path, sizes)
    else:
        image = sys.argv[1]
        # Define the output path with a Windows-compatible format
        out_path = os.path.join("build", "img", os.path.splitext(image)[0])

        resize_image(image, out_path, sizes)