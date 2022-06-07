# Print the IP address
_IP=$(hostname -I) || true
_HOST=$(hostname) || true
if [ "$_IP" ]; then
  printf "\n\nCiao. Mi chiamo %s e mi trovi a questo indirizzo %s\n\n" "$_HOST" "$_IP"
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
alias riavvia='sudo reboot'
alias spegni='sudo shutdown now'

# Package Manager
alias upd='sudo apt update'
alias upg='sudo apt full-upgrade -y'
alias ripulisci='sudo apt autoremove -y'
alias aggiorna='sudo apt update && sudo apt full-upgrade -y && sudo apt autoremove -y'

# FSTRIM
alias trimma='sudo fstrim -a -v'
alias trimtimer='sudo systemctl status fstrim.timer'
alias trimservice='sudo systemctl status fstrim.service'

echo " Alias disponibili"
echo " per aggiornamento sistema : upd      | upg       | ripulisci"
echo "                             aggiorna"
echo ""
echo " per gestione sistema :      lsa      | lsdisk    | temp"
echo "                             riavvia  | spegni"
echo ""
echo " per la gestione di FSTRIM : trimma   | trimtimer | trimservice"
echo ""
