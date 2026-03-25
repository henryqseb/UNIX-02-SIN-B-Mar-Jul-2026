gpg --clearsign doc_no_cifrado.txt // sign the text clearly
gpg --sign doc_no_cifrado.txt // sign the document in binary format
gpg --detach-sign doc_no_cifrado.txt // This creates a separate signature
gpg --verify // verify the signatures received
