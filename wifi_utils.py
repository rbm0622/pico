import network
import time
import ntptime
import json

def load_config():
    """Reads the configuration from the text file."""
    try:
        with open("config.txt", "r") as f:
            return json.load(f)
    except Exception as e:
        print("Could not read config.txt:", e)
        return None

def connect():
    config = load_config()
    if not config:
        return
        
    wlan = network.WLAN(network.STA_IF)
    wlan.active(True)
    wlan.connect(config['ssid'], config['password'])
    
    print(f"Connecting to {config['ssid']}...")
    
    # Wait for connection
    timeout = 10
    while timeout > 0:
        if wlan.status() >= 3:
            break
        timeout -= 1
        time.sleep(1)
        
    if wlan.status() == 3:
        print(f"Connected! IP: {wlan.ifconfig()[0]}")
    else:
        print("Failed to connect.")

def sync_time():
    try:
        ntptime.settime()
        print("Time synced via NTP.")
    except:
        print("NTP sync failed.")

def get_time_string():
    t = time.localtime()
    return f"{t[0]}-{t[1]:02d}-{t[2]:02d} {t[3]:02d}:{t[4]:02d}:{t[5]:02d}"