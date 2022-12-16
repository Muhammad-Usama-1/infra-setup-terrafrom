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
.bash_logout
.bash_profile
.bashrc
.bash_history
