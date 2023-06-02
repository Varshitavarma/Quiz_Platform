# #!/bin/bash

# schedule_quiz() {
    
#     quiz_name=$(zenity --entry --title "Quiz Scheduler" --text "Enter the quiz name:")
#     start_date=$(zenity --calendar --title "Quiz Scheduler" --text "Select the start date:")
#     start_time=$(zenity --entry --title "Quiz Scheduler" --text "Enter the start time (HH:MM):")
#     end_date=$(zenity --calendar --title "Quiz Scheduler" --text "Select the end date:")
#     end_time=$(zenity --entry --title "Quiz Scheduler" --text "Enter the end time (HH:MM):")

    
#     start_datetime="${start_date} ${start_time}"
#     end_datetime="${end_date} ${end_time}"

#     current_datetime=$(date +"%Y-%m-%d %H:%M")
#     start_duration=$(( $(date -d "$start_datetime" +%s) - $(date -d "$current_datetime" +%s) ))
#     end_duration=$(( $(date -d "$end_datetime" +%s) - $(date -d "$current_datetime" +%s) ))

#     if [ $start_duration -gt 0 ] && [ $end_duration -gt 0 ] && [ $end_duration -gt $start_duration ]; then
  
#         zenity --info --title "Quiz Scheduler" --text "Quiz: $quiz_name\nStart Time: $start_datetime\nEnd Time: $end_datetime"

#         sleep $start_duration

#         zenity --info --title "Quiz Scheduler" --text "It's time for the $quiz_name quiz!"

       
#         quiz_duration=$(( $end_duration - $start_duration ))
#         sleep $quiz_duration

        
#         zenity --info --title "Quiz Scheduler" --text "The $quiz_name quiz has ended."
#     else
#         zenity --error --title "Quiz Scheduler" --text "Invalid date or time. Please try again."
#     fi
# }


# schedule_quiz


#!/bin/bash

# # Function to schedule the quiz
# schedule_quiz() {
#     # Database connection details
#     db_host="localhost"
#     db_user="varshita"
#     db_password="root"
#     db_name="quiz"

#     # Display dialog boxes to enter quiz details
#     quiz_name=$(zenity --entry --title "Quiz Scheduler" --text "Enter the quiz name:")
#     start_date=$(zenity --calendar --title "Quiz Scheduler" --text "Select the start date:")
#     start_time=$(zenity --entry --title "Quiz Scheduler" --text "Enter the start time (HH:MM):")
#     end_date=$(zenity --calendar --title "Quiz Scheduler" --text "Select the end date:")
#     end_time=$(zenity --entry --title "Quiz Scheduler" --text "Enter the end time (HH:MM):")

#     # Format the start and end dates and times
#     start_datetime="${start_date} ${start_time}"
#     end_datetime="${end_date} ${end_time}"

#     # Calculate the duration until the quiz starts
#     current_datetime=$(date +"%Y-%m-%d %H:%M")
#     start_duration=$(( $(date -d "$start_datetime" +%s) - $(date -d "$current_datetime" +%s) ))
#     end_duration=$(( $(date -d "$end_datetime" +%s) - $(date -d "$current_datetime" +%s) ))

#     if [ $start_duration -gt 0 ] && [ $end_duration -gt 0 ] && [ $end_duration -gt $start_duration ]; then
#         # Display quiz details using Zenity dialog
#         zenity --info --title "Quiz Scheduler" --text "Quiz: $quiz_name\nStart Time: $start_datetime\nEnd Time: $end_datetime"

#         # Database insertion query
#         insert_query="INSERT INTO quiz_schedule (quiz_name, start_datetime, end_datetime) VALUES ('$quiz_name', '$start_datetime', '$end_datetime')"

#         # Execute database insertion query
#         mysql -h "$localhost" -u "$varshita" -p"$root" "$quiz_schedule" -e "$insert_query"

#         # Check if insertion was successful
#         if [ $? -eq 0 ]; then
#             sleep $start_duration
#             zenity --info --title "Quiz Scheduler" --text "It's time for the $quiz_name quiz!"
#             quiz_duration=$(( $end_duration - $start_duration ))
#             sleep $quiz_duration
#             zenity --info --title "Quiz Scheduler" --text "The $quiz_name quiz has ended."
#         else
#             zenity --error --title "Quiz Scheduler" --text "Failed to save quiz schedule in the database."
#         fi
#     else
#         zenity --error --title "Quiz Scheduler" --text "Invalid date or time. Please try again."
#     fi
# }

# # Call the function to schedule the quiz
# schedule_quiz


#!/bin/bash

# Function to schedule the quiz
schedule_quiz() {
    # Database connection details
    db_host="localhost"
    db_user="varshita"
    db_password="root"
    db_name="quiz"

    # Display dialog boxes to enter quiz details
    quiz_name=$(zenity --entry --title "Quiz Scheduler" --text "Enter the quiz name:")
    start_date=$(zenity --calendar --title "Quiz Scheduler" --text "Select the start date:")
    start_time=$(zenity --entry --title "Quiz Scheduler" --text "Enter the start time (HH:MM):")
    end_date=$(zenity --calendar --title "Quiz Scheduler" --text "Select the end date:")
    end_time=$(zenity --entry --title "Quiz Scheduler" --text "Enter the end time (HH:MM):")

    # Format the start and end dates and times
    start_datetime="${start_date} ${start_time}"
    end_datetime="${end_date} ${end_time}"

    # Calculate the duration until the quiz starts
    current_datetime=$(date +"%Y-%m-%d %H:%M")
    start_duration=$(( $(date -d "$start_datetime" +%s) - $(date -d "$current_datetime" +%s) ))
    end_duration=$(( $(date -d "$end_datetime" +%s) - $(date -d "$current_datetime" +%s) ))

    if [ $start_duration -gt 0 ] && [ $end_duration -gt 0 ] && [ $end_duration -gt $start_duration ]; then
      
        zenity --info --title "Quiz Scheduler" --text "Quiz: $quiz_name\nStart Time: $start_datetime\nEnd Time: $end_datetime"

       
        insert_query="INSERT INTO quiz (quiz_name, start_datetime, end_datetime) VALUES ('$quiz_name', '$start_datetime', '$end_datetime')"

       
        mysql -h "$localhost" -u "$varshita" -p"$root" "$quiz" -e "$insert_query"

        if [ $? -eq 0 ]; then
            sleep $start_duration
            zenity --info --title "Quiz Scheduler" --text "It's time for the $quiz_name quiz!"
            quiz_duration=$(( $end_duration - $start_duration ))
            sleep $quiz_duration
            zenity --info --title "Quiz Scheduler" --text "The $quiz_name quiz has ended."
        else
            zenity --error --title "Quiz Scheduler" --text "Failed to save quiz schedule in the database."
        fi
    else
        zenity --error --title "Quiz Scheduler" --text "Invalid date or time. Please try again."
    fi
}

schedule_quiz
