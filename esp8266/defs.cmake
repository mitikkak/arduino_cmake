
add_definitions(-D__ets__ -DICACHE_FLASH -U__STRICT_ANSI__ -ffunction-sections -fdata-sections -MMD)  
add_definitions(-DF_CPU=80000000L -DLWIP_OPEN_SRC -DTCP_MSS=536 -DARDUINO=10800 -DARDUINO_ESP8266_GENERIC -DARDUINO_ARCH_ESP8266 -DARDUINO_BOARD="ESP8266_GENERIC" -DESP8266)
set(compiler_set_1 -c -w -Os -g -Wpointer-arith -Wno-implicit-function-declaration -Wl,-EL -fno-inline-functions -nostdlib -mlongcalls -mtext-section-literals -falign-functions=4 -std=gnu99)
set(compiler_set_2 -c -w -Os -g -mlongcalls -mtext-section-literals -fno-exceptions -fno-rtti -falign-functions=4 -std=c++11)

set(CMAKE_SHARED_LIBRARY_LINK_C_FLAGS "")   # remove -rdynamic for C
set(CMAKE_SHARED_LIBRARY_LINK_CXX_FLAGS "") # remove -rdynamic for CXX

set(core_libraries "libesp8266_core.a libesp8266_core_set_2.a libesp8266_core_asm.a")
set(esp8266_linker_options "-g -w -Os -nostdlib -Wl,--no-check-sections -u call_user_start -u _printf_float -u _scanf_float -Wl,-static -L${ESP8266_PATH}/hardware/esp8266/2.4.0/tools/sdk/lib -L${ESP8266_PATH}/hardware/esp8266/2.4.0/tools/sdk/ld -L${ESP8266_PATH}/hardware/esp8266/2.4.0/tools/sdk/libc/xtensa-lx106-elf/lib -Teagle.flash.512k0.ld -Wl,--gc-sections -Wl,-wrap,system_restart_local -Wl,-wrap,spi_flash_read -Wl,--start-group ${core_libraries} -lhal -lphy -lpp -lnet80211 -llwip2 -lwpa -lcrypto -lmain -lwps -laxtls -lespnow -lsmartconfig -lairkiss -lmesh -lwpa2 -lstdc++ -lm -lc -lgcc -Wl,--end-group")
