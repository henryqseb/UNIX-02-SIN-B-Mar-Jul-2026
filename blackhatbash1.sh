#! /bin/bash
bash --version
env
echo ${SHELL }
echo ${RANDOM}
echo ${UID }
echo ${OSTYPE}
ps -e -f
ps -ef
df --human-readable
df -h
#bash blackhatbash1.sh
#The command executes an automated sequence of instructions 
#defined in the blackhatbash1.sh file using the Bash interpreter to perform specific administration or security tasks.

#$bash -r  blackhatbash1.sh
#This command runs the script in restricted mode, 
#drastically limiting the privileges and functions allowed to increase security during its execution.

#bash -n  blackhatbash1.sh
#The command bash -n blackhatbash1.sh checks the script's syntax for errors without executing any of the instructions contained within it.

set+x