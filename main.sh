

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
    zenity --notification --text "Hello, Hi , This is a quizeeee day ."
    zenity --info --title "Quiz Platform" --text "Welcome to Quiz Platform!"
}
response=$(zenity --list \
                   --title="Choose your role" \
                   --radiolist \
                   --column="ID" \
                   --column="Name" \
                   1 "User" \
                   2 "Publisher" \
                   --width=550 \
                   --height=350 \
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
                # source questions.sh
                ;;
            
        esac
        ;;
    1 | -1)
       
        exit
        ;;
esac

# function schedule_quiz() {
#     name=$(zenity --entry --title "Quiz Scheduler" --text "Enter your name:")
#     datetime=$(zenity --calendar --title "Quiz Scheduler" --text "Select the scheduled date and time:" --date-format="%Y-%m-%d %H:%M" --editable)
#     formatted_datetime=$(date -d "$datetime" +'%Y-%m-%d %H:%M:%S')

#     mysql -h $DB_HOST -u $DB_USER -p$DB_PASS -D $DB_NAME -e "INSERT INTO quiz_schedule (user_name, scheduled_time) VALUES ('$name', '$formatted_datetime');"

#     zenity --info --title "Quiz Scheduler" --text "Quiz scheduled successfully!"
# }



function show_menu() {
    choice=$(zenity --list --title "Quiz Platform" --text "Who are you?" --column "Option" --column "Description" 1 "New User! Register yourself" 2 "Already a user! Login" --width=550  --height=350)
    
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


show_menu
# i need a option where i can get the option to add the questions in thetable where all the quizes are made.