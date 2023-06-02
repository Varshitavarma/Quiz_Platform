
# #!/bin/bash

# DB_USER="varshita"
# DB_PASS="root"
# DB_NAME="quizdata"

# # Function to create a new quiz
# createQuiz() {
#     # Prompt the publisher for quiz details
#     quizName=$(zenity --entry --title="Create Quiz" --text="Enter the quiz name:")
#     if [ -z "$quizName" ]; then
#         zenity --error --title="Error" --text="Quiz name cannot be empty."
#         return
#     fi

#     # Create a new table for the quiz
#     $(mysql -u $DB_USER -p$DB_PASS -e "USE $DB_NAME; CREATE TABLE $quizName (question VARCHAR(255), option1 VARCHAR(255), option2 VARCHAR(255), option3 VARCHAR(255), option4 VARCHAR(255), answer VARCHAR(255));")
#     zenity --info --title="Quiz Created" --text="Quiz '$quizName' created successfully."
# }

# # Function to view a quiz
# viewQuiz() {
#     # Retrieve the list of quizzes from the database
#     quizzes=$(mysql -u $DB_USER -p$DB_PASS -e "USE $DB_NAME; SHOW TABLES;" | awk '{print $1}')

#     # Prompt the publisher to select a quiz
#     selectedQuiz=$(zenity --list --title="Select Quiz" --column="Quizzes" "${quizzes[@]}")
#     if [ -z "$selectedQuiz" ]; then
#         zenity --error --title="Error" --text="No quiz selected."
#         return
#     fi

#     # Fetch all questions and options from the selected quiz
#     quizData=$(mysql -u $DB_USER -p$DB_PASS -se "USE $DB_NAME; SELECT * FROM $selectedQuiz;")

#     # Display the quiz data in a dialog box
#     zenity --text-info --title="Quiz: $selectedQuiz" --width=500 --height=400 --editable --filename=quiz.txt <<< "$quizData"
# }

# # Function to display the quiz
# quizpage() {
#     DB_USER="varshita"
#     DB_PASS="root"
#     DB_NAME="quizdata"

#     # Retrieve the list of tables from the database
#     tables=$(mysql -u $DB_USER -p$DB_PASS -e "USE $DB_NAME; SHOW TABLES;" | awk '{print $1}')

#     # Convert the table list into an array
#     tables_array=()
#     while read -r line; do
#         tables_array+=("$line")
#     done <<< "$tables"

#     # Prompt the user to select a table
#     MYSQL_TABLE=$(zenity --list --title="Select a table" --column="Tables" "${tables_array[@]}")

#     # Get the total number of questions in the selected table
#     counter=$(mysql -u $DB_USER -p$DB_PASS -se "USE $DB_NAME; SELECT COUNT(question) FROM $MYSQL_TABLE;")
#     echo "Total Questions: $counter"

#     # Initialize variables for score and loop counter
#     score=0
#     i=0

#     # Loop through each question
#     while [ $i -lt $counter ]; do
#         # Retrieve question, options, and answer from the database
#         question=$(mysql -u $DB_USER -p$DB_PASS -se "USE $DB_NAME; SELECT question FROM $MYSQL_TABLE LIMIT $i, 1;")
#         option1=$(mysql -u $DB_USER -p$DB_PASS -se "USE $DB_NAME; SELECT option1 FROM $MYSQL_TABLE LIMIT $i, 1;")
#         option2=$(mysql -u $DB_USER -p$DB_PASS -se "USE $DB_NAME; SELECT option2 FROM $MYSQL_TABLE LIMIT $i, 1;")
#         option3=$(mysql -u $DB_USER -p$DB_PASS -se "USE $DB_NAME; SELECT option3 FROM $MYSQL_TABLE LIMIT $i, 1;")
#         option4=$(mysql -u $DB_USER -p$DB_PASS -se "USE $DB_NAME; SELECT option4 FROM $MYSQL_TABLE LIMIT $i, 1;")
#         answer=$(mysql -u $DB_USER -p$DB_PASS -se "USE $DB_NAME; SELECT answer FROM $MYSQL_TABLE LIMIT $i, 1;")

#         # Store options in an array
#         options=("$option1" "$option2" "$option3" "$option4")

#         # Prompt the user to select an option using Zenity dialog
#         choice=$(zenity --title "$question" --list --radiolist --column "" --column "Options" FALSE "${options[0]}" FALSE "${options[1]}" FALSE "${options[2]}" FALSE "${options[3]}" FALSE "${options[4]}")

#         echo "Choice: $choice"

#         # Check if the choice is correct and increment the score
#         if [[ $choice == $answer ]]; then
#             ((score++))
#         fi

#         # Move to the next question
#         ((i++))
#     done

#     # Display the final score to the user using Zenity dialog
#     zenity --info --title="COMPLETED" --text="YOU HAVE COMPLETED THE QUIZ AND YOUR SCORE IS: $score"

#     # Get the username based on the email provided
#     username=$(mysql -u $DB_USER -p$DB_PASS -se "USE quiz; SELECT user_name FROM user_credentials WHERE email='$1'")

#     # Insert the score into the quiz_scores table
#     $(mysql -u $DB_USER -p$DB_PASS -se "USE quiz; INSERT INTO quiz_scores VALUES ('$username', '$score', '$MYSQL_TABLE')")
# }

# # Call the function with a sample email (you can replace it with the desired email)





# # Main menu
# mainMenu() {
#     while true; do
#         choice=$(zenity --list --title="Quiz Publisher" --column="Options" --hide-column=2 --width=300 --height=300 "Create Quiz" "View Quiz" "Exit")
        
#         case "$choice" in
#             "View Quiz")
#                 quizpage

#                 ;;
#             "Exit")
#                 break
#                 ;;
#             *)
#                 zenity --error --title="Error" --text="Invalid choice."
#                 ;;
#         esac
#     done
# }

# # Call the main menu
# mainMenu
# quizpage 











# echo "----Welcome to Quiz Platform----"
# echo "Who are you ??"
#  echo "1. New User! Register yourself"
#  echo "2. Already a user! Login"

#  read -p "Select your option: " option

# case $option in
#  source Register.sh
#  register
#  ;;

#  2)
#  source Login.sh
#  login
#  ;;
#  esac


# !/bin/bash

#  DB_HOST="localhost"
#  DB_USER="varshita"
#  DB_PASS="root"
#  DB_NAME="quiz"

#  function welcome() {
#     zenity --notification --text "Hello, Hi , This is a quizeeee day ."
#     zenity --info --title "Quiz Platform" --text "Welcome to Quiz Platform!"
# }
 





















#!/bin/bash

welcome() {
    zenity --info --text="Hello! This is a quiz day.\nWelcome to the quiz platform."
}

# Function to display User or Publisher selection dialog
select_role() {
    local role
    role=$(zenity --list --title="Quiz Platform" \
        --column="" --column="Role" \
        "" "<b>User</b>\n<i>Select this option to access as a User</i>" \
        "" "<b>Publisher</b>\n<i>Select this option to access as a Publisher</i>" \
        --height=200 --width=400 --hide-column=1 --html --separator="|")

    if [[ $? -eq 0 ]]; then
        case "$role" in
            "User|Select this option to access as a User")
                echo "User selected..."
                source user.sh
                ;;
            "Publisher|Select this option to access as a Publisher")
                echo "Publisher selected..."
                source publisher.sh
                ;;
            *)
                echo "Invalid choice..."
                ;;
        esac
    fi
}

welcome
select_role

exit 1
