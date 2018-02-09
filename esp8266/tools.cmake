
# Find esp8266 SDK delivered programs
set(xtensa_bin_path ${ESP8266_PATH}/tools/xtensa-lx106-elf-gcc/1.20.0-26-gb404fb9-2/bin)
#set(xtensa_bin_path ${ESP8266_PATH}/tools/xtensa-lx106-elf-gcc/1.20.0-26-gb404fb9-2/xtensa-lx106-elf/bin)
find_program(AR_AVR_GCC NAMES xtensa-lx106-elf-gcc PATHS ${xtensa_bin_path} NO_DEFAULT_PATH)
find_program(AR_AVR_CXX NAMES xtensa-lx106-elf-g++ PATHS ${xtensa_bin_path} NO_DEFAULT_PATH)
find_program(AR_AVR_OBJCOPY NAMES xtensa-lx106-elf-objcopy PATHS ${xtensa_bin_path} NO_DEFAULT_PATH)
find_program(AR_AVR_OBJDUMP NAMES xtensa-lx106-elf-objdump PATHS ${xtensa_bin_path} NO_DEFAULT_PATH)
find_program(AR_AVR_RANLIB NAMES xtensa-lx106-elf-ranlib PATHS ${xtensa_bin_path} NO_DEFAULT_PATH)
find_program(AR_AVR_LD NAMES xtensa-lx106-elf-ld PATHS ${xtensa_bin_path} NO_DEFAULT_PATH)

# Compiler suite specification
set(CMAKE_C_COMPILER ${AR_AVR_GCC})
set(CMAKE_CXX_COMPILER ${AR_AVR_CXX})
set(CMAKE_OBJCOPY ${AR_AVR_OBJCOPY})
set(CMAKE_OBJDUMP ${AR_AVR_OBJDUMP})
set(CMAKE_RANLIB ${AR_AVR_RANLIB})
set(CMAKE_LINKER ${AR_AVR_LD})
