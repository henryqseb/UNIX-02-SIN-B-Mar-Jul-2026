#! /bin/bash
#ALL
awk '{print $1,$2,$3}' log.txt
#1
awk '{print $1}' log.txt
#2
awk '{print $2}' log.txt
#3
awk '{$3}' log.txt

awk '{print $1,$NF}' log.txt

awk 'NR < 10' log.txt

head log.txt
