
message(TEENSY_PATH: ${TEENSY_PATH})
if(${TEENSY_PATH} MATCHES .*arduino.*)
   message("TEENSY path found at:" ${TEENSY_PATH})
else()
   message("setting TEENSY path from env variable ...")
   set(TEENSY_PATH $ENV{TEENSY_PATH} CACHE STRING "")
endif()

if(${TEENSY_PATH} MATCHES .*arduino.*)
   message("TEENSY path found at:" ${TEENSY_PATH})
else()
   message(FATAL_ERROR "TEENSY_PATH environment variable missing! It should point to root of arduino installation, for example /home/your_name/arduino-1.6.12/")
endif()

include_directories(
                     ${TEENSY_PATH}/avr/cores/teensy3
                     
#                    ${TEENSY_PATH}/hardware/TEENSY/2.4.0/tools/sdk/lwip2/include
#                    ${TEENSY_PATH}/hardware/TEENSY/2.4.0/tools/sdk/libc/xtensa-lx106-elf/include
#                    ${TEENSY_PATH}/hardware/TEENSY/2.4.0/cores/TEENSY
#                    ${TEENSY_PATH}/hardware/TEENSY/2.4.0/variants/generic
)

