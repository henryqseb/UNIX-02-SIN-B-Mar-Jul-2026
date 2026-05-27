#See the current main group
id
id -gn #only the name of the main group
#create an archive and see which group I inherited
touch ~/test_grupo_heredero.txt
ls -la ~/test_grupo_heredero.txt
#the group is the user's primary group
echo "Grupo actual: $(id-gn")

#create the file before the newgrp

touch ~/antes_de_newgrp.txt
ls -la ~/antes_de_newgrp.txt