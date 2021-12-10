# System
alias lsa='ls -la'
alias riavvia='sudo reboot'
alias spegni='sudo shutdown now'

# Package Manager
alias upd='sudo apt update'
alias upg='sudo apt upgrade -y'
alias aggiorna='sudo apt update && sudo apt upgrade -y'
alias upgfull='sudo apt update && sudo apt full-upgrade -y'
alias upgdist='sudo apt update && sudo apt dist-upgrade -y'
alias ripulisci='sudo apt autoremove -y'

echo " Alias disponibili: upd      | upg      | ripulisci"
echo "                    aggiorna | upgfull  | upgdist  "
echo "                    lsa      | riavvia  | spegni   "
