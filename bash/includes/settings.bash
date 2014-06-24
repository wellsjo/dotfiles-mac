#!/bin/bash

wells_settings() {
    echo "${CYAN}##################################"
    echo "############### Yo ###############"
    echo "##################################"
    echo -e "\n${CYAN}Hello.  Enjoy my setup plz.\n${WHITE}"
    echo -e "${CYAN}bash aliases"
    echo -e "${YELLOW}.. --> cd .."
    echo "ll -> la -la"

    echo -e "${CYAN}SSH shortcuts"
    echo "${YELLOW}wells: ssh to my website vm"
    echo "ppl: ssh to my dev vm"
    echo "vm: ssh to my spotify vm"
    echo "jump: ssh to jumphost"


    echo -e "\n${CYAN}Other commands"
    echo "${YELLOW}"
    echo "wells_settings: show my available shortcuts/commands"
    echo "wells_update: update dotfile settings from my git repo"
    echo "wellssh ...: my ssh command that comes with an auto-setup script that runs on the other end"

    echo "${WHITE}"
}
