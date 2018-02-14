
set(core_path  ${TEENSY_PATH}/avr/cores/teensy3)

set(teensy_core_asm_sources
  ${core_path}/memcpy-armv7m.S
  ${core_path}/memset.S
)
enable_language(ASM)
add_library(teensy_core_asm STATIC ${teensy_core_asm_sources})
target_compile_options(
    teensy_core_asm PRIVATE
    ${compiler_set_asm}
)

set(teensy_core_c_sources
  ${core_path}/analog.c
  ${core_path}/eeprom.c
  ${core_path}/keylayouts.c
  ${core_path}/math_helper.c
  ${core_path}/mk20dx128.c
  ${core_path}/nonstd.c
  ${core_path}/pins_teensy.c
  ${core_path}/ser_print.c
  ${core_path}/serial1.c
  ${core_path}/serial2.c
  ${core_path}/serial3.c
  ${core_path}/serial4.c
  ${core_path}/serial5.c
  ${core_path}/serial6.c
  ${core_path}/serial6_lpuart.c
  ${core_path}/touch.c
  ${core_path}/usb_desc.c
  ${core_path}/usb_dev.c
  ${core_path}/usb_joystick.c
  ${core_path}/usb_keyboard.c
  ${core_path}/usb_mem.c
  ${core_path}/usb_midi.c
  ${core_path}/usb_mouse.c
  ${core_path}/usb_mtp.c
  ${core_path}/usb_rawhid.c
  ${core_path}/usb_seremu.c
  ${core_path}/usb_serial.c
  ${core_path}/usb_touch.c
)
add_library(teensy_core_c STATIC ${teensy_core_c_sources})
target_compile_options(
    teensy_core_c PRIVATE
    ${teensy_compiler_set_c}
)

set(teensy_core_cpp_sources
  ${core_path}/AudioStream.cpp
  ${core_path}/DMAChannel.cpp
  ${core_path}/HardwareSerial1.cpp
  ${core_path}/HardwareSerial2.cpp
  ${core_path}/HardwareSerial3.cpp
  ${core_path}/HardwareSerial4.cpp
  ${core_path}/HardwareSerial5.cpp
  ${core_path}/HardwareSerial6.cpp
  ${core_path}/IPAddress.cpp
  ${core_path}/IntervalTimer.cpp
  ${core_path}/Print.cpp
  ${core_path}/Stream.cpp
  ${core_path}/Tone.cpp
  ${core_path}/WMath.cpp
  ${core_path}/WString.cpp
  ${core_path}/avr_emulation.cpp
  ${core_path}/main.cpp
  ${core_path}/new.cpp
  ${core_path}/usb_audio.cpp
  ${core_path}/usb_flightsim.cpp
  ${core_path}/usb_inst.cpp
  ${core_path}/yield.cpp
)
add_library(teensy_core STATIC ${teensy_core_cpp_sources})
target_compile_options(
    teensy_core PRIVATE
    ${teensy_compiler_set_cpp}
)
target_link_libraries(teensy_core teensy_core_c teensy_core_asm)
