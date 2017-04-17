#!/bin/bash

echo "/opt/scripts/my_dev/$(basename ${0})"

if [ "${0}" == "/opt/scripts/my_dev/$(basename ${0})" ]; then
  echo "aaa"
else
  echo "bbb"
fi
