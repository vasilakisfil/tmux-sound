#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/scripts/helpers.sh"

volume="#($CURRENT_DIR/scripts/volume.sh)"
volume_percentage="#($CURRENT_DIR/scripts/volume_percentage.sh)"
volume_icon="#($CURRENT_DIR/scripts/volume_icon.sh)"

volume_interpolation="\#{volume}"
volume_percentage_interpolation="\#{volume_percentage}"
volume_icon_interpolation="\#{volume_icon}"

do_interpolation() {
  local string="$1"
  local volume_interpolated="${string/$volume_interpolation/$volume}"
  local remain_interpolated="${volume_interpolated/$volume_percentage_interpolation/$volume_percentage}"
  local all_interpolated="${remain_interpolated/$volume_icon_interpolation/$volume_icon}"
  echo "$all_interpolated"
}

update_tmux_option() {
  local option="$1"
  local option_value="$(get_tmux_option "$option")"
  local new_option_value="$(do_interpolation "$option_value")"
  set_tmux_option "$option" "$new_option_value"
}


main() {
  update_tmux_option "status-right"
  update_tmux_option "status-left"
}
main
