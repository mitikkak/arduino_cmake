
if(DEFINED ENV{SSID})
set(SSID $ENV{SSID} CACHE STRING "")
endif()

if(NOT DEFINED SSID)
message(FATAL_ERROR "SSID is missing!" )
else()
message("SSID set as: " ${SSID})
endif()

if(DEFINED ENV{WIFI_PASSWD})
set(WIFI_PASSWD $ENV{WIFI_PASSWD} CACHE STRING "")
endif()

if(NOT DEFINED WIFI_PASSWD)
message(FATAL_ERROR "WIFI_PASSWD is missing!" )
else()
message("WIFI_PASSWD set as: " ${WIFI_PASSWD})
endif()

