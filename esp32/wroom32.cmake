include(${ARDUINO_CMAKE_DIR}/esp32/paths.cmake)
include(${ARDUINO_CMAKE_DIR}/esp32/libs.cmake)
include(${ARDUINO_CMAKE_DIR}/esp32/tools.cmake)
include(${ARDUINO_CMAKE_DIR}/esp32/defs.cmake)
include(${ARDUINO_CMAKE_DIR}/esp32/deploy.cmake)
include(${ARDUINO_CMAKE_DIR}/esp32/core.cmake)

function(build_targets_espwroom32 sources_to_build external_include_dirs)
    add_executable(${PROJECT_NAME} ${sources_to_build})
    target_link_libraries(${PROJECT_NAME} PRIVATE 
        ${wroom32_linker_options_set1}
        ${wroom32_linker_options_set2}
      )
    add_dependencies(${PROJECT_NAME} ${wroom32_core_libs})
    target_compile_options(
        ${PROJECT_NAME} PRIVATE
        ${esp32_compiler_set_cpp}
        ${wroom32_defs}
        ${wifi_credentials}
    )
    target_include_directories(
        ${PROJECT_NAME} PRIVATE
        ${external_include_dirs}
        ${esp32_sdk_paths}
        ${esp32_core_path}
        ${wroom32_pins_path}
    )
    set(elf_to_bin_wroom32_prefix elf_to_bin_wroom32_)
    set(partitions_wroom32_prefix partitions_)
    elf_to_bin_wroom32(${PROJECT_NAME})
    partitions(${PROJECT_NAME} ${elf_to_bin_wroom32_prefix}${PROJECT_NAME})
    upload_wroom32(${PROJECT_NAME} ${partitions_wroom32_prefix}${PROJECT_NAME} 0)
    upload_wroom32(${PROJECT_NAME} ${partitions_wroom32_prefix}${PROJECT_NAME} 1)
    upload_wroom32(${PROJECT_NAME} ${partitions_wroom32_prefix}${PROJECT_NAME} 2)

endfunction(build_targets_espwroom32)