
set(xtensa_bin_path ${ESP32_PATH}/tools/xtensa-esp32-elf-gcc/1.22.0-80-g6c4433a-5.2.0/bin)

find_program(ESP32_GCC NAMES xtensa-esp32-elf-gcc PATHS ${xtensa_bin_path} NO_DEFAULT_PATH)

set(CMAKE_C_COMPILER ${ESP32_GCC})