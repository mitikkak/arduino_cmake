
set(wifi_sources
            ${WIFI_ESP8266_DIR}/ESP8266WiFiSTA.cpp
            ${WIFI_ESP8266_DIR}/WiFiServer.cpp
            ${WIFI_ESP8266_DIR}/ESP8266WiFiGeneric.cpp
            ${WIFI_ESP8266_DIR}/ESP8266WiFi.cpp
            ${WIFI_ESP8266_DIR}/WiFiClient.cpp
            ${WIFI_ESP8266_DIR}/ESP8266WiFiMulti.cpp
            ${WIFI_ESP8266_DIR}/ESP8266WiFiScan.cpp
            ${WIFI_ESP8266_DIR}/ESP8266WiFiAP.cpp
            ${WIFI_ESP8266_DIR}/WiFiUdp.cpp
)
set(esp8266_webserver_sources
#    ${WEB_SERVER_ESP8266_DIR}/ESP8266WebServer.cpp
#    ${WEB_SERVER_ESP8266_DIR}/Parsing.cpp
)
set(wire_sources
  ${WIRE_ESP8266_DIR}/Wire.cpp
)

set(spi_sources
 ${SPI_ESP8266_DIR}/SPI.cpp
)

set(esp8266_mdns_sources
    ${MDNS_ESP8266_DIR}/ESP8266mDNS.cpp
    ${MDNS_ESP8266_DIR}/ESP8266mDNS_Legacy.cpp
    ${MDNS_ESP8266_DIR}/LEAmDNS.cpp
    ${MDNS_ESP8266_DIR}/LEAmDNS_Control.cpp
    ${MDNS_ESP8266_DIR}/LEAmDNS_Helpers.cpp
    ${MDNS_ESP8266_DIR}/LEAmDNS_Structs.cpp
    ${MDNS_ESP8266_DIR}/LEAmDNS_Transfer.cpp
)

set(esp8266_sd_sources
            ${SDFAT_ESP8266_DIR}/SD.cpp
            ${SDFAT_ESP8266_DIR}/FatLib/FatFile.cpp
            ${SDFAT_ESP8266_DIR}/utility/SdVolume.cpp
            ${SDFAT_ESP8266_DIR}/utility/SdFile.cpp
            ${SDFAT_ESP8266_DIR}/utility/Sd2Card.cpp
)


