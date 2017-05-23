# BASH ALIASES

# Clear the terminal
alias cls='clear'

# Apt Stuff
alias apt-install='sudo apt-get install'
alias apt-search='apt-cache search'
alias apt-show='apt-cache show'
alias apt-purge='sudo apt-get --purge  remove'
alias apt-remove='sudo apt-get remove'
alias apt-up="sudo apt-get update && sudo apt-get upgrade"
alias apt-up+r="apt-up -y && sudo reboot"
alias apt-policy="LANG=C apt-cache policy"