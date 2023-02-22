sudo chown nobody:nogroup /shared is a command that changes the ownership of the /shared directory to the user and group specified, in this case nobody and nogroup.

The chown command is used to change the ownership of files and directories in Linux. The first argument nobody specifies the user that will become the owner of the directory, and the second argument nogroup specifies the group that will become the owner of the directory.

The nobody user is a special user in Linux that has very limited permissions and is often used for running system services or processes that do not require access to user files. The nogroup group is also a special group that does not have any members, and is often used as the default group for system processes.

By setting the ownership of the /shared directory to nobody:nogroup, we are making it accessible to all users and groups on the system, which is required for NFS to work properly.

---

sudo nano /etc/mysql/mariadb.conf.d/50-server.cnf

[mysqld]
bind-address = 192.168.0.100

---

ip route
