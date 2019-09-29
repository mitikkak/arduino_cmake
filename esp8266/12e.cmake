include(${ARDUINO_CMAKE_DIR}/esp8266/arduino_version.cmake)
include(${ARDUINO_CMAKE_DIR}/esp8266/${ARDUINO_VERSION}/paths.cmake)
include(${ARDUINO_CMAKE_DIR}/esp8266/${ARDUINO_VERSION}/libs.cmake)
include(${ARDUINO_CMAKE_DIR}/esp8266/tools.cmake)
include(${ARDUINO_CMAKE_DIR}/esp8266/${ARDUINO_VERSION}/defs.cmake)
include(${ARDUINO_CMAKE_DIR}/esp8266/${ARDUINO_VERSION}/deploy.cmake)
include(${ARDUINO_CMAKE_DIR}/esp8266/${ARDUINO_VERSION}/eagle.cmake)
include(${ARDUINO_CMAKE_DIR}/esp8266/env/wifi.cmake)

function(build_targets_esp8266_12e sources_to_build external_include_dirs)
#message("Project: " ${PROJECT_NAME} " ext_sources:" ${ext_sources} " external_include_dirs:" ${external_include_dirs})
add_executable(${PROJECT_NAME} ${sources_to_build} ${eagle_output})
target_link_libraries(${PROJECT_NAME} PRIVATE ${esp8266_12e_linker_options})
add_dependencies(${PROJECT_NAME} ${esp8266_12e_core_libs})
target_compile_options(
    ${PROJECT_NAME} PRIVATE
    ${compiler_set_cpp}
    ${esp8266_12e_defs}
    ${wifi_credentials}
)
target_include_directories(
    ${PROJECT_NAME} PRIVATE
    ${external_include_dirs}
    ${esp8266_12e_path}
)

elf_to_bin_esp8266_12e(${PROJECT_NAME})
upload_esp8266_12e(${PROJECT_NAME} elf_to_bin_esp8266_12e_${PROJECT_NAME})
endfunction(build_targets_esp8266_12e)
