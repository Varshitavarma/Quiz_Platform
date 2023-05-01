

# echo "----Welcome to Quiz Platform----"

# echo "Who are you ??"
# echo "1. New User! Register yourself"
# echo "2. Already a user! Login"

# read -p "Select your option: " option

# case $option in
# 1)
# source Register.sh
# register
# ;;

# 2)
# source Login.sh
# login
# ;;
# esac


#!/bin/bash

DB_HOST="localhost"
DB_USER="varshita"
DB_PASS="root"
DB_NAME="quiz"

function welcome() {
    zenity --notification --text "Hello, Hi , THis is a quizeeee day ."
    zenity --info --title "Quiz Platform" --text "Welcome to Quiz Platform!"
}
response=$(zenity --list \
                   --title="Choose your role" \
                   --radiolist \
                   --column="ID" \
                   --column="Name" \
                   1 "User" \
                   2 "Publisher" \
                   --width=250 \
                   --height=150 \
                   --ok-label="OK" \
                   --cancel-label="Exit")


case $? in
    0)  
        case $response in
            1)
              
                echo "User selected"
                ;;
            *)
                echo "Publisher selected"
                ;;
            
        esac
        ;;
    1 | -1)
       
        exit
        ;;
esac



function show_menu() {
    choice=$(zenity --list --title "Quiz Platform" --text "Who are you?" --column "Option" --column "Description" 1 "New User! Register yourself" 2 "Already a user! Login")
    
    case $choice in
        1)
            source Register.sh
            register
            exit 1
            ;;

        2)
            source Login.sh
            login
            ;;
        *)
           
            exit 1
            ;;
    esac
}


welcome

show_menu
