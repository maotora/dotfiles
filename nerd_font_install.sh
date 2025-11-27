#!/usr/bin/env bash

# Script: install_nerd_fonts.sh
# Description: A script to interactively select and install Nerd Fonts for macOS using Homebrew and fzf.
# Author: zx0r
# Version: 1.0

# Enable strict error handling
set -euo pipefail

# Constants
FZF_PROMPT="Select Nerd Fonts: "
FZF_HEIGHT="60%"
FZF_LAYOUT="reverse"

# Colors
BLACK='\033[0;30m'  # Black
RED='\033[0;31m'    # Red
GREEN='\033[0;32m'  # Green
YELLOW='\033[0;33m' # Yellow
BLUE='\033[0;34m'   # Blue
PURPLE='\033[0;35m' # Purple
CYAN='\033[0;36m'   # Cyan
NC='\033[0m'        # Text Reset

# Function to check if a command is installed
is_command_installed() {
  command -v "$1" &>/dev/null
}

# Function to print a step message
print_step() {
  echo -e "\n${CYAN}➜ ${1}${NC}\n"
}

# Function to print a success message
print_success() {
  echo -e "\n${GREEN}✅ ${1}${NC}\n"
}

# Function to print a warning message
print_warn() {
  echo -e "${YELLOW}[Warn] ${1}${NC}"
}

# Function to print an error message and exit
print_error() {
  echo -e "${RED}❗️${1}${NC}"
  exit 1
}

# Function to check for dependencies
check_dependencies() {
  local dependencies=("brew" "fzf")

  for dep in "${dependencies[@]}"; do
    if ! is_command_installed "$dep"; then
      print_warn "$dep is not installed."
      if [[ "$dep" == "brew" ]]; then
        print_warn "Please install Homebrew first: https://brew.sh"
      elif [[ "$dep" == "fzf" ]]; then
        print_step "Installing fzf..."
        brew install fzf
      fi
      exit 1
    fi
  done
}

# Function to fetch available Nerd Fonts
fetch_nerd_fonts() {
  brew search '/font-.*-nerd-font/' | awk '{ print $1 }'
}

# Function to select fonts interactively using fzf
select_fonts() {
  local fonts="$1"
  echo "$fonts" | fzf --multi --prompt="$FZF_PROMPT" --height="$FZF_HEIGHT" --layout="$FZF_LAYOUT"
}

# Function to install selected fonts
install_fonts() {
  local selected_fonts="$1"
  if [[ -z "$selected_fonts" ]]; then
    print_warn "No fonts selected. Exiting."
    exit 0
  fi

  print_step "Installing selected Nerd Fonts..."
  # Use a while loop to handle font names with spaces
  echo "$selected_fonts" | while read -r font; do
    echo -e "Installing $font..."
    if brew install --cask "$font"; then
      print_success "Successfully installed $font."
    else
      print_warn "Failed to install $font."
    fi
  done
}

# Main function to orchestrate the script
main() {
  print_step "Select the Nerd Fonts you want to install (use TAB to select multiple):"

  check_dependencies

  local fonts
  fonts=$(fetch_nerd_fonts)
  if [[ -z "$fonts" ]]; then
    print_error "No Nerd Fonts found. Please ensure Homebrew is up to date."
  fi

  local selected_fonts
  selected_fonts=$(select_fonts "$fonts")

  install_fonts "$selected_fonts"
}

# Run the script
main
