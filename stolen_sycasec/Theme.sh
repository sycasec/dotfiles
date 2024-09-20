#!/usr/bin/bash

set_bspwm_config() {
		bspc config border_width 0
		bspc config top_padding 64
		bspc config bottom_padding 2
		bspc config normal_border_color "#4C3A6D"
		bspc config active_border_color "#4C3A6D"
		bspc config focused_border_color "#785DA5"
		bspc config presel_feedback_color "#070219"
		bspc config left_padding 2
		bspc config right_padding 2
		bspc config window_gap 6
}

# Set compositor configuration
set_picom_config() {
		sed -i "$HOME"/.config/bspwm/picom.conf \
			-e "s/shadow-color = .*/shadow-color = \"#000000\"/g" \
			-e "s/corner-radius = .*/corner-radius = 6/g" \
			-e "s/\".*:class_g = 'Alacritty'\"/\"95:class_g = 'Alacritty'\"/g" \
			-e "s/\".*:class_g = 'FloaTerm'\"/\"95:class_g = 'FloaTerm'\"/g" \
			-e "s/\".*:class_g = 'Updating'\"/\"95:class_g = 'Updating'\"/g" \
			-e "s/\".*:class_g = 'MusicPlayer'\"/\"95:class_g = 'MusicPlayer'\"/g" \
			-e "s/\".*:class_g = 'Sysfetch'\"/\"95:class_g = 'Sysfetch'\"/g" 

}

# Set dunst notification daemon config
set_dunst_config() {
		sed -i "$HOME"/.config/bspwm/dunstrc \
		-e "s/transparency = .*/transparency = 10/g" \
		-e "s/frame_color = .*/frame_color = \"#070219\"/g" \
		-e "s/separator_color = .*/separator_color = \"#fb007a\"/g" \
		-e "s/font = .*/font = FiraCode Nerd Font Medium 9/g" \
		-e "s/foreground='.*'/foreground='#f9f9f9'/g"
		
		sed -i '/urgency_low/Q' "$HOME"/.config/bspwm/dunstrc
		cat >> "$HOME"/.config/bspwm/dunstrc <<- _EOF_
				[urgency_low]
				timeout = 3
				background = "#19bffe"
				foreground = "#f9f9f9"

				[urgency_normal]
				timeout = 6
				background = "#FBC02D"
				foreground = "#f9f9f9"

				[urgency_critical]
				timeout = 0
				background = "#fb007a"
				foreground = "#f9f9f9"
_EOF_
}

# Launch the bar and or eww widgets
launch_bars() {
		# eww -c ${rice_dir}/widgets daemon &
    killall -q polybar
    while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
		polybar -q main -c $HOME/.config/bspwm/sycasec/config.ini &

    if [[ $(xrandr -q | grep 'HDMI-1-1 connected') ]]; then
      polybar -q main_external -c $HOME/.config/bspwm/sycasec/config.ini &
    fi
}


### ---------- Apply Configurations ---------- ###


set_bspwm_config
# set_term_config
set_picom_config
set_dunst_config
launch_bars

