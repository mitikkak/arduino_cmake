function(upload_atmega328 NAME DEPS)
  add_custom_target(elf_to_hex_${NAME} COMMAND ${ARDUINO_PATH}/hardware/tools/avr/bin/avr-objcopy -O ihex -R .eeprom ${NAME} ${NAME}.hex
                                                 DEPENDS ${DEPS})
  add_custom_target(upload_${NAME}     COMMAND ${ARDUINO_PATH}/hardware/tools/avr/bin/avrdude -C${ARDUINO_PATH}/hardware/tools/avr/etc/avrdude.conf -v -patmega328p -carduino -P/dev/ttyACM0 -b115200 -Uflash:w:./${NAME}.hex:i
                                                 DEPENDS elf_to_hex_${NAME})
endfunction()