
set(libs_path  ${TEENSY_PATH}/avr/libraries)

set(TEENSY_WIRE_SRC ${libs_path}/Wire)
set(TEENSY_SPI_SRC  ${libs_path}/SPI)
set(TEENSY_LCD_SRC  ${libs_path}/LiquidCrystal)

set(teensy_libs_sources ${TEENSY_WIRE_SRC}/Wire.cpp
                        ${TEENSY_LCD_SRC}/LiquidCrystal.cpp
)
add_library(teensy_libs STATIC ${teensy_libs_sources})
target_compile_options(
    teensy_libs PRIVATE
    ${teensy_compiler_set_cpp}
)