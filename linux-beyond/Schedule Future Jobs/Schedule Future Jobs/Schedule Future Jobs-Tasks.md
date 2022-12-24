# Schedule Future Jobs/Tasks

### Schedule Job Task for Futute using at command

# crontab vs at command

<b>
Summary : 
at command is use for non repeatitive task, one time job

for once user at command, for repeating use crontab </b>

crontab is a Linux utility that allows you to schedule tasks to be executed automatically at a specified time or interval. It reads a file called the "crontab file" that contains instructions for the tasks to be executed and the schedule on which they should be run.

at is a Linux command that allows you to schedule a command or script to be executed at a specific time in the future. Unlike crontab, which allows you to schedule tasks to be executed on a recurring basis, at is designed to execute a task only once.

Both crontab and at can be used to schedule tasks to be run automatically, but they have some differences in terms of functionality and use cases:

crontab is typically used for tasks that need to be executed on a regular basis, such as backing up data or checking for system updates.

at is typically used for tasks that need to be executed only once, such as running a one-time report or sending a notification.

crontab uses a specific syntax and format for specifying the schedule and tasks to be executed, while at allows you to specify the exact time and date at which the task should be run.

crontab allows you to specify the schedule using special keywords such as "hourly" or "weekly", while at requires you to specify the exact time and date at which the task should be run.

crontab is generally more flexible and powerful than at, as it allows you to specify more complex schedules and execute tasks on a recurring basis. However, it can be more difficult to use and requires a deeper understanding of its syntax and usage. at is generally easier to use and requires less setup, but it is less flexible and can only be used to execute tasks once.

---

## Steps

1. check service through systemctl weather its rinning

Index

1. Sheduling our first job
1. Shedling from now time
1. How to remove job from quee ?
1. Showing output in user terminal
1. Run script at particular time
1. How to shecdule job as normal user
1. Stop normal user to shedule job
1. Syntax
1. At Without getting shell
1. Command as file , command as file and output in anywehre
1. Trigger email on fire
1. Batch command
1. Assign other quee for at command
1. Check details of task from quess
1. Location of files of task

### sheduling our first job

```bash
at  21:10
# it will give you sh shell
cal
# press ctrl D to exit
# checking queee of job
atq
#same as above
at -l
```

### sheduling our second job

```bash
at  21:13
# it will give you sh shell
cal > /tmp/cal.txt
lsblk > /tmp/lsblk.txt
# press ctrl D to exit
# checking queee of job
atq
#same as above
at -l
```

logs file of at command is avaiable at

```bash
# in this file  you will see logs
var/log/crone
```

### shedling from now time

```bash
#after 2 min from now
at now +2 min
```

## how to remove job from quee ?

```bash
# removing job from quess is done by giving number of job which is uniquly privded at the the time of cretion of job
atrm id
```

## showing output in user terminal

first we need to know the user terminal

```bash
# for knowing user terminal
tty
at now +2 min
# it willl give you the shell
cal > # your output from first command i.e /dev/pts/0
```

# run script at particular time

```vim
#!/bin/sh
echo "I am Script"
```

```bash
# give execute permision to sh file
at now +2 min
# it willl give you the shell
sh /home/script.sh > dev/pts/0
```

# how to shecdule job as normal user

simply switch to that account , you can also remve your shedule job but not others , root can do anything remember

```
bash
at now +2 min
# it willl give you the shell
cal
```

## stop normal user to shedule job

```bash
vim /etc/at.deny
# enter name of the user that you want to disallow in the file
```

```bash
#santax
at time date|if not defdault will be today
at 09:10PM 09/01/23
at 21:10 # at 21:10 today
```

if you dont want to get shell terminal for commands at
you can also use

```bash
echo "any-command-you want to run" > /dev/pts/0 | at  now + 2min
```

you can also execute script in one line

```bASH
at now +2min -f /my-scrippt-location.sh
```

same thing with output in file or terminal

```bASH
at now +2min -f /my-scrippt-location.sh > /dev/pts/0
```

## trigger email on fire

```bash
at 09:17PM -M
```

### batch command will run on system load no ton specified time

## other flags

-t exact time eg 202202020110.32

# we can assign other quee for command

check deatils of job in quess

```bash
at -c 50
```

## Location of files of task

```bash
/var/spool/at
```

# CRONTAB (for repetitive job)

First verify crontab is installed and its process (systemctl is running crond.service)

1. crontab syntax
1. struruture
1. how to see shecduled jobs
1. how to remove
1. how to deny
1. run on init change

```bash
# e means edit
crontab -e
```

Lets dive in to /etc/crontab and understand the structure

min, hour day-of-month, months , day-of-week

```yaml
# Example of job definition:
# .---------------- minute (0 - 59)
# |  .------------- hour (0 - 23)
# |  |  .---------- day of month (1 - 31)
# |  |  |  .------- month (1 - 12) OR jan,feb,mar,apr ...
# |  |  |  |  .---- day of week (0 - 6) (Sunday=0 or 7) OR sun,mon,tue,wed,thu,fri,sat
# |  |  |  |  |
# *  *  *  *  * user-name command to be executed
```

```bash
crontab -e
# it will open vim file for you
# write there
37 21 * * * echo "Hello world" > /dev/pts/0
```

## how to list

```bash
crontab -l
```

## how to list other user crontab

```bash
crontab -l  -u usama
```

## how to remove

```bash
# it will remove every job of cron for loged in user
crontab -r
```

## Deny user

/etc/cron.deny

```vim
#write name of user which you dont want to run crontab


```

## Run on init change

```vim
@rebort command
```

# Anacron

anacron is a program that is used to execute commands on a periodic basis, similar to the cron daemon. However, anacron is designed to run commands that are missed when the system is powered off or otherwise unavailable.

cron is a daemon that runs in the background on a Linux system and executes commands at specific times or intervals, according to a schedule specified in a configuration file called the crontab. However, if the system is powered off or otherwise unavailable at the scheduled time, the cron daemon will not run the scheduled command.

anacron was designed to address this limitation by running commands that were missed due to system downtime as soon as the system becomes available again. anacron reads a configuration file called anacrontab that specifies the intervals at which commands should be run and the commands to be executed. When the system is started, anacron checks the last time each command was run and runs any commands that are due to be run.

anacron is typically used to schedule system maintenance tasks, such as running backups or cleaning up temporary files. It is particularly useful for systems that are not always powered on or that may experience periods of downtime, such as servers or laptops.

To use anacron, you can create an anacrontab file in the /etc/anacrontab directory, specifying the schedule and commands for the tasks you want to run. You can then start anacron by running the anacron command. anacron will run the scheduled tasks according to the specified intervals and update the last-run time for each task in the anacrontab file.

For more information about anacron, you can consult the anacron man page or consult online resources such as the Anacron documentation.
