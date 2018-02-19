
set(atmega328_compiler_set_cpp -c -g -Os -w -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -MMD -flto -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10800 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR)
set(CMAKE_SHARED_LIBRARY_LINK_C_FLAGS "")   # remove -rdynamic for C
set(CMAKE_SHARED_LIBRARY_LINK_CXX_FLAGS "") # remove -rdynamic for CXX
set(atmega328_linker_options "-Os -Wl,--gc-sections -mmcu=atmega328p")
