#!/bin/bash

if [ $# -ne 1 ]; then
  echo
  echo -e "\e[33;41;1m秘密鍵を特定する値が指定されていません。\e[m"
  echo "コマンド例:"
  echo " $0 F82BD201"
  echo
  exit 1
fi

gpg -o sec.key --export-secret-key $1
