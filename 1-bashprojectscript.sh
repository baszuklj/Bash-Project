#!/bin/bash
#Prompt user to put in correct file
read -p "Enter a file path: " file_path
if [ -f $file_path ]; then
input_file="$file_path"
else
  echo "Error: File '$file_path' does not exist"
  exit 0
fi

#Regex to find valid IP's in file
IP_regex="^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])$"

valid_IP=$(grep -E  "$IP_regex" "$input_file")


#Regex to find valid email addresses
email_regex="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,}$"

valid_email=$(grep -E  "$email_regex" "$input_file")

#Refex to find valid credit card number
credit_regex="^[1-9][0-9]{15}$"

valid_credit=$(grep -E "$credit_regex" "$input_file")


#Echos the valid IP's, email addresses, and credit card numbers
echo "The valid IP addresses in '$file_path' are: "
echo "$valid_IP"
echo " "
echo "The valid email addresses in '$file_path' are: "
echp "$valid_email"

echo "The valid credit card numbers are: "
echo "$valid_credit"
