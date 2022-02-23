# Print the IP address
_IP=$(hostname -I) || true
_HOST=$(hostname) || true
if [ "$_IP" ]; then
  printf "\n\nCiao. Mi chiamo %s e mi trovi a questo indirizzo %s\n\n" "$_HOST" "$_IP"
fi

# System
alias lsa='ls -la'
alias lsdisk='lsblk -p | grep "disk\|part"'
alias temp='/usr/bin/vcgencmd measure_temp'
alias riavvia='sudo reboot'
alias spegni='sudo shutdown now'

# Package Manager
alias upd='sudo apt update'
alias upg='sudo apt full-upgrade -y'
alias aggiorna='sudo apt update && sudo apt full-upgrade -y'
alias upgdist='sudo apt update && sudo apt dist-upgrade -y'
alias ripulisci='sudo apt autoremove -y'
alias fupgrade='sudo apt update && sudo apt full-upgrade -y && sudo apt autoremove -y'

echo " Alias disponibili: upd      | upg       | upgdist"
echo "                    aggiorna | ripulisci | fupgrade"
echo "                    lsa      | lsdisk    | temp"
echo "                    riavvia  | spegni"
