# System
alias lsa='ls -la'
alias lsdisk='lsblk -p | grep "disk\|part"'
alias riavvia='sudo reboot'
alias spegni='sudo shutdown now'

# Package Manager
alias upd='sudo apt update'
alias upg='sudo apt full-upgrade -y'
alias aggiorna='sudo apt update && sudo apt full-upgrade -y'
alias upgdist='sudo apt update && sudo apt dist-upgrade -y'
alias ripulisci='sudo apt autoremove -y'
alias fupgrade='sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y'

echo " Alias disponibili: upd      | upg       | upgdist"
echo "                    aggiorna | ripulisci | fupgrade"
echo "                    lsa      | lsdisk"
echo "                    riavvia  | spegni"
