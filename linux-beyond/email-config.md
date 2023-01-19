# SMTP, IMAP, and POP

SMTP, IMAP, and POP are all different protocols used for email communication.

SMTP (Simple Mail Transfer Protocol) is the standard protocol for sending email messages between servers. Most email systems that send mail over the Internet use SMTP to send messages from one server to another, and to deliver messages to local mail clients like Microsoft Outlook or Apple Mail.

IMAP (Internet Message Access Protocol) and POP (Post Office Protocol) are both used for retrieving email messages from a mail server. IMAP and POP are the two most commonly used protocols for email clients to retrieve email messages from an email server.

IMAP is the more modern of the two, and is designed to allow users to access their email messages from multiple devices, while keeping all of the messages on the email server. This makes it possible to read and respond to email messages from different devices, without losing any messages or losing track of what messages have been read or responded to.

POP, on the other hand, is an older protocol that is typically used to download email messages from a server to a single device and then delete the messages from the server. This can be a problem if a user wants to access their email from multiple devices, because each device will have its own copy of the messages and it will be difficult to keep them in sync.

Both IMAP and POP are supported by most email clients, so you can generally choose which one to use depending on your personal preferences.

## Basics

Wall command is used to send broadcasting message to currently loged in message

```bash
#for broadcasting
wall are you there
```

Wall command is used to send multicasting to specific user

```bash
#for broadcasting
wall are you there
```

```bash
write username terminal
# if you will not provide terminal then it will every terminal where irfan is logged in
write irfan pts/1
```

## how will we send mail to user ?

we need service MTA tool running in system

```bash
sudo apt-get install sendmail
```

## creating email

create a file naame emai.txt

```vim
Subject: any-subject
your body
will go
here
```

#1st way

```bash
#mail will send to bilal
# will take time in terminal
sendmail bilal@localhost < email.txt

```

```bash
#2nd way
echo "Hello from sendmail" | sendmail bilal@localhost
```

#3rd way

```bash
# we will require mail packeage so install
sudo apt install mailutils
```

## for checking mail we will have to go /var/spool/mail

```bash
#check email
cat /var/spool/mail/bilal
```

### another way

```bash
#see logs
cat /var/log/maillog
```

## 3rd way more fancy

```bash
# it will show the mail of loged in user
mail
```

## how to add attachment ?

```bash
# attach a file called "report.pdf" to an email with the subject "Weekly Report" and the body "Please find attached the weekly report for this week,
echo "Please find attached the weekly report for this week" | mail -s "Weekly Report" -a report.pdf recipient@example.com
```

```bash
#same as above
echo "Please find attached the weekly report for this week" | mail -s "Weekly Report" -A /path/to/report.pdf recipient@example.com

```

```bash
 mail -A app.txt -s "beautiful subject" bilal@localhost < src/email.txt

```

you can also use x command to exit and save any modifications made to the mailbox

You can also use the d command to delete an email, then x command to exit, which will save the changes made to the mailbox.

You can also use ? command to list all the commands available inside the mail command.

When you exit the mail command, the changes made to the mailbox, such as deleting emails, are saved and will be reflected the next time you open the mailbox.

---

Rely

# Postfix SMTP Server Configuration in Linux

Sendmail and Postfix are functional and robust MTAs, but Postfix is generally considered to be more modern, secure and easy to use. It is best to choose the one that fits better with your needs and environment.

---

# SquirrelMail Server Configuration in Linux

```bash
hostnamectl set-hostname webmail.usama.local
```

reebot , ip address might chnged

# RoundCube Server Configuration in Linux

create a instance in aws
postfix smtp -< used for sending mail>
, dovcot config imap -> used for reciving emails

```bash
hostnamectl set-hostname webmail.usama.local
```

entry in /etc/host file

se linux permissive

allow in firewall ,security group  
do change in /etc/postfix/main.cf

```txt

```

# Zimbra Server Configuration in Linux

smtp , ldap , pop , imap ,

during installation come with

nginx . mariadb , postfix , libreoffice , spamassian, unbound ,
appache jsieve
zimbra-chat , etc , lucene
