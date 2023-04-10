#!/usr/bin/env bash

case $(uname) in
Darwin)
  sysctl -n hw.logicalcpu
  ;;
*)
  echo "Warning: Unhandled system: $(uname). Falling back to 1 CPU" >&2
  echo 1
esac
