# Local User Management in Linux

beyond the scope just so we can on the same page

```bash
sudo useradd bilal
sudo passwd bilal
```

```bash

```

if you want to know the username of loged in user

```bash
whoami
```

if you want to see how many people is logged in your machine from where
it will also tell you IP address and time

```bash
who
```

your detail info

```bash
who am i
```

if you want to see which user is doing what (Ip , commands , shell )

```bash
w
```

it will show the id of user of group of loged in user

```bash
id
```

it will show the id of user of group of the user you specify

```bash
id usama
```

## Switch Users

if you want to switch to the differnet user (must have password for that user)

```bash
su usama
```

you can also switch to root user (must have root password)

```bash
su root
```

we can also use (there is a differnce in both)

Note: if you put - in front of username then it will completly switch to that user mean from environmental var ,PWD , profile files (.bash_profile)

```bash
su -
```

if you switch like like that you are pretending as root you have not become root

```bash
su root
```

and if you switch to beome completly root you will have to use

```bash
su - root
```

also this command will switch you to root user after promting password for root

```bash
su
```

## SUDO

if you want to perform which require admin or root priviliged
for example adding new user

```bash
useradd linux
```

here you will have to use sudo

from this cpmmand we can dorectly open sudo file

```bash
visudo
```

This line mean user usama is allowed to run command as sudo but usama
have to provide root password

```yaml
usama    ALL=(ALL:ALL) ALL
```

but if you want to not promt for password for usama

from this command we have allowed usama to run sudo command with password (which is not recommended ofcourse in my opinion we always make sure to give least priviliged to the user)

```yaml
usama    ALL=(ALL:ALL) NOPASSWD: ALL
```

we can deny some specific command

(now these user can run all command as sudo except docker)

```yaml
usama    ALL=(ALL:ALL) NOPASSWD: ALL, !/usr/bin/docker
```

from this line user can only run kubectl

```yaml
usama    ALL=(ALL:ALL) NOPASSWD: /usr/bin/kubectl
```

## Groups

allow people in group devops to run all commands

```yaml
%devops ALL=(ALL:ALL) ALL
```

same thing without a password

```yaml
%devops ALL=(ALL:ALL) NOPASSWD:ALL
```

you get the point about the permission

# Deep in users

it w

```bash
cat /etc/passwd
```

usually

```yaml
muhammad:x:1000:1000:Muhammad Usama,,,:/home/muhammad:/bin/bash
```

muhammad:x:1000:1000:Muhammad Usama,,,:/home/muhammad:/bin/bash
username:encryptedpasswordkey:userid:primarygrouid::displayname:homedir:shell

## how to add user ?

useradd -m -d -c "" name

-m modified way
-d home directory
-c display name

but still there is a lot of default entry system add on creating the user

file responsible for default entry

```bash
cat /etc/default/useradd
```

```txt
# Default values for useradd(8)
#
# The SHELL variable specifies the default login shell on your
# system.
# Similar to DSHELL in adduser. However, we use "sh" here because
# useradd is a low level utility and should be as general
# as possible
SHELL=/bin/sh
#
# The default group for users
# 100=users on Debian systems
# Same as USERS_GID in adduser
# This argument is used when the -n flag is specified.
# The default behavior (when -n and -g are not specified) is to create a
# primary user group with the same name as the user being added to the
# system.
# GROUP=100
#
# The default home directory. Same as DHOME for adduser
# HOME=/home
#
# The number of days after a password expires until the account
# is permanently disabled
# INACTIVE=-1
#
# The default expire date
# EXPIRE=
#
# The SKEL variable specifies the directory containing "skeletal" user
# files; in other words, files such as a sample .profile that will be
# copied to the new user's home directory when it is created.
# SKEL=/etc/skel
#
# Defines whether the mail spool should be created while
# creating the account
# CREATE_MAIL_SPOOL=yes
```

you can also see default entry y

```bash
useradd -D
```

## how to delete

userdel -r

-r mean delet ehome directory too (you can preserve home directory by not writing -r)

## how to modify

usermod -c
usermod -s (for shell)

PS : home dir must have 700 permision
how to know weather you have partivular shell or not

```bah
cat /etc/shells
```

you can always install new shell

## lets talk about skel

whenever we create a user /etc/skell content gets copy in user home directory

use case : let suppose you added new user and want to give file about instruction , company pollicy or anything you get the point right ?

## password

```bash
cat /etc/shadow
```

usama:encrypted-password

```bash
chage -l usama
```

it will show the expiry etc of usama

```yaml
Last password change: Dec 05, 2022
Password expires: never
Password inactive: never
Account expires: never
Minimum number of days between password change: 0
Maximum number of days between password change: 99999
Number of days of warning before password expires: 7
```

you can also locked the password

usermod -L usama
for unlock
usermod -U usama

## Groups

```bash
groupadd devops
```

in etc/group

you can see all the primary and secondary group of a particular user

```bash
groups
```

for seeing other groups

```bash
groups usama
```

we can also use

```bash
id -a usama
```

## how to modify user (add user in group)

```bash
usermod -a -G tennis usama
```

-aG is use for adding in secondary group

and if you want to change primary group we will user -g

## how to change group name

```bash
groupmod -n newname oldname
```

if we want to delete the group

```bash
groupdel groupnametodelte
```

if you want to make admin any user

```bash
gpasswd -A username groupname
```

now if admin want to add in the group

```bash
gpasswd -a user groupname
```

now if admin want to remove in the group

```bash
gpasswd -d user groupname
```
