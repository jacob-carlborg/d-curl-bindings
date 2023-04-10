#!/usr/bin/env bash

repo="$1"; shift
new_version="$1"; shift

declare -A repos=(
  [bearssl]='https://www.bearssl.org/git/BearSSL'
  [curl]='https://github.com/curl/cur'
  [nghttp2]='https://github.com/nghttp2/nghttp2'
  [zlib]='https://github.com/madler/zlib'
)

git subtree pull \
  --prefix "vendor/$repo" \
  "${repos[$repo]}" \
  "$new_version" \
  --squash
