# Managing Profile Files

alias , var function are loaded with the help of profile files

two types
system profiles, user profiles
(system) for every user
(user profile) for specific user

lets talk about system
/etc/profile

## system file

system source the (read and load ) the file in environment

1. responsible in setting up path environment varable
1. responsible in setting up PS1 environment varable
1. responsible in setting up hostname
1. responsible for loading /etc/inputrc file (for keyboard mapping)
1. responsible for sourcing /etc/bashrc file

there system file :
etc/profile (env stuff)
etc/inputrc (keyboard maping, which key will do what )
etc/bashrc (system wide func and aliases)

## user file

usually
.bash_logout (it tell system that user has logout)
.bash_profile or .profile in debian (not 100% sure) or bash_login in any flavour
.bashrc
.bash_history (session history)

.profile execute only once when we login in as user and it source .bashrc

and bahrc execute on every shell (/etc/bashrc)

Summary of prfile file
if globaly then in etc/
if user specifi then in user home directory

for var, function bashrc
