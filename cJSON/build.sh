rm test
arm-hisiv600-linux-gcc -o test test.c -L./ -lcjson

cp test /home/sunzhiyuan/samba/NFS_SERVER/
