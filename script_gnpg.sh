gpg --list-secret-keys --keyid-format=long
gpg --armor --export-secret-keys 
gpg --armor --export chineado12@gmail.com > mi_llave_publica.asc
gpg --list-keys
gpg --import IsaakR_llave_publica.asc "Importar la llave de mi compañero"
echo "este mensaje es secreto" > doc_no_cifrado.txt 
"Crear un nuevo documento para que le llegue mi mensaje cifrado"