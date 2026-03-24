gpg --armor --export chineado12@gmail.com > mi_llave_publica.asc
// It is used to create a new file in which my public key is generated.
gpg --import MICOMPA_llave_publica.asc //It's used to import my colleague's public key
gpg --list-keys // It's used to verify if my colleague's key was imported.