

DB_HOST="localhost"
DB_USER="varshita"
DB_PASS="root"
DB_NAME="quiz"


function login() { 
    email=$(zenity --title "WELCOME TO THE QUIZ PLATFROM" --entry --text "Enter your email!: " --width=400 --height=100 --entry-text "" --ok-label="Login" --cancel-label="Cancel" --entry-text="")
    password=$(zenity --title "Login to Quizee" --password --text "Enter your Password: " --width=400 --height=100 --ok-label="Login" --cancel-label="Cancel")

 
    result=$(mysql -u $DB_USER -p$DB_PASS -D $DB_NAME -se "SELECT email FROM user_credentials WHERE email='$email' AND password ='$password'") 

    if [[ -n "$result" ]]; then 
        zenity --title "Login to Quizee" --info --text "Login successful! Have fun with the questions!" --width=400 --height=100 --ok-label="Ok" 
        quizpage "$email"
        

    else
        try_again_option=$(zenity --title "Login to Quizee" --question --text "Invalid email or password. Do you want to try again?" --width=400 --height=100 --ok-label="Yes" --cancel-label="No")

        if [ "$try_again_option" == "Yes" ]; then 
            login 
        else 
            #reset_password_option=$(zenity --title "Login to Quizee" --question --text "Do you want to reset your password?" --width=400 --height=100 --ok-label="Yes" --cancel-label="No")

            #if [ "$reset_password_option" == "Yes" ]; then 
             #   reset_password 
            #else 
        zenity --title "Login to Quizee" --info --text "PLEASE TRY TO LOGIN AGAIN, !" --width=400 --height=100 --ok-label="Ok"
            #fi 
        fi 
    fi 
}

login
source view.sh