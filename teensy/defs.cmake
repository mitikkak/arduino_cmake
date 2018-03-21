add_definitions(-D__MK20DX256__ -DTEENSYDUINO=141 -DARDUINO=10805 -DF_CPU=96000000 -DUSB_SERIAL -DLAYOUT_US_ENGLISH)
set(teensy_compiler_set_cpp -c -O2 -g -Wall -ffunction-sections -fdata-sections -nostdlib -MMD -fno-exceptions -felide-constructors -std=gnu++11 -fno-rtti -mthumb -mcpu=cortex-m4 -fsingle-precision-constant)
set(teensy_compiler_set_c -c -O2 -g -Wall -ffunction-sections -fdata-sections -nostdlib -MMD  -mthumb -mcpu=cortex-m4 -fsingle-precision-constant)
set(teensy_compiler_set_asm -c -O2 -g -Wall -ffunction-sections -fdata-sections -nostdlib -MMD -x assembler-with-cpp -mthumb -mcpu=cortex-m4 -fsingle-precision-constant)

set(CMAKE_EXE_LINKER_FLAGS "-O2 -Wl,--gc-sections,--relax,--defsym=__rtc_localtime=1518623802 -T${TEENSY_PATH}/avr/cores/teensy3/mk20dx256.ld -mthumb -mcpu=cortex-m4 -fsingle-precision-constant -larm_cortexM4l_math -lm")


set(CMAKE_SHARED_LIBRARY_LINK_C_FLAGS "")   # remove -rdynamic for C
set(CMAKE_SHARED_LIBRARY_LINK_CXX_FLAGS "") # remove -rdynamic for CXX
