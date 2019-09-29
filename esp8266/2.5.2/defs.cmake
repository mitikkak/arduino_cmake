
set(esp8266_common_defs -D__ets__ -DICACHE_FLASH -U__STRICT_ANSI__ -ffunction-sections -fdata-sections -MMD -DNONOSDK221=1 -DF_CPU=80000000L -DLWIP_FEATURES=1 -DLWIP_IPV6=0 -DLWIP_OPEN_SRC -DTCP_MSS=536 -DARDUINO=10605 -DARDUINO_ARCH_ESP8266 -DESP8266)
set(esp8266_generic_defs ${esp8266_common_defs} -DARDUINO_ESP8266_GENERIC -DARDUINO_BOARD=\"ESP8266_GENERIC\" -DFLASHMODE_DOUT)
set(esp8266_assembler_defs -g -x assembler-with-cpp)
set(esp8266_12e_defs ${esp8266_common_defs} -DARDUINO_ESP8266_NODEMCU -DARDUINO_BOARD="ESP8266_NODEMCU" -DFLASH_MODE_DIO)
set(compiler_set_c -c -w -Os -g -Wpointer-arith -Wno-implicit-function-declaration -Wl,-EL -fno-inline-functions -nostdlib -mlongcalls -mtext-section-literals -falign-functions=4 -std=gnu99)
set(compiler_set_cpp -c -w -Os -g -mlongcalls -mtext-section-literals -fno-exceptions -fno-rtti -falign-functions=4 -std=c++11)

set(CMAKE_SHARED_LIBRARY_LINK_C_FLAGS "")   # remove -rdynamic for C
set(CMAKE_SHARED_LIBRARY_LINK_CXX_FLAGS "") # remove -rdynamic for CXX

include(${ARDUINO_CMAKE_DIR}/esp8266/${ARDUINO_VERSION}/core.cmake)
set(core_libraries "${core_output_folder}/lib${esp8266_core_cpp_lib}.a ${core_output_folder}/lib${esp8266_core_asm_lib}.a")
set(core_12e_libraries "${core_output_folder}/lib${esp8266_12e_core_cpp_lib}.a ${core_output_folder}/lib${esp8266_12e_core_asm_lib}.a")
set(esp8266_sdk_libs -lhal -lphy -lpp -lnet80211 -llwip2-536-feat -lwpa -lcrypto -lmain -lwps -laxtls -lbearssl -lespnow -lsmartconfig -lairkiss -lwpa2 -lstdc++ -lm -lc -lgcc)
set(esp8266_linker_options "-fno-exceptions -Wl,-Map -Wl,${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}.map -g -w -Os -nostdlib -Wl,--no-check-sections -u app_entry -u _printf_float -u _scanf_float -Wl,-static -L${ESP8266_PATH}/tools/sdk/lib -L${ESP8266_PATH}/tools/sdk/ld -L${ESP8266_PATH}/tools/sdk/lib/NONOSDK221 -L${ESP8266_PATH}/tools/sdk/libc/xtensa-lx106-elf/lib -Teagle.flash.512k.ld -Wl,--gc-sections -Wl,-wrap,system_restart_local -Wl,-wrap,spi_flash_read -Wl,--start-group ${core_libraries} ${esp8266_sdk_libs} -Wl,--end-group")
set(esp8266_12e_linker_options "-fno-exceptions -Wl,-Map -Wl,${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}.map -g -w -Os -nostdlib -Wl,--no-check-sections -u app_entry -u _printf_float -u _scanf_float -Wl,-static -L${ESP8266_PATH}/tools/sdk/lib -L${ESP8266_PATH}/tools/sdk/ld -L${ESP8266_PATH}/tools/sdk/lib/NONOSDK221 -L${ESP8266_PATH}/tools/sdk/libc/xtensa-lx106-elf/lib -Teagle.flash.4m1m.ld -Wl,--gc-sections -Wl,-wrap,system_restart_local -Wl,-wrap,spi_flash_read -Wl,--start-group ${core_12e_libraries} ${esp8266_sdk_libs} -Wl,--end-group")

set(wifi_credentials -DMY_SSID="${SSID}" -DMY_WIFI_PASSWD="${WIFI_PASSWD}")
