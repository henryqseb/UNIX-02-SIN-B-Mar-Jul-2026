echo "This is our Unix work" > doc_no_cifrado.txt 
//A file is created in which our message will be placed.
gpg --output doc_cifrado.txt --encrypt --recipient XXXX doc_no_cifrado.txt
//Generate the encrypted document to send to my colleague
gpg --decrypt MICOMPA_doc_cifrado.txt
// Decrypt the file sent by my colleague
