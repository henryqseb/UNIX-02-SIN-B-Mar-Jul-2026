gpg --list-secret-keys --keyid-format=long
gpg --armor --export-secret-keys 
gpg --armor --export chineado12@gmail.com > mi_llave_publica.asc
gpg --list-keys
gpg --import IsaakR_llave_publica.asc "Importar la llave de mi compañero"