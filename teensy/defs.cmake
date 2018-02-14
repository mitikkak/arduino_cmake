add_definitions(-D__MK20DX256__ -DTEENSYDUINO=134 -DARDUINO=10800 -DF_CPU=72000000 -DUSB_SERIAL -DLAYOUT_US_ENGLISH)
set(teensy_compiler_set_cpp -c -O2 -g -Wall -ffunction-sections -fdata-sections -nostdlib -MMD -fno-exceptions -felide-constructors -std=gnu++0x -fno-rtti -mthumb -mcpu=cortex-m4 -fsingle-precision-constant)
set(teensy_compiler_set_c -c -O2 -g -Wall -ffunction-sections -fdata-sections -nostdlib -MMD  -mthumb -mcpu=cortex-m4 -fsingle-precision-constant)
set(teensy_compiler_set_asm -c -O2 -g -Wall -ffunction-sections -fdata-sections -nostdlib -MMD -x assembler-with-cpp -mthumb -mcpu=cortex-m4 -fsingle-precision-constant)

set(CMAKE_SHARED_LIBRARY_LINK_C_FLAGS "")   # remove -rdynamic for C
set(CMAKE_SHARED_LIBRARY_LINK_CXX_FLAGS "") # remove -rdynamic for CXX
