#!/bin/bash

# Set database connection parameters
DB_HOST="localhost"
DB_USER="varshita"
DB_PASS="root"
DB_NAME="quiz"

function register() {
    user_name=$(zenity --entry --title "Register New admin" --text "Enter your Name:")
    email=$(zenity --entry --title "Register New admin" --text "Enter your Email Id:")
    
    while true; do
        password=$(zenity --password --title "Register New admin" --text "Enter your Password:")
        confirm_password=$(zenity --password --title "Register New admin" --text "Enter your Confirm Password:")
        
        if [ $? -ne 0 ]; then
            zenity --error --title "Register New admin" --text "admin cancelled the input."
            exit 1
        fi
        
        if [ "$password" == "$confirm_password" ]; then
            mysql -u $DB_USER -p$DB_PASS -D $DB_NAME -e "INSERT INTO publisher_cred (user_name, email, password) VALUES ('$user_name', '$email', '$password')"
            
            if [ $? -eq 0 ];
             then
                zenity --info --title "Register New User" --text "Registration successful."
            source adminlogin.sh
            break

            else
                zenity --error --title "Register New User" --text "Failed to register user. Please try again."
            fi
        else
            zenity --error --title "Register New User" --text "Password do not match. Please try again."
        fi
    done
}

register
