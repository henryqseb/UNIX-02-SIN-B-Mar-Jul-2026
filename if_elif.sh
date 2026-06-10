#!/bin/bash
USER_INPUT="${1}"
# Stores the first command-line argument provided by the user
# in the USER_INPUT variable.
if [[ -z "${USER_INPUT}" ]]; then
# Checks whether the USER_INPUT variable is empty or null.
# This allows the script to verify that the user provided an argument.
echo "You must provide an argument!"
# Displays a message indicating that an argument is required.
exit 1
# Terminates the script immediately with an error status code of 1.
fi 
# End of the first conditional statement.
if [[ -f "${USER_INPUT}" ]]; then
# Checks whether the argument corresponds to an existing file.
# The -f test operator is used to perform this verification.
echo "${USER_INPUT} is a file." 
 # If the condition is true, informs the user that the argument is a file.
elif [[ -d "${USER_INPUT}" ]]; then
# If the file test fails, checks whether the argument is a directory.
# The -d test operator is used to verify directories.
echo "${USER_INPUT} is a directory."
# If the condition is true, informs the user that the argument is a directory.

else  
echo "${USER_INPUT} is not a file or a directory."
    # Displays a message indicating that the argument is neither
    # a file nor a directory.

fi