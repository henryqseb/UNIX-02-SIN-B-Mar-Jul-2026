gpg --edit-key // It serves to open an interactive 
menu that allows you to manage and modify the properties of a key.
trust // the level of trust we have in our colleague
gpg --sign-key // sign our colleague's key
gpg --verify // verify the signed document
gpg --verify.gpg // verify the signed document
gpg --verify doc_no_cifrado.sig doc_no_cifrado.txt //verify the signed document