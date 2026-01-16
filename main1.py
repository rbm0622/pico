# main.py

import utime
from words import WORDS
from clock_logic import time_to_words
from display import clear, light_word, show

def show_time(hour, minute):
    clear()
    for word in time_to_words(hour, minute):
        light_word(WORDS[word])
    show()


# -----------------------
# Demo loop (replace with RTC later)
# -----------------------
while True:
    now = utime.localtime()
    hour = now[3]
#    minute = now[4]
    minute = 15

    show_time(hour, minute)
    print ("Time: ")
    print (now)
    print ("Hour: ")
    print (hour)
    print ("minute: ")
    print (minute)
    utime.sleep(30)
