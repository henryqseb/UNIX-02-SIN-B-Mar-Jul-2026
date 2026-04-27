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
#Part 3
umask 077
touch secreto.txt
mkdir privado
#Commands
#Part 4
umask 022
whoami
echo "Hola">mi_archivo
ls-l mi_archivo
#These commands configure default permissions, 
#identify the user, create a text file, and display its detailed attributes.

sudo useradd -m -s /usr/bin/zsh luna
sudo chown luna mi_arcihvo
ls -l mi_archivo