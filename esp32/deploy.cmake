function(partitions NAME DEPS)
    add_custom_target(partitions_${NAME} COMMAND python ${ESP32_PATH}/hardware/esp32/1.0.0-rc4/tools/gen_esp32part.py -q ${ESP32_PATH}/hardware/esp32/1.0.0-rc4/tools/partitions/default.csv ${NAME}.partitions.bin
    DEPENDS ${DEPS}
    )
endfunction()

function(elf_to_bin_wroom32 NAME)
    add_custom_target(elf_to_bin_wroom32_${NAME} COMMAND
        python ${ESP32_PATH}/tools/esptool/2.3.1/esptool.py --chip esp32 elf2image --flash_mode dio --flash_freq 80m --flash_size 4MB -o ${NAME}.bin ${NAME}
    )
endfunction()

function(upload_wroom32 NAME DEPS)
    add_custom_target(upload_wroom32_${NAME}
        COMMAND
        python ${ESP32_PATH}/tools/esptool/2.3.1/esptool.py --chip esp32 --port /dev/ttyUSB0 --baud 921600 --before default_reset --after hard_reset write_flash -z --flash_mode dio --flash_freq 80m --flash_size detect 0xe000 ${ESP32_PATH}/hardware/esp32/1.0.0-rc4/tools/partitions/boot_app0.bin 0x1000 ${ESP32_PATH}/hardware/esp32/1.0.0-rc4/tools/sdk/bin/bootloader_dio_80m.bin 0x10000 ${NAME}.bin 0x8000 ${NAME}.partitions.bin
        DEPENDS
        ${DEPS} 
    )
endfunction()