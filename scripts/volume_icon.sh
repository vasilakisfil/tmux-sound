#!/usr/bin/env bash
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$CURRENT_DIR/helpers.sh"

icon_0="🔇"
icon_1="⚋ "
icon_2="⚊ "
icon_3='▁'
icon_4='▂'
icon_5='▃'
icon_6='▄'
icon_7='▅'
icon_8='▆'
icon_9='▇'
icon_10='█'

print_icon() {
  local value=$(volume)

  if [[ $value == 0 ]]; then
    printf "$icon_0"
  elif [[ $value -lt 10 ]]; then
    printf "$icon_1"
  elif [[ $value -lt 20 ]]; then
    printf "$icon_2"
  elif [[ $value -lt 30 ]]; then
    printf "$icon_3"
  elif [[ $value -lt 40 ]]; then
    printf "$icon_4"
  elif [[ $value -lt 50 ]]; then
    printf "$icon_5"
  elif [[ $value -lt 60 ]]; then
    printf "$icon_6"
  elif [[ $value -lt 70 ]]; then
    printf "$icon_7"
  elif [[ $value -lt 80 ]]; then
    printf "$icon_8"
  elif [[ $value -lt 100 ]]; then
    printf "$icon_9"
  elif [[ $value == 100 ]]; then
    printf "$icon_10"
  fi
}

main() {
  print_icon
}

main
