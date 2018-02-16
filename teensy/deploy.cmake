
function(upload_teensy NAME DEPS)
add_custom_target(eeprom_teensy_${NAME} "${TEENSY_PATH}/../tools/arm/bin/arm-none-eabi-objcopy" -O ihex -j .eeprom --set-section-flags=.eeprom=alloc,load --no-change-warnings --change-section-lma .eeprom=0 "${NAME}" "${NAME}.eep"
                  DEPENDS ${DEPS})
add_custom_target(lst_teensy_${NAME} "${TEENSY_PATH}/../tools/stdout_redirect" "${NAME}.lst" "${TEENSY_PATH}/../tools/arm/bin/arm-none-eabi-objdump" -d -S -C "${NAME}"
                  DEPENDS ${DEPS})
add_custom_target(sym_teensy_${NAME} "${TEENSY_PATH}/../tools/stdout_redirect" "${NAME}.sym" "${TEENSY_PATH}/../tools/arm/bin/arm-none-eabi-objdump" -t -C "${NAME}"
                  DEPENDS ${DEPS})
add_custom_target(elf_to_hex_teensy_${NAME} "${TEENSY_PATH}/../tools/arm/bin/arm-none-eabi-objcopy" -O ihex -R .eeprom "${NAME}" "${NAME}.hex"
                  DEPENDS ${DEPS})
add_custom_target(upload_teensy_${NAME} COMMAND ${TEENSY_PATH}/../tools/teensy_post_compile -test -file=${NAME} -path=${PROJECT_ROOT}/build/${NAME} -tools=${TEENSY_PATH}/../tools -board=TEENSY31 -reboot
                  DEPENDS eeprom_teensy_${NAME} lst_teensy_${NAME} sym_teensy_${NAME} elf_to_hex_teensy_${NAME})
endfunction()


