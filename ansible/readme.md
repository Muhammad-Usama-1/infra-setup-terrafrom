rhcsa -> rhce -> rhca

# Ansible

open-sorce , python

push base , does not requre any software on client

agentless (no need to install anyting on client)

works on ssh

No extra softweare on your server for your applicaitons

# push based vs pull base

puppet ,chef --> pull base , agentes present , keep pulling server

ansible -> push base

## inventory file can be two type

inventory file is a collection of your hosts
localation can be anywhere
, name could br anything,
no root sudo priviliges require to create inventoryy file
language could ini or yml

RULES :

1.  must be in group
    [web]
    ip-1
    ip-2-of-node-machine
    can-be-domain-ifdns

if we have large no of server ,

192.168.10.[1:20]
server[1:10].com

groups with groups

[newgroup:children]
web
dev

verify any error

ansible web --list-hosts

we will need to ansible our custom inv entory file
ansible web --list-hosts -i /path-to-custom-inventory
ansible web:db --list-hosts -i /path-to-custom-inventory

ansible all --list-hosts -i /path-to-custom-inventory
for changinf ansible default host we can define in ansible conf
like
[defaults]
inventory = /home/usama/inventroy-new-location
static (not changes) , dynamic

---

we can also make own conf file

[defaults]
inventory =new-path

ansible look for config file in following order
export var ,
pwd,
home
defailt /etc

## connection with manage nodes

password based
passwordless , key
inventory based

ansible all -m ping -i loc-of-inv

ansible all -m ping -i loc-of-inv
ansible all -m ping -i loc-of-inv -k
-k for passsword prompt

we can disable host-key-checking
host_key_checking

### key base

first create a user
useradd -m ansible_user
echo 'ansible_user:redhat' | sudo chpasswd
echo "ansible_user ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/ansible_user

switch to that user now generate ssh key
check ssh
copy the keygen result to nodes with new user

---

adduser sammy
usermod -aG sudo sammy
su - sammy
echo "ansible_user ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/ansible_user

grants the user ansible_user permission to run any command with sudo without being prompted for a password.

## Inventry base

in inventory file in group

ip ansible_ssh_user=remote-user ansibl_ssh_passremot-user-pass

[web:vars]
ansible_ssh_user=remote-user
ansibl_ssh_passremot-user-pass

# installing

sudo apt-add-repository ppa:ansible/ansible;
sudo apt-get update;
sudo apt-get install ansible;ansible --version
It's also recommended to install python-pip, python-apt, python-apt-common with the following command:

sudo apt-get install -y python-pip python-apt python-apt-common

# | Ansible Ad-Hoc Commands & Modules |

used for one time task

ansible groupname -m modulename -a 'argument'
ansible playbook for repetitive task

first create a user
useradd usama
echo 'taha:redhat' | sudo chpasswd
echo "taha" ALL=(ALL) NOPASSWD:ALL | sudo tee /etc/sudoers.d/taha

check ssh
copy the keygen result to nodes with new user

lets see module for copy

---

# host file

add list of your host in /etc/ansible/hosts

ansible require passwordless authentication , create ssh keys

The command "ssh-copy-id root@192.168.1.116" is used to copy the SSH public key of the local machine to the remote machine at IP address 192.168.1.116.

sed to set up passwordless SSH login, which is more secure than using a password for authentication. By copying the public key to the remote machine, the local machine can authenticate with the remote machine without having to enter a password.

When you run this command, you'll be prompted to enter the password for the "root" user on the remote machine. Once you've entered the password, the public key will be copied to the remote machine, and you should be able to log in to the remote machine without being prompted for a password.

Please make sure that you have the right access to the remote machine and also you should have ssh-client and ssh-server installed on both machines.
Also, be careful if you are using root user for ssh, it's not a best practice and you should consider using a non-root user

full path to the authorized_keys file on the remote machine would be: /root/.ssh/authorized_keys

This file contains the public keys of all the machines that are authorized to log in to the remote machine. The ssh-copy-id command simply adds the public key of the local machine to this file.

ssh-keygen;
it will prompt for password of usama for copying and then will copy the public key to suthorizeskeys
ssh-copy-id usama@192.168.1.106
now thesting weather we can acces or not passwordless
ssh usama@192.168.1.106;

in the place of ip we can also use the name of group which we defined in /etc/ansible/hosts file
ansible 192.168.1.106 -m ping;
ansible webservers -m ping;
we can also defing owninventory file wityhout any extension

```text
[web]
192.168.1.106
```

ansible -i fileforhost ip-or-group -m ping;

```yaml
192.168.1.106 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "ping": "pong"
}

```

```yaml
---
- name: Ping remote host
  hosts: all
  become: true
  become_user: usama
  tasks:
    - name: Test connectivity to remote host
      ping:
```

# variables

---

# Session - 5

recall
ansible all -m copy -a 'content ="hello world" dest="/tmp/usama.log" '
