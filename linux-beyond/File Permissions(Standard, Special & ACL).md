# File Permissions (Standard, Special & ACL)

what is ACL

in a condition where you have to give different user differnet permission of a file (another very bad approach to do that is allow
other all permission which is bad practice) now here ACL come in to picture

first we will have to enable acl in file system (do some reasearch not much complicated)

------+ represent that ACL is set in the file

get facl

```bash
getfacl filename.txt
```

```bash
setfacl -m  u:username:4 filename
```

remove entry from ACL

```bash
setfacl -x   username filename
```

can also give permision to particular group too

```bash
setfacl -m  g:groupname:7 filename
```

completely remove ACL

```bash
setfacl -b filename
```
