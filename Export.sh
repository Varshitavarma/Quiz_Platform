#Changes need to be made in file names

# Get the name of the bash file from the user.
echo "Enter the name of the bash file:"
read bash_file

# Check if the file exists.
if [ ! -f "$bash_file" ]; then
  echo "The file '$bash_file' does not exist."
  exit 1
fi

# Create a new Excel sheet.
excel_file="export.xlsx"

# Open the Excel sheet.
excel=$(open "$excel_file")

# Get the number of lines in the bash file.
line_count=$(wc -l < "$bash_file")

# Loop through the lines in the bash file.
for (( i=1; i<=line_count; i++ )); do

  # Get the line from the bash file.
  line=$(sed -n "$i"p "$bash_file")

  # Write the line to the Excel sheet.
  echo "$line" >> "$excel_file"

done

# Close the Excel sheet.
excel_close "$excel"

# Display a message to the user.
echo "Data successfully transferred to Excel sheet."
