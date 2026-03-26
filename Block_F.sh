gpg --output mensaje_seguro.gpg --encrypt --sign --recipient sakabenalcazar@gmail.com doc_no_cifrado.txt
// Create a new file using my private key and my partner's public key.
gpg --decrypt // It is used to decrypt a file
cat // Check the file contents
