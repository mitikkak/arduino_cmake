
function(elf_to_bin NAME)
add_custom_target(elf_to_bin_${NAME} COMMAND "${ESP8266_PATH}/tools/esptool/0.4.12/esptool" -eo "${ESP8266_PATH}/hardware/esp8266/2.4.0/bootloaders/eboot/eboot.elf" -bo "${NAME}.bin" -bm qio -bf 40 -bz 512K -bs .text -bp 4096 -ec -eo "${NAME}" -bs .irom0.text -bs .text -bs .data -bs .rodata -bc -ec)
endfunction(elf_to_bin)

function(upload NAME DEPS)
add_custom_target(upload_${NAME} COMMAND ${ESP8266_PATH}/tools/esptool/0.4.12/esptool -vv -cd ck -cb 115200 -cp /dev/ttyUSB0 -ca 0x00000 -cf ${NAME}.bin 
                                 DEPENDS ${DEPS})
endfunction(upload)