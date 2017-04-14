#!/bin/bash

if [ $# -ne 2 ]; then
  echo
  echo -e "\e[33;41;1m秘密鍵ファイルと秘密鍵を特定する値が指定されていません。\e[m"
  echo "コマンド例:"
  echo " $0 sec.key F82BD201"
  echo
  exit 1
fi

gpg --import $1 > /dev/null 2>&1

if [ $? -ne 0 ]; then
  echo "Error."
  exit 1
fi

echo -e "\e[30;42mtrustコマンドを実行し、[5]で絶対に信用する選択を選んでください。\e[m"

gpg --edit $2

