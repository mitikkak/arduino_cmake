
message(ARDUINO_PATH: ${ARDUINO_PATH})
if(${ARDUINO_PATH} MATCHES .*arduino.*)
   message("arduino path found at:" ${ARDUINO_PATH})
else()
   message("setting arduino path from env variable ...")
   set(ARDUINO_PATH $ENV{ARDUINO_PATH} CACHE STRING "")
endif()

if(${ARDUINO_PATH} MATCHES .*arduino.*)
   message("arduino path found at:" ${ARDUINO_PATH})
else()
   message(FATAL_ERROR "ARDUINO_PATH environment variable missing! It should point to root of arduino installation, for example /home/your_name/arduino-1.6.12/")
endif()

message(ARDUINO_LIB_PATH: ${ARDUINO_LIB_PATH})
if(${ARDUINO_LIB_PATH} MATCHES .*libraries.*)
   message("arduino library path found at:" ${ARDUINO_LIB_PATH})
else()
   message("setting arduino library path from env variable ...")
   set(ARDUINO_LIB_PATH $ENV{ARDUINO_LIB_PATH} CACHE STRING "")
endif()

if(${ARDUINO_LIB_PATH} MATCHES .*libraries.*)
   message("arduino library path found at:" ${ARDUINO_LIB_PATH})
else()
   message(FATAL_ERROR "ARDUINO_LIB_PATH environment variable missing! It should point to your arduino library root, for example /home/your_name/Arduino/libraries/")
endif()

set(ARDUINO_PINS ${ARDUINO_PATH}/hardware/arduino/avr/variants/standard)
set(ARDUINO_WIRE_SRC ${ARDUINO_PATH}/hardware/arduino/avr/libraries/Wire/src/)
set(ARDUINO_SPI_SRC ${ARDUINO_PATH}/hardware/arduino/avr/libraries/SPI/src/)
set(ARDUINO_TIMERONE_SRC ${ARDUINO_LIB_PATH}/TimerOne/)
