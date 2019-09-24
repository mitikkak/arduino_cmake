# arduino_cmake
Arduino with cmake

# esp8266 sdk and toolchain
git clone https://github.com/esp8266/Arduino.git [ESP8266_ROOT]
cd [ESP8266_ROOT]
git checkout tags/2.5.2
git submodule update --init
cd tools
python get.py
