
message(ESP8266_PATH: ${ESP8266_PATH})
if(${ESP8266_PATH} MATCHES .*arduino.*)
   message("esp8266 path found at:" ${ESP8266_PATH})
else()
   message("setting esp8266 path from env variable ...")
   set(ESP8266_PATH $ENV{ESP8266_PATH} CACHE STRING "")
endif()

if(${ESP8266_PATH} MATCHES .*arduino.*)
   message("esp8266 path found at:" ${ESP8266_PATH})
else()
   message(FATAL_ERROR "ESP8266_PATH environment variable missing! It should point to root of arduino installation, for example /home/your_name/arduino-1.6.12/")
endif()

set(esp8266_version_root ${ESP8266_PATH})
set(esp8266_generic_path ${esp8266_version_root}/variants/generic)
set(esp8266_12e_path ${esp8266_version_root}/variants/nodemcu)

include_directories(${esp8266_version_root}/tools/sdk/include
                    ${esp8266_version_root}/tools/sdk/lwip2/include
                    ${esp8266_version_root}/tools/sdk/libc/xtensa-lx106-elf/include
                    ${esp8266_version_root}/cores/esp8266
)

include_directories(${ESP8266_PATH}/tools/xtensa-lx106-elf-gcc/1.20.0-26-gb404fb9-2/xtensa-lx106-elf/include/c++/4.8.2
                    ${ESP8266_PATH}/tools/xtensa-lx106-elf-gcc/1.20.0-26-gb404fb9-2/xtensa-lx106-elf/include/c++/4.8.2/xtensa-lx106-elf
)

set(esp8266_libraries ${esp8266_version_root}/libraries)
set(SDFAT_ESP8266_DIR ${esp8266_libraries}/SD/src)
set(SPI_ESP8266_DIR ${esp8266_libraries}/SPI)
set(WIRE_ESP8266_DIR ${esp8266_libraries}/Wire)
set(WIFI_ESP8266_DIR ${esp8266_libraries}/ESP8266WiFi/src)
set(ARDUINO_OTA_DIR ${esp8266_libraries}/ArduinoOTA)
set(WEB_SERVER_ESP8266_DIR ${esp8266_libraries}/ESP8266WebServer/src)
set(MDNS_ESP8266_DIR ${esp8266_libraries}/ESP8266mDNS)
set(HASH_ESP8266_DIR ${esp8266_libraries}/Hash/src)
