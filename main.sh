# function welcome(){
#     echo "Hello, Hi, This is a quiz day."
#     echo "Welcome to quiz platform."
# }
 
#  echo "1. User"
#  echo "2. Publisher"
#  read -p "Choose your role..." choice

# case $choice in
#     1)
#     echo "User selected.."
#     source user.sh
#     ;;
#     2)
#     echo "Publisher selected..."
#     source publisher.sh
#     ;;
#     *)
#     echo "Invalid  choice..."
# esac
# exit 1







#!/bin/bash

 function welcome() {
     zenity --notification --text "Hello, Hi, This is a quiz day."
     zenity --info --title "Quiz Platform" --text "Welcome to Quiz Platform!"
 }
 welcome

zenity --list --title="Quiz Platform" --radiolist --column="Select" --column="Role" \
    FALSE "User" \
    FALSE "Publisher" \
    --height=500 --width=600 --text="Choose your role..." \
    2>/dev/null | while read -r choice; do
        case "$choice" in
            "User")
                echo "User selected..."
                source user.sh
                ;;
            "Publisher")
                echo "Publisher selected..."
                source publisher.sh
                ;;
            *)
                echo "Invalid choice..."
                ;;
        esac
    done

exit 1



# DB_HOST="localhost"
# DB_USER="varshita"
# DB_PASS="root"
# DB_NAME="quiz"

# function welcome() {
#     zenity --notification --text "Hello, Hi, This is a quiz day."
#     zenity --info --title "Quiz Platform" --text "Welcome to Quiz Platform!"
# }
#  response=$(zenity --list \
#                    --title="Choose your role" \                    --radiolist \
#                    --column="ID" \
#                    --column="Name" \
#                    1 "User" \
#                    2 "Publisher" \
#                   --width=550 \
#                    --height=350 \
#                    --ok-label="OK" \
#                    --cancel-label="Exit")

# case $? in
#     0)
#         case $response in
#             1)
#                 echo "User selected"
#                 echo "Sourcing user.sh..."
#                 source Register.sh
#                 ;;             2)                 echo "Publisher selected"                 echo "Sourcing publisher.sh..."                 source publisher.sh
#                 ;;
#             *)
#             echo "invalid choice"
#             ;;             
#             esac         
#             ;;     
#             1 | 2 | -1)
#          exit       ;;
#  esac

