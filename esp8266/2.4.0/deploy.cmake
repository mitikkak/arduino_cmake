
function(elf_to_bin NAME)
add_custom_target(elf_to_bin_${NAME} COMMAND "${ESP8266_PATH}/tools/esptool/esptool" -eo "${ESP8266_PATH}/bootloaders/eboot/eboot.elf" -bo "${NAME}.bin" -bm qio -bf 40 -bz 512K -bs .text -bp 4096 -ec -eo "${NAME}" -bs .irom0.text -bs .text -bs .data -bs .rodata -bc -ec)
endfunction()

function(elf_to_bin_esp8266_12e NAME)
add_custom_target(elf_to_bin_esp8266_12e_${NAME} COMMAND "${ESP8266_PATH}/tools/esptool/esptool" -eo "${ESP8266_PATH}/bootloaders/eboot/eboot.elf" -bo "${NAME}.bin" -bm dio -bf 40 -bz 4M -bs .text -bp 4096 -ec -eo "${NAME}" -bs .irom0.text -bs .text -bs .data -bs .rodata -bc -ec)
endfunction()

function(upload NAME DEPS)
add_custom_target(upload_${NAME} COMMAND ${ESP8266_PATH}/tools/esptool/esptool -vv -cd ck -cb 115200 -cp /dev/ttyUSB0 -ca 0x00000 -cf ${NAME}.bin 
                                 DEPENDS ${DEPS})
endfunction()

function(upload_esp8266_12e NAME DEPS)
add_custom_target(upload_esp8266_12e_${NAME} COMMAND ${ESP8266_PATH}/tools/esptool/esptool -vv -cd nodemcu -cb 921600 -cp /dev/ttyUSB0 -ca 0x00000 -cf ${NAME}.bin 
                                 DEPENDS ${DEPS})
endfunction()
