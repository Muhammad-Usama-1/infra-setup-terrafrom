# SSH , Pre post Banner , change default port , allow disallow users group ip ann network

Ensure that the OpenSSH server is installed on your system. This can be done by running the following command in the terminal

```bash
sudo apt-get install openssh-server
#start the SSH service by running
sudo service ssh start
sudo systemctl start ssh

```

# Pre and post banner

for inserting pre banner search banner in config file and insert location of your banner file

sshd_config ---> file
Banner location

you can also write assci by following this link

https://patorjk.com/software/taag/#p=display&f=Graffiti&t=Type%20Something%20

Post banner --> /etc/motd

# Disable root user ssh

in sshd_config
PermitRootLogin no

note if it is still not working there could be a no of reason , in my case i did not set the root passwod

so please set root password

```bash
sudo su
passw
enter-you--new-root-password-and-confirm
```

# How to change default ssh port in ubutntu

in sshd_config
port your-port

allow in firewall if you enable ufw

# Allow/Deny Access From Selected IP Addresses Or Networks Through SSH

/etc/hosts.allow
/etc/hosts.deny
sshd:ip
for networkk
sshd:33.33.33.0/subnet

Note : allow take precedence over deny
