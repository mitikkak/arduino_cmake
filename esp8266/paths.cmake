
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

include_directories(${ESP8266_PATH}/hardware/esp8266/2.4.0/tools/sdk/include
                    ${ESP8266_PATH}/hardware/esp8266/2.4.0/tools/sdk/lwip2/include
                    ${ESP8266_PATH}/hardware/esp8266/2.4.0/tools/sdk/libc/xtensa-lx106-elf/include
                    ${ESP8266_PATH}/hardware/esp8266/2.4.0/cores/esp8266
                    ${ESP8266_PATH}/hardware/esp8266/2.4.0/variants/generic
)

include_directories(${ESP8266_PATH}/tools/xtensa-lx106-elf-gcc/1.20.0-26-gb404fb9-2/xtensa-lx106-elf/include/c++/4.8.2
                    ${ESP8266_PATH}/tools/xtensa-lx106-elf-gcc/1.20.0-26-gb404fb9-2/xtensa-lx106-elf/include/c++/4.8.2/xtensa-lx106-elf
)
