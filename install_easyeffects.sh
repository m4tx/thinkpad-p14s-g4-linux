#!/usr/bin/env bash
# Based on install.sh from the EasyEffects-Presets repo by JackHack96, licensed under MIT
# This script automatically detect the EasyEffects presets directory and installs the presets

GIT_REPOSITORY="https://raw.githubusercontent.com/m4tx/thinkpad-p14s-g4-linux/master"

check_installation() {
	if command -v flatpak &>/dev/null && flatpak list | grep -q "com.github.wwmm.easyeffects"; then
		PRESETS_DIRECTORY="$HOME/.var/app/com.github.wwmm.easyeffects/config/easyeffects"
	elif which easyeffects >/dev/null; then
		PRESETS_DIRECTORY="$HOME/.config/easyeffects"
	else
		echo "Error! Couldn't find EasyEffects presets directory!"
		exit 1
	fi
	mkdir -p "$PRESETS_DIRECTORY"
}

check_impulse_response_directory() {
	if [ ! -d "$PRESETS_DIRECTORY/irs" ]; then
		mkdir "$PRESETS_DIRECTORY/irs"
	fi
}

install_presets() {
	echo "Installing impulse response files..."
	curl "$GIT_REPOSITORY/easyeffects/P14s_G4_Music_Movies.irs" --output "$PRESETS_DIRECTORY/irs/P14s_G4_Music_Movies.irs" --silent
	curl "$GIT_REPOSITORY/easyeffects/P14s_G4_Dynamic.irs" --output "$PRESETS_DIRECTORY/irs/P14s_G4_Dynamic.irs" --silent
	curl "$GIT_REPOSITORY/easyeffects/P14s_G4_Game.irs" --output "$PRESETS_DIRECTORY/irs/P14s_G4_Game.irs" --silent
	curl "$GIT_REPOSITORY/easyeffects/P14s_G4_Movie.irs" --output "$PRESETS_DIRECTORY/irs/P14s_G4_Movie.irs" --silent
	curl "$GIT_REPOSITORY/easyeffects/P14s_G4_Music.irs" --output "$PRESETS_DIRECTORY/irs/P14s_G4_Music.irs" --silent
	curl "$GIT_REPOSITORY/easyeffects/P14s_G4_Voice.irs" --output "$PRESETS_DIRECTORY/irs/P14s_G4_Voice.irs" --silent
	echo "Installing ThinkPad P14s G4 preset..."
	curl "$GIT_REPOSITORY/easyeffects/ThinkPad%20P14s%20G4%20-%20Legacy.json" --output "$PRESETS_DIRECTORY/output/ThinkPad P14s G4 - Legacy.json" --silent
	curl "$GIT_REPOSITORY/easyeffects/ThinkPad%20P14s%20G4%20-%20Dynamic.json" --output "$PRESETS_DIRECTORY/output/ThinkPad P14s G4 - Dynamic.json" --silent
	curl "$GIT_REPOSITORY/easyeffects/ThinkPad%20P14s%20G4%20-%20Game.json" --output "$PRESETS_DIRECTORY/output/ThinkPad P14s G4 - Game.json" --silent
	curl "$GIT_REPOSITORY/easyeffects/ThinkPad%20P14s%20G4%20-%20Movie.json" --output "$PRESETS_DIRECTORY/output/ThinkPad P14s G4 - Movie.json" --silent
	curl "$GIT_REPOSITORY/easyeffects/ThinkPad%20P14s%20G4%20-%20Music.json" --output "$PRESETS_DIRECTORY/output/ThinkPad P14s G4 - Music.json" --silent
	curl "$GIT_REPOSITORY/easyeffects/ThinkPad%20P14s%20G4%20-%20Voice.json" --output "$PRESETS_DIRECTORY/output/ThinkPad P14s G4 - Voice.json" --silent
}

check_installation
check_impulse_response_directory
install_presets
