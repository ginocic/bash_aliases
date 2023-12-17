# to have `ls' to be colorized:
export LS_OPTIONS='--color=auto'
eval "$(dircolors)"
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -l'
alias l='ls $LS_OPTIONS -lAh'
#
# Some more alias to avoid making mistakes:
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
#
# System
alias lsdisk='lsblk -p | grep "disk\|part"'
alias riavvia='sudo reboot'
alias spegni='sudo shutdown -h now'
alias clear='sudo dietpi-banner 1'
#
# FSTrim
alias trimma='sudo fstrim -a -v'
alias trimtimer='sudo systemctl status fstrim.timer'
alias trimservice='sudo systemctl status fstrim.service'
#
# Package Manager
alias upd='sudo apt update'
alias upg='sudo apt full-upgrade -y'
alias ripulisci='sudo apt autoremove -y'
alias aggiorna='sudo apt update && sudo apt full-upgrade -y && sudo apt autoremove -y'
