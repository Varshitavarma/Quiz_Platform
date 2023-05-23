# Set database connection parameters
DB_HOST="localhost"
DB_USER="varshita"
DB_PASS="root"
DB_NAME="quizdata"

function create_quiz(){

quiz_name=$(zenity --title "Name your Quiz" --entry --text "Enter your quiz name " --width=900 --height 500)
amountofques=$(zenity --title "No. of Questions" --entry --text "How many questions do you wnat to add in your quiz" --width=900 --height 500)

mysql -u $DB_USER -p$DB_PASS -D $DB_NAME -e "create table $quiz_name (sno int auto_increment, question varchar(255) not null, option1 varchar(255) not null, option2 varchar(255) not null, option3 varchar(255) not null, option4 varchar(255) not null, answer varchar(255) not null, primary key (sno) )"
i=1
while [ $i -le $amountofques ]; do
question=$(zenity --title "Question" --entry --text "Enter the question" --width=500 --height 500)
option1=$(zenity --title "Options" --entry --text "Enter option1" --width=500 --height 500)
option2=$(zenity --title "Options" --entry --text "Enter option2" --width=500 --height 500)
option3=$(zenity --title "Options" --entry --text "Enter option3" --width=500 --height 500)
option4=$(zenity --title "Options" --entry --text "Enter option4" --width=500 --height 500)
answer=$(zenity --title "Correct Answer" --entry --text "Enter Correct Answer" --width=500 --height 500)
mysql -u $DB_USER -p$DB_PASS -D $DB_NAME -e "insert into $quiz_name values('$i','$question','$option1','$option2','$option3','$option4','$answer')"

if [ $? -eq 0 ]; 
then
zenity --title "Added" --info --text "Question added successfully" --width=500 --height 500
fi
((i++))
done
}
create_quiz
