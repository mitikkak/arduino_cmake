
# Find teensy SDK delivered programs
set(arm_bin_path ${TEENSY_PATH}/../tools/arm/bin)
find_program(AR_AVR_GCC NAMES arm-none-eabi-gcc PATHS ${arm_bin_path} NO_DEFAULT_PATH)
find_program(AR_AVR_CXX NAMES arm-none-eabi-g++ PATHS ${arm_bin_path} NO_DEFAULT_PATH)
find_program(AR_AVR_OBJCOPY NAMES arm-none-eabi-objcopy PATHS ${arm_bin_path} NO_DEFAULT_PATH)
find_program(AR_AVR_OBJDUMP NAMES arm-none-eabi-objdump PATHS ${arm_bin_path} NO_DEFAULT_PATH)
find_program(AR_AVR_RANLIB NAMES arm-none-eabi-ranlib PATHS ${arm_bin_path} NO_DEFAULT_PATH)
find_program(AR_AVR_LD NAMES arm-none-eabi-ld PATHS ${arm_bin_path} NO_DEFAULT_PATH)

# Compiler suite specification
set(CMAKE_C_COMPILER ${AR_AVR_GCC})
set(CMAKE_CXX_COMPILER ${AR_AVR_CXX})
set(CMAKE_OBJCOPY ${AR_AVR_OBJCOPY})
set(CMAKE_OBJDUMP ${AR_AVR_OBJDUMP})
set(CMAKE_RANLIB ${AR_AVR_RANLIB})
set(CMAKE_LINKER ${AR_AVR_LD})
