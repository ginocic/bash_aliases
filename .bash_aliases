# Print the IP address
_IP=$(hostname -I) || true
_HOST=$(hostname) || true
if [ "$_IP" ]; then
  printf "\n\nCiao. Mi chiamo %s e mi trovi a questo indirizzo %s\n\n" "$_HOST" "$_IP"
fi

echo " Alias disponibili"
echo " Aggiornamento"

# Pi-Hole
if [ -f /usr/local/bin/pihole ]; then
  alias phup='pihole -up'
  alias phg='pihole -g'
  alias phuprohi='wget https://www.internic.net/domain/named.root -qO- | sudo tee /var/lib/unbound/root.hints'
  echo "       Pi-Hole  : phup     | phg       | phuprohi"
  echo ""
fi

# Mosquitto
if [ -f /usr/bin/mosquitto_sub ]; then
  alias mqttsub_all='mosquitto_sub -u "$(echo `grep "^mqtt_username" .bash_secret | awk -F : '\''{print $2}'\''`)" -P "$(echo `grep "^mqtt_password" .bash_secret | awk -F : '\''{print $2}'\''`)" -v -t "#"'
  echo " MQTT"
  echo "               mqttsub_all"
  echo ""
fi

# Pi.Alert
if [ -d ~/pialert ]; then
  alias paup='curl -sSL https://github.com/pucherot/Pi.Alert/raw/main/install/pialert_update.sh | bash'
  alias paupvend='python3 ~/pialert/back/pialert.py update_vendors'
  alias pascan='python3 ~/pialert/back/pialert.py 1'
  echo "       Pi.Alert : paup     | paupvend  | pascan"
  echo ""
fi

# System
if [ -f /usr/bin/bc ]; then
  temp() {
    echo "CPU => $(echo "scale=1; $(cat /sys/class/thermal/thermal_zone0/temp)/1000" | bc)'C"
    echo "GPU => $(vcgencmd measure_temp | sed "s/^.....//g")"
  }
else
  echo ""
  echo "Per favore installare il pacchetto \"bc\" che è essenziale per il corretto funzionamento della funzione \"temp\""
  echo ""
fi
  
alias lsa='ls -lA'
alias lsdisk='lsblk -p | grep "disk\|part"'
if [ -f /usr/local/bin/x735softsd.sh ]; then
  alias riavvia='sudo x735softsd.sh 1'
  alias spegni='sudo x735softsd.sh'
elif [ -f /usr/local/bin/softshutdown.sh ]; then
  alias riavvia='sudo softshutdown.sh'
  alias spegni='sudo softshutdown.sh 1'
else
  alias riavvia='sudo reboot'
  alias spegni='sudo shutdown now'
fi
echo " Sistema"
echo "                  lsa      | lsdisk   | temp"
echo "                             riavvia  | spegni"
echo ""

# FSTRIM
if [ -f /etc/udev/rules.d/50-usb-ssd-trim.rules ]; then
  alias trimma='sudo fstrim -a -v'
  alias trimtimer='sudo systemctl status fstrim.timer'
  alias trimservice='sudo systemctl status fstrim.service'
  echo " FSTRIM"
  echo "                  trimma   | trimtimer | trimservice"
  echo ""
fi

# Package Manager
alias upd='sudo apt update'
alias upg='sudo apt full-upgrade -y'
alias ripulisci='sudo apt autoremove -y'
alias aggiorna='sudo apt update && sudo apt full-upgrade -y && sudo apt autoremove -y'
echo "       Sistema  : upd      | upg       | ripulisci"
echo "                                         aggiorna"
echo ""
