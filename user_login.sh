# # function user(){
# choice=$(zenity --list --title="QUIZZYY" --text="LOGIN OR REGISTER" --column="portals" LOGIN REGISTER EXIT --width=600 --height 400)



# case $choice in


# LOGIN) 
# source login.sh ;;
# REGISTER) 
# source project.sh ;;
# EXIT) 
# exit ;;
# *) 
# zenity --info --title="QUIZZY" --error "Invalid Choice. Please Try Again!" --width=100 --height=50



# esac
# }
# user

function user() {
    # Display login/register dialog
    choice=$(zenity --list --title="QUIZZYY" \
                    --text="LOGIN OR REGISTER" \
                    --column="Portal" \
                    LOGIN \
                    REGISTER \
                    EXIT \
                    --width=600 \
                    --height=400 \
                    --ok-label="OK" \
                    --cancel-label="EXIT")
    
    # Handle user response
    case $? in
        0)  # OK button was clicked
            case $choice in
                "LOGIN") source login.sh ;;
                "REGISTER") source project.sh ;;
                *) zenity --info --title="QUIZZY" \
                         --error "Invalid Choice. Please Try Again!" \
                         --width=100 \
                         --height=50 ;;
            esac
            ;;
        1 | -1) exit ;;  # Cancel button was clicked or dialog was closed
    esac
}

user