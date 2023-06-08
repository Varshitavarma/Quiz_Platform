data = $(sqlplus -s /NOLOG << EOF SELECT * FROM questions; EOF)

csv_file = "questions.csv"
echo "$data" > "$csv_file"
excel_file = "questions.xlsx"
excel -o "$excel_file" -s "$csv_file"
