
add_definitions(-D__ets__ -DICACHE_FLASH -U__STRICT_ANSI__ -c -w -Os -g -mlongcalls -mtext-section-literals -fno-exceptions -fno-rtti -falign-functions=4 -std=c++11  -ffunction-sections -fdata-sections -w -x c++ -E -CC -DF_CPU=80000000L -DLWIP_OPEN_SRC -DTCP_MSS=536   -DARDUINO=10800 -DARDUINO_ESP8266_GENERIC -DARDUINO_ARCH_ESP8266 -DARDUINO_BOARD="ESP8266_GENERIC"  -DESP8266)
enable_language(ASM)
add_definitions(-g -x assembler-with-cpp)