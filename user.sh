# DB_HOST="localhost"
# DB_USER="varshita"
# DB_PASS="root"
# DB_NAME="quiz"

#   function welcome() {
#    zenity --notification --text "Hello, Hi , This is a quizeeee day ."
#    zenity --info --title "Quiz Platform" --text "Welcome to Quiz Platform!"
#  }
# function show_menu() {
#     choice=$(zenity --list --title "Quiz Platform" --text "Who are you?" --column "Option" --column "Description" 1 "New User! Register yourself, WELCOME" 2 "Already a User! Login and enjoy" --width=550  --height=350)
# }

# function register() {
#     user_name=$(zenity --entry --title "Register New User" --text "Enter your Name:")
#     email=$(zenity --entry --title "Register New User" --text "Enter your Email Id:")
    
#     while true; do
#         password=$(zenity --password --title "Register New User" --text "Enter your Password:")
#         confirm_password=$(zenity --password --title "Register New User" --text "Enter your Confirm Password:")
        
#         if [ $? -ne 0 ]; then
#             zenity --error --title "Register New User" --text "User cancelled the input."
#             exit 1
#         fi
        
#         if [ "$password" == "$confirm_password" ]; then
#             mysql -u $DB_USER -p$DB_PASS -D $DB_NAME -e "INSERT INTO user_credentials (user_name, email, password) VALUES ('$user_name', '$email', '$password')"
            
#             if [ $? -eq 0 ];
#              then
#                 zenity --info --title "Register New User" --text "Registration successful."
#                 source Login.sh
#             break

#             else
#                 zenity --error --title "Register New User" --text "Failed to register user. Please try again."
#             fi
#         else
#             zenity --error --title "Register New User" --text "Password do not match. Please try again."
#         fi
#     done
# }

# welcome
# show_menu
# register
# source Login.sh


 DB_HOST="localhost"
 DB_USER="varshita"
 DB_PASS="root"
 DB_NAME="quiz"

    function welcome() {
    zenity --notification --text "Hello, Hi , This is a quizeeee day ."
    zenity --info --title "Quiz Platform" --text "Welcome to Quiz Platform!"
  }

  function show_menu() {
    choice=$(zenity --list --title "Quiz Platform" --text "Who are you?" --column "Option" --column "Description" 1 "New User! Register yourself, WELCOME" 2 "Already a User! Login and enjoy" --width=550  --height=350)
# source adminlogin.sh

case $choice in
1)
source Register.sh
break
;;
2)
source Login.sh
;;
    *) 
    echo "Invalid Choice"
    break
    esac
 }

 show_menu
