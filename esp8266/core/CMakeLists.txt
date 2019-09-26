
include(${ARDUINO_CMAKE_DIR}/esp8266/paths.cmake)
include(${ARDUINO_CMAKE_DIR}/esp8266/tools.cmake)
include(${ARDUINO_CMAKE_DIR}/esp8266/defs.cmake)
include(${ARDUINO_CMAKE_DIR}/esp8266/core.cmake)

set(core_src_root ${ESP8266_PATH}/cores/esp8266)
set(lib64_path ${core_src_root}/libb64)
set(spiffs_path ${core_src_root}/spiffs)
set(umm_malloc_path ${core_src_root}/umm_malloc)
set(esp8266_core_cpp_sources
                         ${core_src_root}/cont_util.cpp
                         ${core_src_root}/core_esp8266_app_entry_noextra4k.cpp
                         ${core_src_root}/core_esp8266_eboot_command.cpp
                         ${core_src_root}/core_esp8266_flash_utils.cpp
                         ${core_src_root}/core_esp8266_i2s.cpp
                         ${core_src_root}/core_esp8266_noniso.cpp
                         ${core_src_root}/core_esp8266_phy.cpp
                         ${core_src_root}/core_esp8266_postmortem.cpp
                         ${core_src_root}/core_esp8266_si2c.cpp
                         ${core_src_root}/core_esp8266_sigma_delta.cpp
                         ${core_src_root}/core_esp8266_timer.cpp
                         ${core_src_root}/core_esp8266_wiring.cpp
                         ${core_src_root}/core_esp8266_wiring_analog.cpp
                         ${core_src_root}/core_esp8266_wiring_digital.cpp
                         ${core_src_root}/core_esp8266_wiring_pulse.cpp
                         ${core_src_root}/core_esp8266_wiring_pwm.cpp
                         ${core_src_root}/core_esp8266_wiring_shift.cpp
                         ${core_src_root}/core_esp8266_waveform.cpp
                         ${core_src_root}/heap.cpp
                         ${core_src_root}/libc_replacements.cpp
                         ${core_src_root}/sntp-lwip2.cpp
                         ${core_src_root}/time.cpp
                         ${core_src_root}/uart.cpp
                         ${core_src_root}/Esp.cpp
                         ${core_src_root}/Esp-frag.cpp
                         ${core_src_root}/Esp-version.cpp
                         ${core_src_root}/FS.cpp
                         ${core_src_root}/FunctionalInterrupt.cpp
                         ${core_src_root}/HardwareSerial.cpp
                         ${core_src_root}/IPAddress.cpp
                         ${core_src_root}/MD5Builder.cpp
                         ${core_src_root}/Print.cpp
                         ${core_src_root}/Schedule.cpp
                         ${core_src_root}/ScheduledFunctions.cpp
                         ${core_src_root}/Stream.cpp
                         ${core_src_root}/StreamString.cpp
                         ${core_src_root}/Tone.cpp
                         ${core_src_root}/Updater.cpp
                         ${core_src_root}/WMath.cpp
                         ${core_src_root}/WString.cpp
                         ${core_src_root}/abi.cpp
                         ${core_src_root}/base64.cpp
                         ${core_src_root}/cbuf.cpp
                         ${core_src_root}/core_esp8266_main.cpp
                         ${core_src_root}/debug.cpp
                         ${core_src_root}/gdb_hooks.cpp
                         ${core_src_root}/sqrt32.cpp
                         ${core_src_root}/StackThunk.cpp
                         #${core_src_root}/pgmspace.cpp
                         ${core_src_root}/spiffs_api.cpp
                         ${core_src_root}/spiffs_hal.cpp
                         ${lib64_path}/cdecode.cpp
                         ${lib64_path}/cencode.cpp
                         ${spiffs_path}/spiffs_cache.cpp
                         ${spiffs_path}/spiffs_check.cpp
                         ${spiffs_path}/spiffs_gc.cpp
                         ${spiffs_path}/spiffs_hydrogen.cpp
                         ${spiffs_path}/spiffs_nucleus.cpp
                         ${umm_malloc_path}/umm_malloc.cpp
)
set(esp8266_core_asm_sources
    ${core_src_root}/cont.S
)

enable_language(ASM)
###### ESP8266 GENERIC #######################################################
SET(CMAKE_ASM_CREATE_STATIC_LIBRARY "${ESP8266_AR} cru <TARGET> <LINK_FLAGS> <OBJECTS>")
add_library(${esp8266_core_asm_lib} STATIC ${esp8266_core_asm_sources})
target_compile_options(
    ${esp8266_core_asm_lib} PRIVATE
    ${esp8266_generic_defs}
    ${esp8266_assembler_defs}
)
target_include_directories(
    ${esp8266_core_asm_lib} PRIVATE
	${esp8266_generic_path}
)

set_target_properties(
  ${esp8266_core_asm_lib} PROPERTIES
  ARCHIVE_OUTPUT_DIRECTORY ${core_output_folder}
)

SET(CMAKE_CXX_ARCHIVE_CREATE "${ESP8266_AR} cru <TARGET> <LINK_FLAGS> <OBJECTS>")
add_library(${esp8266_core_cpp_lib} STATIC ${esp8266_core_cpp_sources})
set_target_properties(
  ${esp8266_core_cpp_lib} PROPERTIES
  ARCHIVE_OUTPUT_DIRECTORY ${core_output_folder}
)

target_compile_options(
    ${esp8266_core_cpp_lib} PRIVATE
    ${compiler_set_cpp}
    ${esp8266_generic_defs}
)
target_include_directories(
    ${esp8266_core_cpp_lib} PRIVATE
	${esp8266_generic_path}
)

###### ESP8266-12E #######################################################

add_library(${esp8266_12e_core_asm_lib} STATIC ${esp8266_core_asm_sources})
target_compile_options(
    ${esp8266_12e_core_asm_lib} PRIVATE
    ${esp8266_12e_defs}
    -g -x assembler-with-cpp
)
target_include_directories(
    ${esp8266_12e_core_asm_lib} PRIVATE
	${esp8266_12e_path}
)

set_target_properties(
  ${esp8266_12e_core_asm_lib} PROPERTIES
  ARCHIVE_OUTPUT_DIRECTORY ${core_output_folder}
)

add_library(${esp8266_12e_core_cpp_lib} STATIC ${esp8266_core_cpp_sources})
set_target_properties(
  ${esp8266_12e_core_cpp_lib} PROPERTIES
  ARCHIVE_OUTPUT_DIRECTORY ${core_output_folder}
)

target_compile_options(
    ${esp8266_12e_core_cpp_lib} PRIVATE
    ${compiler_set_cpp}
    ${esp8266_12e_defs}
)
target_include_directories(
    ${esp8266_12e_core_cpp_lib} PRIVATE
	${esp8266_generic_path}
)
