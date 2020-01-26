
set(esp32_common_defs -DESP_PLATFORM "-DMBEDTLS_CONFIG_FILE=\"mbedtls/esp_config.h\"" -DHAVE_CONFIG_H -MMD)
set(wroom32_defs ${esp32_common_defs} -c -DF_CPU=240000000L -DARDUINO=10808 -DARDUINO_NodeMCU_32S -DARDUINO_ARCH_ESP32 "-DARDUINO_BOARD=\"NodeMCU_32S\"" "-DARDUINO_VARIANT=\"nodemcu-32s\"" -DESP32 -DCORE_DEBUG_LEVEL=0)
set(esp32_compiler_set_c -std=gnu99 -Os -g3 -fstack-protector -ffunction-sections -fdata-sections -fstrict-volatile-bitfields -mlongcalls -nostdlib -Wpointer-arith -w -Wno-error=unused-function -Wno-error=unused-but-set-variable -Wno-error=unused-variable -Wno-error=deprecated-declarations -Wno-unused-parameter -Wno-sign-compare -Wno-old-style-declaration)
set(esp32_compiler_set_cpp -std=gnu++11 -fno-exceptions -Os -g3 -Wpointer-arith -fexceptions -fstack-protector -ffunction-sections -fdata-sections -fstrict-volatile-bitfields -mlongcalls -nostdlib -w -Wno-error=unused-function -Wno-error=unused-but-set-variable -Wno-error=unused-variable -Wno-error=deprecated-declarations -Wno-unused-parameter -Wno-sign-compare -fno-rtti)
    
set(CMAKE_SHARED_LIBRARY_LINK_C_FLAGS "")   # remove -rdynamic for C
set(CMAKE_SHARED_LIBRARY_LINK_CXX_FLAGS "") # remove -rdynamic for CXX

set(wroom32_linker_options_set1 "-nostdlib -L${ESP32_PATH}/tools/sdk/lib -L${ESP32_PATH}/tools/sdk/ld  -T esp32_out.ld -T esp32.project.ld -T esp32.rom.ld -T esp32.peripherals.ld -T esp32.rom.libgcc.ld -T esp32.rom.spiram_incompatible_fns.ld -u ld_include_panic_highint_hdl -u call_user_start_cpu0 -Wl,--gc-sections -Wl,-static -Wl,--undefined=uxTopUsedPriority -u __cxa_guard_dummy -u __cxx_fatal_exception")
set(core_output_folder ${CMAKE_BINARY_DIR}/esp32/core)
set(core_libraries "${core_output_folder}/libwroom32_core_c.a ${core_output_folder}/libwroom32_core_cpp.a")
set(sdk_libs
    -lgcc
    -lopenssl
    -lbtdm_app
    -lfatfs
    -lwps
    -lcoexist
    -lwear_levelling
    -lesp_http_client
    -lhal
    -lnewlib
    -ldriver
    -lbootloader_support
    -lpp
    -lmesh
    -lsmartconfig
    -ljsmn
    -lwpa
    -lethernet
    -lphy
    -lapp_trace
    -lconsole
    -lulp
    -lwpa_supplicant
    -lfreertos
    -lbt
    -lmicro-ecc
    -lcxx
    -lxtensa-debug-module
    -lmdns
    -lvfs
    -lsoc
    -lcore
    -lsdmmc
    -lcoap
    -ltcpip_adapter
    -lc_nano
    -lesp-tls
    -lrtc
    -lspi_flash
    -lwpa2
    -lesp32
    -lapp_update
    -lnghttp
    -lspiffs
    -lespnow
    -lnvs_flash
    -lesp_adc_cal
    -llog
    -lsmartconfig_ack
    -lexpat
    -lm
    -lc
    -lheap
    -lmbedtls
    -llwip
    -lnet80211
    -lpthread
    -ljson
    -lstdc++
    #with newer SDK
    -lesp_ringbuf
    -lefuse
)
set(wroom32_linker_options_set2 "-Wl,--start-group ${core_libraries} ${sdk_libs} -Wl,--end-group"
)
set(wifi_credentials -DMY_SSID="${SSID}" -DMY_WIFI_PASSWD="${WIFI_PASSWD}")