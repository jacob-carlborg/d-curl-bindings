#!/usr/bin/env bash

repo="$1"; shift
suffix="/src"
extra_flags=""

if [ "$repo" = zlib ]; then
  suffix=""
  extra_flags="-d 1"
fi

find -s "vendor/${repo}${suffix}" $extra_flags -type f -not -path '*/.*' -exec echo '"{}" \' \;
