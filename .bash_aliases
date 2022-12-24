# Print the IP address
_IP=$(ip -o route get 1 | sed 's/^.*src \([^ ]*\).*$/\1/;q') || true
_HOST=$(hostname) || true

if [ "$_IP" ]; then
  printf "\n\nCiao. Mi chiamo %s e mi trovi a questo indirizzo %s\n\n" "$_HOST" "$_IP"
fi

echo ""
echo " Alias disponibili"

# System
if [ ! -f /usr/bin/bc ]; then
  sudo apt install -y bc
fi

temp() {
  echo "CPU => $(echo "scale=1; $(cat /sys/class/thermal/thermal_zone0/temp)/1000" | bc)'C"
  if [ -f /usr/bin/vcgencmd ]; then
    echo "GPU => $(vcgencmd measure_temp | sed "s/^.....//g")"
  fi
}

alias lsa='ls -lAh'
alias lsdisk='lsblk -p | grep "disk\|part"'
alias riavvia='sudo reboot'
alias spegni='sudo shutdown -h now'
alias confrpi='sudo raspi-config'
echo ""
echo " Sistema        : lsa      | lsdisk     | temp"
echo "                  confrpi  | riavvia    | spegni"

# FSTRIM
alias trimma='sudo fstrim -a -v'
alias trimtimer='sudo systemctl status fstrim.timer'
alias trimservice='sudo systemctl status fstrim.service'
echo ""
echo " FSTRIM         : trimma   | trimtimer  | trimservice"

# Package Manager
alias upd='sudo apt update'
alias upg='sudo apt full-upgrade -y'
alias ripulisci='sudo apt autoremove -y'
alias aggiorna='sudo apt update && sudo apt full-upgrade -y && sudo apt autoremove -y'
echo ""
echo " Aggiornamento"
echo "       Sistema  : upd      | upg        | ripulisci"
echo "                  aggiorna"

# Applications
if [ -f $HOME/.apps_aliases ]; then
  echo ""
  source .apps_aliases
fi

# Docker & DockerCompose
if [ -f /usr/bin/docker ]; then
  echo ""
  source .docker_aliases
fi

echo ""
