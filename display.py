# display.py

from neopixel import Neopixel

NUM_PIXELS = 110
ROWS = 10
COLS = 11

WHITE = (255, 255, 255)
OFF = (0, 0, 0)

strip = Neopixel(NUM_PIXELS, 0, 0, "RGB")
strip.brightness(42)


def rc_to_index(row, col):
    return row * COLS + col


def clear():
    for i in range(NUM_PIXELS):
        strip.set_pixel(i, OFF)


def light_word(word_coords, color=WHITE):
    for r, c in word_coords:
        strip.set_pixel(rc_to_index(r, c), color)


def show():
    strip.show()
