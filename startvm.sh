#!/bin/bash

RED="\033[31m"
GREEN="\033[32m"
CYAN="\033[36m"
NC="\033[0m"
BOLD=$(tput bold)
NORMAL=$(tput sgr0)

if [ -z "$1" ]; then
    echo "Usage: $0 <vm_name>"
    exit 1
fi

vm_name="$1"

if virsh --connect qemu:///system list | grep "$vm_name " > /dev/null 2>&1; then
    vm_state=$(virsh --connect qemu:///system domstate "$vm_name")
    if [ "$vm_state" == "running" ]; then
        echo -e "${CYAN}${BOLD}$vm_name is already running${NC}${NORMAL}"
    else
        virsh -c qemu:///system start "$vm_name"
    fi
    echo -e "${GREEN}${BOLD}Starting looking-glass${NC}${NORMAL}"
    looking-glass-client -F input:grabKeyboardOnFocus input:grabKeyboard spice:clipboardToVM spice:clipboardToLocal > /dev/null 2>&1
else
    echo -e "${RED}${BOLD}VM $vm_name does not exist.${NC}${NORMAL}"
fi
