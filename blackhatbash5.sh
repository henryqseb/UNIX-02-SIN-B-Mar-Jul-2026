#! /bin/bash
touch test && touch test123

(ls; ps)

ls; ps; whoami

lzl || echo "el comando lzl fallo"

ls -l / &> stdout_and_stderr.txt
cat stdout_and_stderr.txt
ls -l / l> stdout.txt 2>stderr.txt
ls -l / 1> stdout.txt 2> stderr.txt
cat stdout_and_stderr.txt
lzl 2> error.txt
 cat error.txt

 echo "uno-uno" > archivo.txt
cat archivo.txt
echo "dos-dos" >> archivo.txt
cat archivo.txt
echo "tres" &> archivo.txt
cat archivo.txt
echo "tres" &>> archivo.txt