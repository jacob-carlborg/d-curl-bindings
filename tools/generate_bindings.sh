#!/usr/bin/env bash

d_output="source/curl/raw"

default_flags="-Ioutput/curl/include/curl \
  --package curl.raw \
  --normalize-modules=true \
  --space-after-function-name=false \
  --alias-enum-members=true \
  --include=output/curl/include/curl/curl.h"

"${DSTEP:-dstep}" output/curl/include/curl/stdcheaders.h \
  $default_flags \
  -o "$d_output/stdcheaders.d"

"${DSTEP:-dstep}" output/curl/include/curl/header.h \
  $default_flags \
  -o "$d_output/header.d" \
  --global-import curl.raw.curl

"${DSTEP:-dstep}" output/curl/include/curl/options.h \
  $default_flags \
  -o "$d_output/options.d" \
  --global-import curl.raw.curl

"${DSTEP:-dstep}" output/curl/include/curl/mprintf.h \
  $default_flags \
  -o "$d_output/mprintf.d"

"${DSTEP:-dstep}" output/curl/include/curl/easy.h \
  $default_flags \
  -o "$d_output/easy.d" \
  --global-import curl.raw.curl

"${DSTEP:-dstep}" output/curl/include/curl/curl.h \
  $default_flags \
  -o "$d_output/curl.d" \
  --global-import curl.raw.system \
  --skip curl_easy_setopt \
  --skip curl_easy_getinfo \
  --skip curl_share_setopt \
  --skip curl_multi_setopt

"${DSTEP:-dstep}" output/curl/include/curl/websockets.h \
  $default_flags \
  -o "$d_output/websockets.d" \
  --global-import curl.raw.curl \
  --global-import curl.raw.system

"${DSTEP:-dstep}" output/curl/include/curl/curlver.h \
  $default_flags \
  -o "$d_output/curlver.d"

"${DSTEP:-dstep}" output/curl/include/curl/system.h \
  $default_flags \
  -o "$d_output/system.d" \
  --skip CURL_SUFFIX_CURL_OFF_T \
  --skip CURL_SUFFIX_CURL_OFF_TU

"${DSTEP:-dstep}" output/curl/include/curl/multi.h \
  $default_flags \
  -o "$d_output/multi.d" \
  --global-import curl.raw.curl \
  --global-import core.sys.posix.sys.select

"${DSTEP:-dstep}" output/curl/include/curl/urlapi.h \
  $default_flags \
  -o "$d_output/urlapi.d"

find output/curl/include/curl -type f -print0 |
    while IFS= read -r -d '' line; do
      filename="$(ruby -e "print File.basename('$line', '.*')")"

      [ "$filename" = "typecheck-gcc" ] && continue

      if ! test -f "$d_output/$filename.d"; then
        echo "Bindings for '$line' has not been generated. Added it to the list above"
        exit 1
      fi
    done
