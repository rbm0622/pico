from neopixel import Neopixel
import utime

# -----------------------
# NeoPixel configuration
# -----------------------
NUM_PIXELS = 110
ROWS = 10
COLS = 11

strip = Neopixel(NUM_PIXELS, 0, 0, "RGB")
strip.brightness(42)

# -----------------------
# Colors
# -----------------------
WHITE = (255, 255, 255)
OFF = (0, 0, 0)

# -----------------------
# Helpers
# -----------------------
def rc_to_index(row, col):
    """Convert row/column to NeoPixel index"""
    return row * COLS + col

def clear():
    for i in range(NUM_PIXELS):
        strip.set_pixel(i, OFF)
    strip.show()

def light_word(coords, color=WHITE):
    """Light a word given a list of (row, col) tuples"""
    for (r, c) in coords:
        strip.set_pixel(rc_to_index(r, c), color)

# -----------------------
# Word definitions
# -----------------------
WORDS = {
    "IT": [(0,0), (0,1)],
    "IS": [(0,3), (0,4)],
    "A": [(0,7)],

    "QUARTER": [(1,2), (1,3), (1,4), (1,5), (1,6), (1,7), (1,8)],
    "TWENTY_M": [(2,0), (2,1), (2,2), (2,3), (2,4), (2,5)],
    "FIVE_M": [(2,6), (2,7), (2,8), (2,9)],
    "HALF": [(3,0), (3,1), (3,2), (3,3)],
    "TEN_M": [(3,5), (3,6), (3,7)],
    "TO": [(3,9), (3,10)],
    "PAST": [(4,0), (4,1), (4,2), (4,3)],

    "NINE": [(4,7), (4,8), (4,9), (4,10)],
    "ONE": [(5,0), (5,1), (5,2)],
    "SIX": [(5,3), (5,4), (5,5)],
    "THREE": [(5,7), (5,8), (5,9), (5,10)],

    "FOUR": [(6,0), (6,1), (6,2), (6,3)],
    "FIVE_H": [(6,4), (6,5), (6,6), (6,7)],
    "TWO": [(6,8), (6,9), (6,10)],

    "EIGHT": [(7,0), (7,1), (7,2), (7,3), (7,4)],
    "ELEVEN": [(7,5), (7,6), (7,7), (7,8), (7,9), (7,10)],

    "SEVEN": [(8,0), (8,1), (8,2), (8,3), (8,4)],
    "TWELVE": [(8,5), (8,6), (8,7), (8,8), (8,9), (8,10)],

    "TEN_H": [(9,0), (9,1), (9,2)],
    "OCLOCK": [(9,5), (9,6), (9,7), (9,8), (9,9), (9,10)]
}

# -----------------------
# Demo display
# Example: "IT IS A QUARTER PAST THREE"
# -----------------------
clear()

# light_word(WORDS["IT"])
# light_word(WORDS["IS"])
# light_word(WORDS["A"])
# light_word(WORDS["QUARTER"])
# light_word(WORDS["PAST"])
# light_word(WORDS["THREE"])

light_word(WORDS["IT"])
light_word(WORDS["IS"])
light_word(WORDS["TEN_M"])
light_word(WORDS["OCLOCK"])

strip.show()

# Keep lit
while True:
    utime.sleep(1)
