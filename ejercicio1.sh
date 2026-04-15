echo '#!/bin/sh' > hola.sh
#This command generates another script with the name we gave it, in this case hola.sh
echo 'echo "Hola desde mi primer script"' >> hola.sh
#Write hello this is my first script in the file generated with the previous command
cat hola.sh
#It reads and shows me the command which was saved in the file
./hola.sh
#Our command is not executed, resulting in an access denied result.