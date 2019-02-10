
set(xtensa_bin_path ${ESP32_PATH}/tools/xtensa-esp32-elf-gcc/1.22.0-80-g6c4433a-5.2.0/bin)

find_program(ESP32_GCC NAMES xtensa-esp32-elf-gcc PATHS ${xtensa_bin_path} NO_DEFAULT_PATH)
find_program(ESP32_CXX NAMES xtensa-esp32-elf-g++ PATHS ${xtensa_bin_path} NO_DEFAULT_PATH)
find_program(ESP32_AR NAMES xtensa-esp32-elf-ar PATHS ${xtensa_bin_path} NO_DEFAULT_PATH)

set(CMAKE_C_COMPILER ${ESP32_GCC})
set(CMAKE_CXX_COMPILER ${ESP32_CXX})