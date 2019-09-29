
function(elf_to_bin NAME)
add_custom_target(elf_to_bin_${NAME} COMMAND COMMAND python "${ESP8266_PATH}/tools/elf2bin.py" --eboot "${ESP8266_PATH}/bootloaders/eboot/eboot.elf" --app "${NAME}" --flash_mode dout --flash_freq 40 --flash_size 512K --path "${ESP8266_PATH}/tools/xtensa-lx106-elf/bin" --out "${NAME}.bin")
endfunction()

function(elf_to_bin_esp8266_12e NAME)
add_custom_target(elf_to_bin_esp8266_12e_${NAME} COMMAND python "${ESP8266_PATH}/tools/elf2bin.py" --eboot "${ESP8266_PATH}/bootloaders/eboot/eboot.elf" --app "${NAME}" --flash_mode dio --flash_freq 40 --flash_size 4M --path "${ESP8266_PATH}/tools/xtensa-lx106-elf/bin" --out "${NAME}.bin")
endfunction()

function(upload NAME DEPS)
add_custom_target(upload_${NAME} COMMAND python "${ESP8266_PATH}/tools/esptool/esptool.py" --chip esp8266 --port "/dev/ttyUSB0" --baud "115200" --before no_reset --after soft_reset write_flash 0x0 "${NAME}.bin"
                                 DEPENDS ${DEPS})
endfunction()

function(upload_esp8266_12e NAME DEPS)
add_custom_target(upload_esp8266_12e_${NAME} COMMAND python "${ESP8266_PATH}/tools/upload.py" --chip esp8266 --port "/dev/ttyUSB0" --baud "460800"  write_flash 0x0 "${NAME}.bin" --end
                                 DEPENDS ${DEPS})
endfunction()
