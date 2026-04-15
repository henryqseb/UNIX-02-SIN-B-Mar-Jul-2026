touch prueba.txt
#Create an empty text file in the current directory
chmod 600 prueba.txt
#Makes the file private: only 
#the owner can read and write. Permissions (600): Owner reads/writes (6), group and others nothing (0)
ls -l prueba.txt
#We verified the current file permissions
chmod 755 prueba.txt
#We changed permissions: Owner does everything (7), Group and Others only read/execute (5)
ls -l prueba.txt
#We verified the current file permissions