# Print the IP address
_IP=$(hostname -I) || true
_HOST=$(hostname) || true
if [ "$_IP" ]; then
  printf "\n\nCiao. Mi chiamo %s e mi trovi a questo indirizzo %s\n\n" "$_HOST" "$_IP"
fi

# System
alias lsa='ls -lA'
alias lsdisk='lsblk -p | grep "disk\|part"'
alias temp='/usr/bin/vcgencmd measure_temp'
alias riavvia='sudo reboot'
alias spegni='sudo shutdown now'

# Package Manager
alias upd='sudo apt update'
alias upg='sudo apt full-upgrade -y'
alias aggiorna='sudo apt update && sudo apt full-upgrade -y && sudo apt autoremove -y'
alias fupgrade='sudo apt update && sudo apt full-upgrade -y'
alias dupgrade='sudo apt update && sudo apt dist-upgrade -y'
alias ripulisci='sudo apt autoremove -y'

# FSTRIM
alias trimma='sudo fstrim -a -v'
alias trimtimer='sudo systemctl status fstrim.timer'
alias trimservice='sudo systemctl status fstrim.service'

echo " Alias disponibili"
echo " per aggiornamento sistema : upd      | upg       | aggiorna"
echo "                             fupgrade | dupgrade  | ripulisci"
echo ""
echo " per gestione sistema :      lsa      | lsdisk    | temp"
echo "                             riavvia  | spegni"
echo ""
echo " per la gestione di FSTRIM : trimma   | trimtimer | trimservice"
echo ""
