message(ESP32_PATH: ${ESP32_PATH})
if(${ESP32_PATH} MATCHES .*esp32.*)
   message("esp32 path found at:" ${ESP32_PATH})
else()
   message("setting esp32 path from env variable ...")
   set(ESP32_PATH $ENV{ESP32_PATH} CACHE STRING "")
endif()

if(${ESP32_PATH} MATCHES .*esp.*)
   message("esp32 path found at:" ${ESP32_PATH})
else()
   message(FATAL_ERROR "ESP32_PATH variable missing!")
endif()

set(ESP32_SDK_INC_DIR ${ESP32_PATH}/tools/sdk/include)
set(esp32_sdk_paths
    ${ESP32_SDK_INC_DIR}/config
    ${ESP32_SDK_INC_DIR}/bluedroid 
    ${ESP32_SDK_INC_DIR}/bluedroid/api 
    ${ESP32_SDK_INC_DIR}/app_trace 
    ${ESP32_SDK_INC_DIR}/app_update
    ${ESP32_SDK_INC_DIR}/bootloader_support
    ${ESP32_SDK_INC_DIR}/bt
    ${ESP32_SDK_INC_DIR}/driver
    ${ESP32_SDK_INC_DIR}/esp32 
    ${ESP32_SDK_INC_DIR}/esp_adc_cal 
    ${ESP32_SDK_INC_DIR}/esp_http_client 
    ${ESP32_SDK_INC_DIR}/esp-tls
    ${ESP32_SDK_INC_DIR}/esp_event
    ${ESP32_SDK_INC_DIR}/esp_ringbuf
    ${ESP32_SDK_INC_DIR}/ethernet 
    ${ESP32_SDK_INC_DIR}/fatfs 
    ${ESP32_SDK_INC_DIR}/freertos 
    ${ESP32_SDK_INC_DIR}/heap 
    ${ESP32_SDK_INC_DIR}/jsmn 
    ${ESP32_SDK_INC_DIR}/log 
    ${ESP32_SDK_INC_DIR}/mdns 
    ${ESP32_SDK_INC_DIR}/mbedtls 
    ${ESP32_SDK_INC_DIR}/mbedtls_port 
    ${ESP32_SDK_INC_DIR}/newlib 
    ${ESP32_SDK_INC_DIR}/nvs_flash 
    ${ESP32_SDK_INC_DIR}/openssl 
    ${ESP32_SDK_INC_DIR}/spi_flash 
    ${ESP32_SDK_INC_DIR}/sdmmc 
    ${ESP32_SDK_INC_DIR}/smartconfig_ack 
    ${ESP32_SDK_INC_DIR}/spiffs 
    ${ESP32_SDK_INC_DIR}/tcpip_adapter 
    ${ESP32_SDK_INC_DIR}/ulp 
    ${ESP32_SDK_INC_DIR}/vfs 
    ${ESP32_SDK_INC_DIR}/wear_levelling 
    ${ESP32_SDK_INC_DIR}/xtensa-debug-module 
    ${ESP32_SDK_INC_DIR}/coap 
    ${ESP32_SDK_INC_DIR}/console 
    ${ESP32_SDK_INC_DIR}/expat 
    ${ESP32_SDK_INC_DIR}/json 
    ${ESP32_SDK_INC_DIR}/lwip 
    ${ESP32_SDK_INC_DIR}/newlib 
    ${ESP32_SDK_INC_DIR}/nghttp 
    ${ESP32_SDK_INC_DIR}/soc 
    ${ESP32_SDK_INC_DIR}/wpa_supplicant
)

set(esp32_core_path ${ESP32_PATH}/cores/esp32)
set(wroom32_pins_path ${ESP32_PATH}/variants/nodemcu-32s)
set(ESP32_LIB_PATH ${ESP32_PATH}/libraries)

set(ESP32_BLE_SRC_DIR ${ESP32_LIB_PATH}/BLE/src)
set(ESP32_WIRE_SRC_DIR ${ESP32_LIB_PATH}/Wire/src)
set(ESP32_SD_SRC_DIR ${ESP32_LIB_PATH}/SD/src)
set(ESP32_FS_SRC_DIR ${ESP32_LIB_PATH}/FS/src)
set(ESP32_SPI_SRC_DIR ${ESP32_LIB_PATH}/SPI/src)
set(ESP32_WIFI_SRC_DIR ${ESP32_LIB_PATH}/WiFi/src)
set(ESP32_WIFI_CLIENT_SECURE_SRC_DIR ${ESP32_LIB_PATH}/WiFiClientSecure/src)
set(ESP32_ASYNC_UDP_SRC_DIR ${ESP32_LIB_PATH}/AsyncUDP/src)
set(ESP32_MDNS_SRC_DIR ${ESP32_LIB_PATH}/ESPmDNS/src)
