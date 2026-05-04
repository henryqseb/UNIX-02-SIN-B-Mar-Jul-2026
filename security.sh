#Commands
id
#display the actual and 
#effective user and group identifiers for the current session.
cat /etc/passwd | head -10
#Displays the first 10 lines of /etc/passwd, the file that lists system 
#accounts, their IDs, home folders, and startup shells.
cat /etc/group | head -10
#Read the first ten lines of the /etc/group file 
#to show the first ten user groups defined on the system.
groups
#Displays the names of the groups to which your current user belongs
groups $USER
#Use the $USER environment variable containing your 
#username as an argument to search for information in /etc/group.
id -u
#User ID
id -g
#Group ID principal
id -G
#All the groups
cat /etc/group | head -n 5
#It displays the first five lines of the /etc/group file,
#exposing the basic configuration of the first five user groups defined in the system.
cat /etc/gshadow | head -n 5
#Display the first five lines of the /etc/gshadow 
#file, which contains the encrypted passwords and administrative information for the system groups.