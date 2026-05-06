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
#file, which contains the encrypted passwords and administrative in
#formation for the system groups.

#addgroup, groupadd, chgrp, newgrp
#basic sintax
#groupadd [opciones] nombre_grupo
#create a simple group
sudo groupadd desarrolladores
sudo groupadd -g 2000 operaciones #GID especifico
#system group (GID<1000)
sudo groupadd --system serivicios_web
#verify to create
grep "desarrolladores\|operaciones\|serivcios_web" /etc/goup
grep -E "desarrolladores|operaciones|servicios_web" /etc/group
#View principal options
groupadd --help
#see the GID range in the system
grep "GID_MIN\|GID_MAX\|SYS_GID" /etc/login.defs
#System groups have a GID lower than the user minimum
#In UBUNTU typically:
#SYS_GID:MIN = 100
#SYS_GID_MAX = 999
#GID_MIN = 1000
#GID_MAX = 60000

#Basic Sintax
#addgroup [opciones] nombre_grupo
#create groups with addgroup
sudo addgroup diseno
sudo addgroup --gid 2100 marketing
sudo addgroup --system cache_web
#Verify
grep "diseno\|marketing\|cache_web" /etc/group

#see witch groups the current user belongs to
groups
id
#Add a user to a group with usermod (low level)
sudo usermod -aG desarrolladores $USER
sudo usermod -aG diseño $USER

#verify the change in /etc/group
grep "desarroladores\|diseno" /etc/group
#add user to group with adduser(high level, debian)
adduser $USER root marketing
#see current status
id $USER root
grep $USER root /etc/group
#create a temporary group for a the demo
groupadd grupo_temporal
usermod -aG grupo_temporal $USER root
#Now  the error :usermod without -a
usermod -G desarrolladores $USER roo
#this removes all secondary groups except "desarroladores"
id $USER #lost all other groups
#Restore
usermod -aG diseno,marketing,grupo_temporal $USER root
id $USER #restored
#prepare the practice scenario
mkdir -p ~/lab_chgrp/{proyectos,reportes,scripts}
touch ~/lab_chgrp/proyectos/app.py
touch ~/lab_chgrp/proyectos/config.json
touch ~/lab_chgrp/reportes/informe.txt
touch ~/lab_chgrp/scripts/deploy.sh
#View the initial state -- everyone has the usergroup
ls -la ~/lab_chgrp/reportes/
ls -la ~/lab_chgrp/reportes/


