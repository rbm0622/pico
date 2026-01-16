from neopixel import Neopixel
import utime

numpix = 110
strip = Neopixel(numpix, 0, 0, "RGB")

# Define the colors you want to use
red = (255, 0, 0)
green = (0, 255, 0)
blue = (0, 0, 255)
yellow = (255, 255, 0)
white = (255, 255, 255)
off = (0, 0, 0)

# Set brightness
strip.brightness(42)

# Set individual LEDs to specific colors
strip.set_pixel(0, white)    # Set the first LED to red
strip.set_pixel(1, white)  # Set the second LED to green
strip.set_pixel(2, off)   # Set the third LED to blue
strip.set_pixel(3, white) # Set the fourth LED to yellow
strip.set_pixel(4, white)    # Set the fifth LED to off
strip.set_pixel(5, off)    # Sets sixth LED to off
strip.set_pixel(6, off)    # Sets seventh LED to off
strip.set_pixel(7, off)    # Sets eighth LED to off
strip.set_pixel(8, off)    # Sets ninth LED to off
strip.set_pixel(9, off)    # Sets tenth LED to off

# Update the LED strip to reflect changes
strip.show()

    