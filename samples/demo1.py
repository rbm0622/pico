from neopixel import Neopixel
import utime

numpix = 10
strip = Neopixel(numpix, 0, 0, "GRB")
color = (255, 0, 0)  
strip.brightness(42)

# Main loop
while True:
    strip.fill(color)  
    strip.show()       