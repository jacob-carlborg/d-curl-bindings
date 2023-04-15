#!/usr/bin/env bash

# find output/curl/include/curl -type f -print0 |
#     while IFS= read -r -d '' line; do
#       filename="$(ruby -e "print File.basename('$line', '.*')")"
#
#       "${DSTEP:-dstep}" "$line" \
#         -Ioutput/curl/include/curl \
#         -o "source/curl/raw/$filename.d" \
#         --package curl.raw \
#         --normalize-modules=true \
#         --space-after-function-name=false \
#         --include=output/curl/include/curl/curl.h
#     done

default_flags="-Ioutput/curl/include/curl \
  --package curl.raw \
  --normalize-modules=true \
  --space-after-function-name=false \
  --alias-enum-members=true \
  --include=output/curl/include/curl/curl.h"

"${DSTEP:-dstep}" output/curl/include/curl/stdcheaders.h \
  $default_flags \
  -o source/curl/raw/stdcheaders.d

"${DSTEP:-dstep}" output/curl/include/curl/header.h \
  $default_flags \
  -o source/curl/raw/header.d \
  --global-import curl.raw.curl

"${DSTEP:-dstep}" output/curl/include/curl/options.h \
  $default_flags \
  -o source/curl/raw/options.d \
  --global-import curl.raw.curl

"${DSTEP:-dstep}" output/curl/include/curl/mprintf.h \
  $default_flags \
  -o source/curl/raw/mprintf.d

"${DSTEP:-dstep}" output/curl/include/curl/easy.h \
  $default_flags \
  -o source/curl/raw/easy.d \
  --global-import curl.raw.curl

"${DSTEP:-dstep}" output/curl/include/curl/curl.h \
  $default_flags \
  -o source/curl/raw/curl.d \
  --global-import curl.raw.system \
  --skip curl_easy_setopt \
  --skip curl_easy_getinfo \
  --skip curl_share_setopt \
  --skip curl_multi_setopt

"${DSTEP:-dstep}" output/curl/include/curl/websockets.h \
  $default_flags \
  -o source/curl/raw/websockets.d \
  --global-import curl.raw.curl \
  --global-import curl.raw.system

"${DSTEP:-dstep}" output/curl/include/curl/curlver.h \
  $default_flags \
  -o source/curl/raw/curlver.d

"${DSTEP:-dstep}" output/curl/include/curl/system.h \
  $default_flags \
  -o source/curl/raw/system.d \
  --skip CURL_SUFFIX_CURL_OFF_T \
  --skip CURL_SUFFIX_CURL_OFF_TU

"${DSTEP:-dstep}" output/curl/include/curl/multi.h \
  $default_flags \
  -o source/curl/raw/multi.d \
  --global-import curl.raw.curl

"${DSTEP:-dstep}" output/curl/include/curl/urlapi.h \
  $default_flags \
  -o source/curl/raw/urlapi.d
