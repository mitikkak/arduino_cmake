
include(${CMAKE_CURRENT_SOURCE_DIR}/../paths.cmake)
include(${ARDUINO_CMAKE_DIR}/esp8266/tools.cmake)
include(${CMAKE_CURRENT_SOURCE_DIR}/../defs.cmake)
include(${CMAKE_CURRENT_SOURCE_DIR}/../core.cmake)

set(core_src_root ${ESP8266_PATH}/cores/esp8266)
set(lib64_path ${core_src_root}/libb64)
set(spiffs_path ${core_src_root}/spiffs)
set(umm_malloc_path ${core_src_root}/umm_malloc)
set(esp8266_core_c_sources
                         ${core_src_root}/cont_util.c
                         ${core_src_root}/core_esp8266_eboot_command.c
                         ${core_src_root}/core_esp8266_flash_utils.c
                         ${core_src_root}/core_esp8266_i2s.c
                         ${core_src_root}/core_esp8266_noniso.c
                         ${core_src_root}/core_esp8266_phy.c
                         ${core_src_root}/core_esp8266_postmortem.c
                         ${core_src_root}/core_esp8266_si2c.c
                         ${core_src_root}/core_esp8266_timer.c
                         ${core_src_root}/core_esp8266_wiring.c
                         ${core_src_root}/core_esp8266_wiring_analog.c
                         ${core_src_root}/core_esp8266_wiring_digital.c
                         ${core_src_root}/core_esp8266_wiring_pulse.c
                         ${core_src_root}/core_esp8266_wiring_pwm.c
                         ${core_src_root}/core_esp8266_wiring_shift.c
                         ${core_src_root}/heap.c
                         ${core_src_root}/libc_replacements.c
                         ${core_src_root}/sntp-lwip2.c
                         ${core_src_root}/time.c
                         ${core_src_root}/uart.c
                         ${lib64_path}/cdecode.c
                         ${lib64_path}/cencode.c
                         ${spiffs_path}/spiffs_cache.c
                         ${spiffs_path}/spiffs_check.c
                         ${spiffs_path}/spiffs_gc.c
                         ${spiffs_path}/spiffs_hydrogen.c
                         ${spiffs_path}/spiffs_nucleus.c
                         ${umm_malloc_path}/umm_malloc.c
)
set(esp8266_core_cpp_sources
                         ${core_src_root}/Esp.cpp
                         ${core_src_root}/FS.cpp
                         ${core_src_root}/FunctionalInterrupt.cpp
                         ${core_src_root}/HardwareSerial.cpp
                         ${core_src_root}/IPAddress.cpp
                         ${core_src_root}/MD5Builder.cpp
                         ${core_src_root}/Print.cpp
                         ${core_src_root}/Schedule.cpp
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
                         ${core_src_root}/pgmspace.cpp
                         ${core_src_root}/spiffs_api.cpp
                         ${core_src_root}/spiffs_hal.cpp
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

SET(CMAKE_C_ARCHIVE_CREATE "${ESP8266_AR} cru <TARGET> <LINK_FLAGS> <OBJECTS>")
add_library(${esp8266_core_c_lib} STATIC ${esp8266_core_c_sources})
set_target_properties(
  ${esp8266_core_c_lib} PROPERTIES
  ARCHIVE_OUTPUT_DIRECTORY ${core_output_folder}
)
SET(CMAKE_CXX_ARCHIVE_CREATE "${ESP8266_AR} cru <TARGET> <LINK_FLAGS> <OBJECTS>")
add_library(${esp8266_core_cpp_lib} STATIC ${esp8266_core_cpp_sources})
set_target_properties(
  ${esp8266_core_cpp_lib} PROPERTIES
  ARCHIVE_OUTPUT_DIRECTORY ${core_output_folder}
)

target_compile_options(
    ${esp8266_core_c_lib} PRIVATE
    ${compiler_set_c}
    ${esp8266_generic_defs}
)
target_include_directories(
    ${esp8266_core_c_lib} PRIVATE
	${esp8266_generic_path}
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

add_library(${esp8266_12e_core_c_lib} STATIC ${esp8266_core_c_sources})
set_target_properties(
  ${esp8266_12e_core_c_lib} PROPERTIES
  ARCHIVE_OUTPUT_DIRECTORY ${core_output_folder}
)
add_library(${esp8266_12e_core_cpp_lib} STATIC ${esp8266_core_cpp_sources})
set_target_properties(
  ${esp8266_12e_core_cpp_lib} PROPERTIES
  ARCHIVE_OUTPUT_DIRECTORY ${core_output_folder}
)

target_compile_options(
    ${esp8266_12e_core_c_lib} PRIVATE
    ${compiler_set_c}
    ${esp8266_12e_defs}
)
target_include_directories(
    ${esp8266_12e_core_c_lib} PRIVATE
	${esp8266_12e_path}
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
