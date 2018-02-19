
# Find esp8266 SDK delivered programs
set(xtensa_bin_path ${ESP8266_PATH}/tools/xtensa-lx106-elf-gcc/1.20.0-26-gb404fb9-2/bin)
#set(xtensa_bin_path ${ESP8266_PATH}/tools/xtensa-lx106-elf-gcc/1.20.0-26-gb404fb9-2/xtensa-lx106-elf/bin)
find_program(ESP8266_GCC NAMES xtensa-lx106-elf-gcc PATHS ${xtensa_bin_path} NO_DEFAULT_PATH)
find_program(ESP8266_CXX NAMES xtensa-lx106-elf-g++ PATHS ${xtensa_bin_path} NO_DEFAULT_PATH)
find_program(ESP8266_OBJCOPY NAMES xtensa-lx106-elf-objcopy PATHS ${xtensa_bin_path} NO_DEFAULT_PATH)
find_program(ESP8266_OBJDUMP NAMES xtensa-lx106-elf-objdump PATHS ${xtensa_bin_path} NO_DEFAULT_PATH)
find_program(ESP8266_RANLIB NAMES xtensa-lx106-elf-ranlib PATHS ${xtensa_bin_path} NO_DEFAULT_PATH)
find_program(ESP8266_LD NAMES xtensa-lx106-elf-ld PATHS ${xtensa_bin_path} NO_DEFAULT_PATH)

# Compiler suite specification
set(CMAKE_ASM_COMPILER ${ESP8266_GCC})
set(CMAKE_C_COMPILER ${ESP8266_GCC})
set(CMAKE_CXX_COMPILER ${ESP8266_CXX})
set(CMAKE_OBJCOPY ${ESP8266_OBJCOPY})
set(CMAKE_OBJDUMP ${ESP8266_OBJDUMP})
set(CMAKE_RANLIB ${ESP8266_RANLIB})
set(CMAKE_LINKER ${ESP8266_LD})
