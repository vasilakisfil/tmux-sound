get_tmux_option() {
	local option="$1"
	local default_value="$2"
	local option_value="$(tmux show-option -gqv "$option")"
	if [ -z "$option_value" ]; then
		echo "$default_value"
	else
		echo "$option_value"
	fi
}

set_tmux_option() {
  local option="$1"
  local value="$2"
  tmux set-option -gq "$option" "$value"
}

is_osx() {
	[ $(uname) == "Darwin" ]
}

is_chrome() {
	chrome="/sys/class/chromeos/cros_ec"
	if [ -d "$chrome" ]; then
		return 0
	else
		return 1
	fi
}

command_exists() {
	local command="$1"
	type "$command" >/dev/null 2>&1
}

volume() {
    amixer -D pulse sget Master | tail -n 1 | awk -F\[ '{print $2}' | sed 's/.\{3\}$//'
}

headphones() {
    # Check whether the headphones (or speakers) are plugged in or not.
    # not really working

    snd_card_num=0
    node_num="0x16"
    snd_card_file="/proc/asound/card${snd_card_num}/codec#0"

    # Run the check
    cat "${snd_card_file}" \
        | grep -A 4 'Node $node_num' \
        | grep 'Amp-Out vals:  \[0x00 0x00\]' \
        > /dev/null

    exit_state=$?

    if [ $exit_state -eq 0 ]; then
        state="connected"
    else
        state="disconnected"
    fi

    echo "$state"
}
