DB_HOST="localhost"
DB_USER="varshita"
DB_PASS="root"
DB_NAME="quiz"


function show_menu() {
    choice=$(zenity --list --title "Quiz Platform" --text "Who are you?" --column "Option" --column "Description" 1 "New Publisher! Register yourself" 2 "Already a Admin! Login" --width=550  --height=350)
# source adminlogin.sh

case $choice in
1)
source adminregister.sh
break
;;
2)
source adminlogin.sh
;;
    *) 
    echo "Invalid Choice"
    break
    esac
 }

 show_menu
