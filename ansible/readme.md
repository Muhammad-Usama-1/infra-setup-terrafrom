## Redhat Certification Path

rhcsa -> rhce -> rhca

# Ansible

open-sorce , python

push base , does not requre any software on client

agentless (no need to install anyting on client)

works on ssh

No extra softweare on your server for your applicaitons

## installing

sudo apt-add-repository ppa:ansible/ansible;
sudo apt-get update;
sudo apt-get install ansible;ansible --version
It's also recommended to install python-pip, python-apt, python-apt-common with the following command:

sudo apt-get install -y python-pip python-apt python-apt-common

# push based vs pull base

puppet,chef --> pull base , agentes present , keep pulling server

ansible -> push base

## inventory file can be two type

inventory file is a collection of your hosts localation can be anywhere, name could br anything,

No root sudo priviliges require to create inventory file

language could ini or yml

RULES :

1.  must be in group
    [web]
    ip-1
    ip-2-of-node-machine
    can-be-domain-ifdns

If we have large no of server ,

192.168.10.[1:20]

# In which all from 1 to 20

server[1:10].com

## Groups with groups

## Newgroup have all the server from web and dev group

[newgroup:children]
web
dev

## verify any error

ansible web --list-hosts

we will need to ansible our custom inventory file

## How to list host from different way

ansible web --list-hosts -i /path-to-custom-inventory
ansible web:db --list-hosts -i /path-to-custom-inventory
ansible all --list-hosts -i /path-to-custom-inventory

for changing ansible default host we can define in ansible conf
like
[defaults]
inventory = /home/usama/inventroy-new-location

we can also make own conf file

[defaults]
inventory =new-path

Ansible daemon look for Ansbile configurations in following order
export var,
pwd,
logedin user home directory
defailt /etc

## connection with manage nodes

1. password based (provide k flag)
1. passwordless , key (copying keys to all server)
1. inventory based

ansible all -m ping -i loc-of-inv

ansible all -m ping -i loc-of-inv
ansible all -m ping -i loc-of-inv -k

-k for passsword prompt

we can disable host-key-checking in ansible configuration
host_key_checking

### key base

first create a user
useradd -m ansible_user -s /bin/bash
echo 'ansible_user:redhat' | sudo chpasswd

echo "ansible_user ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/ansible_user

switch to that user now generate ssh key by running ssh-keygen
copy ssh key to the client
check ssh (it should not prompt for password)
adduser sammy
usermod -aG sudo sammy

-- final way clearn

sudo useradd -m admin_user -s /bin/bash
echo 'admin_user:password' | sudo chpasswd
sudo usermod -aG sudo admin_user
id admin_user
sudo su - admin_user
sudo apt update

---

sudo useradd -m master -s /bin/bash
echo 'master:password' | sudo chpasswd
sudo usermod -aG sudo master
id master
sudo su - master
sudo apt update

## Inventry base

in inventory file in group

ip ansible_ssh_user=remote-user ansibl_ssh_passremot-user-pass

[web:vars]
ansible_ssh_user=remote-user
ansibl_ssh_passremot-user-pass

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

## Ansible Adhoc Commands
