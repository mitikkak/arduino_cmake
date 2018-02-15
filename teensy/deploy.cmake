
function(upload_teensy NAME DEPS)
add_custom_target(upload_teensy_${NAME} COMMAND ${TEENSY_PATH}/../tools/teensy_post_compile -test -file=${NAME} -path=${PROJECT_ROOT}/build/${NAME} -tools=${TEENSY_PATH}/../tools -board=TEENSY31 -reboot
                  DEPENDS ${DEPS})
endfunction()


