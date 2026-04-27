#!/bin/sh
echo "Hola desde mi primer script"
#default mask
$ umask
0022
#Change the mask to 027
umask 027
touch archivo2
mkdir directorio2
ls -l

