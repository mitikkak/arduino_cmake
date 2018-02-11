
set(core_path  ${ESP8266_PATH}/hardware/esp8266/2.4.0/cores/esp8266)
set(lib64_path ${core_path}/libb64)
set(spiffs_path ${core_path}/spiffs)
set(umm_malloc_path ${core_path}/umm_malloc)
set(esp8266_core_sources
                         ${core_path}/cont_util.c
                         ${core_path}/core_esp8266_eboot_command.c
                         ${core_path}/core_esp8266_flash_utils.c
                         ${core_path}/core_esp8266_i2s.c
                         ${core_path}/core_esp8266_noniso.c
                         ${core_path}/core_esp8266_phy.c
                         ${core_path}/core_esp8266_postmortem.c
                         ${core_path}/core_esp8266_si2c.c
                         ${core_path}/core_esp8266_timer.c
                         ${core_path}/core_esp8266_wiring.c
                         ${core_path}/core_esp8266_wiring_analog.c
                         ${core_path}/core_esp8266_wiring_digital.c
                         ${core_path}/core_esp8266_wiring_pulse.c
                         ${core_path}/core_esp8266_wiring_pwm.c
                         ${core_path}/core_esp8266_wiring_shift.c
                         ${core_path}/heap.c
                         ${core_path}/libc_replacements.c
                         ${core_path}/sntp-lwip2.c
                         ${core_path}/time.c
                         ${core_path}/uart.c
                         ${lib64_path}/cdecode.c
                         ${lib64_path}/cencode.c
                         ${spiffs_path}/spiffs_cache.c
                         ${spiffs_path}/spiffs_check.c
                         ${spiffs_path}/spiffs_gc.c
                         ${spiffs_path}/spiffs_hydrogen.c
                         ${spiffs_path}/spiffs_nucleus.c
                         ${umm_malloc_path}/umm_malloc.c
                         ${core_path}/Esp.cpp
                         ${core_path}/FS.cpp
                         ${core_path}/FunctionalInterrupt.cpp
                         ${core_path}/HardwareSerial.cpp
                         ${core_path}/IPAddress.cpp
                         ${core_path}/MD5Builder.cpp
                         ${core_path}/Print.cpp
                         ${core_path}/Schedule.cpp
                         ${core_path}/Stream.cpp
                         ${core_path}/StreamString.cpp
                         ${core_path}/Tone.cpp
                         ${core_path}/Updater.cpp
                         ${core_path}/WMath.cpp
                         ${core_path}/WString.cpp
                         ${core_path}/abi.cpp
                         ${core_path}/base64.cpp
                         ${core_path}/cbuf.cpp
                         ${core_path}/core_esp8266_main.cpp
                         ${core_path}/debug.cpp
                         ${core_path}/pgmspace.cpp
                         ${core_path}/spiffs_api.cpp
                         ${core_path}/spiffs_hal.cpp
)
set(esp8266_core_asm_sources
    ${core_path}/cont.S
)

enable_language(ASM)
add_library(esp8266_core_asm ${esp8266_core_asm_sources})
target_compile_options(
    esp8266_core_asm PRIVATE
    -g -x assembler-with-cpp
)

add_library(esp8266_core ${esp8266_core_sources})
target_link_libraries(esp8266_core esp8266_core_asm)

