DB_USER="varshita"
DB_PASS="root"
DB_NAME="quizdata"



viewQuiz() {
   
    quizzes=$(mysql -u $DB_USER -p$DB_PASS -e "USE $DB_NAME; SHOW TABLES;" | awk '{print $1}')

    
    selectedQuiz=$(zenity --list --title="Select Quiz" --column="Quizzes" "${quizzes[@]}")
    if [ -z "$selectedQuiz" ]; then
        zenity --error --title="Error" --text="No quiz selected."
        return
    fi

    
    quizData=$(mysql -u $DB_USER -p$DB_PASS -se "USE $DB_NAME; SELECT * FROM $selectedQuiz;")

    
    zenity --text-info --title="Quiz: $selectedQuiz" --width=900 --height=600 --editable --filename=quiz.txt <<< "$quizData"
}


quizpage() {
    DB_USER="varshita"
    DB_PASS="root"
    DB_NAME="quizdata"

   
    tables=$(mysql -u $DB_USER -p$DB_PASS -e "USE $DB_NAME; SHOW TABLES;" | awk '{print $1}')

   
    tables_array=()
    while read -r line; do
        tables_array+=("$line")
    done <<< "$tables"

    
    MYSQL_TABLE=$(zessnity --list --title="Select a table" --column="Tables" "${tables_array[@]}")

    
    counter=$(mysql -u $DB_USER -p$DB_PASS -se "USE $DB_NAME; SELECT COUNT(question) FROM $MYSQL_TABLE;")
    echo "Total Questions: $counter"

    
    score=0
    i=0

    
    while [ $i -lt $counter ]; do
        
        question=$(mysql -u $DB_USER -p$DB_PASS -se "USE $DB_NAME; SELECT question FROM $MYSQL_TABLE LIMIT $i, 1;")
        option1=$(mysql -u $DB_USER -p$DB_PASS -se "USE $DB_NAME; SELECT option1 FROM $MYSQL_TABLE LIMIT $i, 1;")
        option2=$(mysql -u $DB_USER -p$DB_PASS -se "USE $DB_NAME; SELECT option2 FROM $MYSQL_TABLE LIMIT $i, 1;")
        option3=$(mysql -u $DB_USER -p$DB_PASS -se "USE $DB_NAME; SELECT option3 FROM $MYSQL_TABLE LIMIT $i, 1;")
        option4=$(mysql -u $DB_USER -p$DB_PASS -se "USE $DB_NAME; SELECT option4 FROM $MYSQL_TABLE LIMIT $i, 1;")
        answer=$(mysql -u $DB_USER -p$DB_PASS -se "USE $DB_NAME; SELECT answer FROM $MYSQL_TABLE LIMIT $i, 1;")

        
        options=("$option1" "$option2" "$option3" "$option4")

       
        choice=$(zenity --title "$question" --list --radiolist --column "" --column "Options" FALSE "${options[0]}" FALSE "${options[1]}" FALSE "${options[2]}" FALSE "${options[3]}" FALSE "${options[4]}")

        echo "Choice: $choice"

       
        if [[ $choice == $answer ]]; then
            ((score++))
        fi

        
        ((i++))
    done

   
    zenity --info --title="COMPLETED" --text="YOU HAVE COMPLETED THE QUIZ AND YOUR SCORE IS: $score"

    
    username=$(mysql -u $DB_USER -p$DB_PASS -se "USE quiz; SELECT user_name FROM user_credentials WHERE email='$1'")

  
    $(mysql -u $DB_USER -p$DB_PASS -se "USE quiz; INSERT INTO quiz_scores VALUES ('$username', '$score', '$MYSQL_TABLE')")
}







quizpage 
