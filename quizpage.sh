#!/bin/bash

quizpage(){
DB_USER="varshita"
DB_PASS="root"
DB_NAME="quizdata"


tables=$(mysql -u $DB_USER -p$DB_PASS -e "USE quizdata; SHOW TABLES;" | awk '{print $1}')

        tables_array=()
        while read -r line; do
        tables_array+=("$line")
        done <<< "$tables"


        MYSQL_TABLE=$(zenity --list --title="Select a table" --column="Tables" "${tables_array[@]}")




        counter=$(mysql -u $DB_USER -p$DB_PASS -se "USE quizdata; SELECT count(question) FROM ${MYSQL_TABLE};")
        echo $counter



        i=0
        score=0



        while [ $i -lt $counter ]; do
        if [ $i == 0 ]; then
        question=$(mysql -u $DB_USER -p$DB_PASS -se "USE quizdata; SELECT question FROM $MYSQL_TABLE LIMIT 1;")
        option1=$(mysql -u $DB_USER -p$DB_PASS -se "USE quizdata; SELECT option1 FROM $MYSQL_TABLE LIMIT 1;")
        option2=$(mysql -u $DB_USER -p$DB_PASS -se "USE quizdata; SELECT option2 FROM $MYSQL_TABLE LIMIT 1;")
        option3=$(mysql -u $DB_USER -p$DB_PASS -se "USE quizdata; SELECT option3 FROM $MYSQL_TABLE LIMIT 1;")
        option4=$(mysql -u $DB_USER -p$DB_PASS -se "USE quizdata; SELECT option4 FROM $MYSQL_TABLE LIMIT 1;")
        answer=$(mysql -u $DB_USER -p$DB_PASS -se "USE quizdata; SELECT answer FROM $MYSQL_TABLE LIMIT 1;")
        options=( "$option1" "$option2" "$option3" "$option4" )



        choice=$(zenity --title "$question" --list --radiolist --column "" --column "Options" FALSE "$option1" FALSE "$option2" FALSE "$option3" FALSE "$option4")
        echo $choice



        if [[ $choice == $answer ]]; then
        ((score++))
        fi



        else



        question=$(mysql -u $DB_USER -p$DB_PASS -se "USE quizdata; SELECT question FROM $MYSQL_TABLE LIMIT $i, 1;")
        option1=$(mysql -u $DB_USER -p$DB_PASS -se "USE quizdata; SELECT option1 FROM $MYSQL_TABLE LIMIT $i, 1;")
        option2=$(mysql -u $DB_USER -p$DB_PASS -se "USE quizdata; SELECT option2 FROM $MYSQL_TABLE LIMIT $i, 1;")
        option3=$(mysql -u $DB_USER -p$DB_PASS -se "USE quizdata; SELECT option3 FROM $MYSQL_TABLE LIMIT $i, 1;")
        option4=$(mysql -u $DB_USER -p$DB_PASS -se "USE quizdata; SELECT option4 FROM $MYSQL_TABLE LIMIT $i, 1;")
        answer=$(mysql -u $DB_USER -p$DB_PASS -se "USE quizdata; SELECT answer FROM $MYSQL_TABLE LIMIT $i, 1;")
        options=( "$option1" "$option2" "$option3" "$option4" )



        choice=$(zenity --title "$question" --list --radiolist --column "" --column "Options" FALSE "$option1" FALSE "$option2" FALSE "$option3" FALSE "$option4")
        echo $choice
        if [[ $choice == $answer ]]; then
        ((score++))
        fi




        fi



        #options=( "$option1" "$option2" "$option3" "$option4" )


        ((i++))


        done


        zenity --info --title="COMPLETED" --text="YOU HAVE COMPLETED THE QUIZ AND YOUR SCORE IS: $score"
        username=$(mysql -u $DB_USER -p$DB_PASS -se "USE quiz; Select user_name from user_credentials where email='$1'")
        $(mysql -u $DB_USER -p$DB_PASS -se "USE quiz; INSERT INTO quiz_scores values('$username','$score','$MYSQL_TABLE')")
}