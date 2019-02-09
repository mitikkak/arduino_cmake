
include(${ARDUINO_CMAKE_DIR}/esp32/paths.cmake)
include(${ARDUINO_CMAKE_DIR}/esp32/tools.cmake)
include(${ARDUINO_CMAKE_DIR}/esp32/core.cmake)

set(esp32_core_c_sources 
    ${esp32_core_path}/esp32-hal-ledc.c
    ${esp32_core_path}/esp32-hal-i2c.c
    ${esp32_core_path}/esp32-hal-uart.c
    ${esp32_core_path}/esp32-hal-gpio.c
    ${esp32_core_path}/esp32-hal-dac.c
    ${esp32_core_path}/esp32-hal-bt.c
    ${esp32_core_path}/wiring_pulse.c
    ${esp32_core_path}/esp32-hal-touch.c
    ${esp32_core_path}/libb64/cdecode.c
    ${esp32_core_path}/libb64/cencode.c
    ${esp32_core_path}/esp32-hal-psram.c
    ${esp32_core_path}/wiring_shift.c
    ${esp32_core_path}/esp32-hal-timer.c
    ${esp32_core_path}/stdlib_noniso.c
    ${esp32_core_path}/esp32-hal-adc.c
    ${esp32_core_path}/esp32-hal-misc.c
    ${esp32_core_path}/esp32-hal-matrix.c
    ${esp32_core_path}/esp32-hal-spi.c
    ${esp32_core_path}/esp32-hal-time.c
    ${esp32_core_path}/esp32-hal-sigmadelta.c
)
set(esp32_core_cpp_sources
    ${esp32_core_path}/StreamString.cpp
    ${esp32_core_path}/Print.cpp
    ${esp32_core_path}/cbuf.cpp
    ${esp32_core_path}/MD5Builder.cpp
    ${esp32_core_path}/main.cpp
    ${esp32_core_path}/HardwareSerial.cpp
    ${esp32_core_path}/IPAddress.cpp
    ${esp32_core_path}/Esp.cpp
    ${esp32_core_path}/Stream.cpp
    ${esp32_core_path}/WMath.cpp
    ${esp32_core_path}/base64.cpp
    ${esp32_core_path}/IPv6Address.cpp
    ${esp32_core_path}/WString.cpp
)

#SET(CMAKE_C_ARCHIVE_CREATE "${ESP32_AR} cru <TARGET> <LINK_FLAGS> <OBJECTS>")
add_library(${esp32_core_c_lib} STATIC ${esp32_core_c_sources})
target_include_directories(
    ${esp32_core_c_lib} PRIVATE
    ${esp32_sdk_paths}
    ${esp32_core_path}
    ${wroom32_pins_path}
)

set_target_properties(
  ${esp32_core_c_lib} PROPERTIES
  ARCHIVE_OUTPUT_DIRECTORY ${core_output_folder}
)