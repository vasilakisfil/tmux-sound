#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$CURRENT_DIR/helpers.sh"

speakers_icon="🔈"
headphones_icon="🎧"

main() {
  #headphones
  if [[ 1 -eq 0 ]]; then
    printf "$headphones_icon"
  else
    printf "$speakers_icon"
  fi
}

main
