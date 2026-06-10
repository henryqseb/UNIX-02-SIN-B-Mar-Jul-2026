#!/bin/bash
# This function checks if the current user ID equals zero.
check_if_root(){
    if [[ "${EUID}" -eq "0" ]]; then
        # Compares the Effective User ID (EUID) with 0.
    # In Linux, an EUID of 0 indicates that the user is root.
return 0
# Returns 0, which represents success (true) in Bash.

else
return 1
# Returns 1, which represents failure (false) in Bash.

fi
}
if check_if_root; then
# Calls the check_if_root function.
# If the function returns 0, the condition evaluates as true.
echo "User is root!"
 # Displays a message indicating that the current user has root privileges.
else
echo "User is not root!"
# Displays a message indicating that the current user does not have root privileges.
fi