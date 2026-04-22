#history
    1  mkdir registros
    2  cd nebula
    3  mv registros bitacoras
    4  mv bitacoras registros
    5  ls -F
    6  cd ..
    7  mv registros nebula/bitacoras
    8  mdkir borradores
    9  cd nebula
   10  mkdir borradores
   11  mv cosmos.txt bitacoras
   12  mv estrella.bak estrella.conf
   13  chmod 640 bitacoras/cosmos.txt
   14  ls cosmos.txt
   15  ls -l cosmos.txt
   16  ls bitacoras/cosmos.txt
   17  chmod u+x galaxia.sh
   18  chmod o-w estrella.conf
   19  chmod u+s galaxia.sh
   20  ls -l
   21  chmod +t /tmp/nebula_zone
   22  mkdir -p /tmp/nebula_zone
   23  chmod +t /tmp/nebula_zone
   24  ls -ld /tmp/nebula_zone
   25  chmod 777 /tmp/nebula_zone
   26  chmod +t /tmp/nebula_zone
   27  ls -ld /tmp/nebula_zone
   28  gpg --full-generate-keys
   29  gpg --full-generate-key
   30  gpg --list-keys
   31  gpg --encrypt --recipient aurora@nebula.lab bitacoras/cosmos.txt
   32  gpg --gen-key
   33  gpg --batch --generate-key <<EOF
Key-Type: RSA
Key-Length: 3072
Name-Real: aurora
Name-Email: aurora@nebula.lab
%no-protection
%commit
EOF

   34  gpg --encrypt --recipient aurora@nebula.lab bitacoras/cosmos.txt
   35  gpg --clearsign estrella.conf
   36  gpg --verify galaxia.sh.sig galaxia.sh
   37  gpg --detach-sign galaxia.sh
   38  gpg --verify galaxia.sh.sig galaxia.sh
   39  history