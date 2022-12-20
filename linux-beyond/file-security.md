# Standard File Permissions

ls -lih

```yaml
6691608 drwxr-xr-x 3 muhammad muhammad 4.0K Dec 15 13:04 Downloads
6426394 -rw-rw-r-- 1 muhammad muhammad  43M Dec  6 10:23 kubectl
```

## file types

```yaml
Character	Meaning
-	Regular or ordinary file
d	Directory file
l	Link file
b	Block special file
p	Named pipe file
c	Character special file
s	Socket file
```

1-> execute
2->write
4-> read

## How to change owner

```bash
chown whomtogive  filename
```

similary we can change group of file

```bash
chgrp whomtogive  filename
```

# change mod of file

chmod 600 file.txt

default permission of file come from umask

0000
max permision for file = 666
max permision for file = 777

create directory with permission
mkdir -m 777 folder

# copy file with preserve permission

cp -p path .
