
set(eagle_output local.eagle.app.v6.common.ld)
set(eagle_input ${ESP8266_PATH}/tools/sdk/ld/eagle.app.v6.common.ld.h)
add_custom_command(
  OUTPUT ${eagle_output}
  #BUILD_EXTRA_FLAGS="-DNDEBUG -DVTABLES_IN_FLASH"
  #$ESP_ROOT/tools/xtensa-lx106-elf/bin/xtensa-lx106-elf-gcc -CC -E -P $BUILD_EXTRA_FLAGS $ESP_ROOT/tools/sdk/ld/eagle.app.v6.common.ld.h -o $ESP_ROOT/tools/sdk/ld/eagle.app.v6.common.ld
  COMMAND "${CMAKE_C_COMPILER}" -CC -E -P -DVTABLES_IN_FLASH ${eagle_input} -o ${eagle_output}
  DEPENDS ${eagle_input}
  WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
)