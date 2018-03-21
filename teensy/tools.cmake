
# Find teensy SDK delivered programs
set(arm_bin_path ${TEENSY_PATH}/../tools/arm/bin)
find_program(TEENSY_GCC NAMES arm-none-eabi-gcc PATHS ${arm_bin_path} NO_DEFAULT_PATH)
find_program(TEENSY_CXX NAMES arm-none-eabi-g++ PATHS ${arm_bin_path} NO_DEFAULT_PATH)
find_program(TEENSY_OBJCOPY NAMES arm-none-eabi-objcopy PATHS ${arm_bin_path} NO_DEFAULT_PATH)
find_program(TEENSY_OBJDUMP NAMES arm-none-eabi-objdump PATHS ${arm_bin_path} NO_DEFAULT_PATH)
find_program(TEENSY_RANLIB NAMES arm-none-eabi-ranlib PATHS ${arm_bin_path} NO_DEFAULT_PATH)
find_program(TEENSY_LD NAMES arm-none-eabi-ld PATHS ${arm_bin_path} NO_DEFAULT_PATH)

# Compiler suite specification
set(CMAKE_C_COMPILER ${TEENSY_GCC})
set(CMAKE_CXX_COMPILER ${TEENSY_CXX})
set(CMAKE_OBJCOPY ${TEENSY_OBJCOPY})
set(CMAKE_OBJDUMP ${TEENSY_OBJDUMP})
set(CMAKE_RANLIB ${TEENSY_RANLIB})
set(CMAKE_LINKER ${TEENSY_LD})
