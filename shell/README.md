# Frequently used commands

## **User managment**
Log in as another user.  
`su - USERNAME`  
**Add user**  
`sudo adduser USERNAME`  
To grant it super user privilege  
`sudo -aG sudo USERNAME` or `sudo adduser USERNAME sudo`  
**Password**  
Root password: `sudo passwd`  
User password: `passwd`  
Other users password: `sudo passwd USERNAME`

## **File permission settings**

**Change group**  
```chgrp GROUP [-R] DIR/FILE```  
`-R` for recursive

**Change owner**  
```chown [-R] USER DIR/FILE```  
or  
```chown [-R] USER.GROUP DIR/FILE```  
or  
```chown [-R] USER:GROUP DIR/FILE```  
`-R` for recursive  

**Change mode**  
```chmod [-R] xyz DIR/FILE```  
`-R` for recursive, `xyz` for user mod.  
owner = rwx = 4+2+1 = 7  
group = rwx = 4+2+1 = 7  
others= --- = 0+0+0 = 0  
```chmod 770 FILE```  
or  
```chmod  u=rwx,go=rx  FILE``` No spaces in between ','s.

utility|flag|num|
-------|----|--|
read|r|4
write|w|2
execute|x|1

id|flag
--|--
user|u
group|g
other|o
all|a

## **Shell tab auto-complete case-insensitive**  
Open a terminal, run
```shell
# If ~./inputrc doesn't exist yet, first include the original /etc/inputrc so we don't override it
if [ ! -a ~/.inputrc ]; then echo '$include /etc/inputrc' > ~/.inputrc; fi


# Add option to ~/.inputrc to enable case-insensitive tab completion
echo 'set completion-ignore-case On' >> ~/.inputrc
```
Start a new shell / terminal.

to make this change for all users, edit `/etc/inputrc`.



## **tree**
To get the directory structure of `PATH`.
Installation
For ubantu
```shell
sudo apt-get install tree
```
For OSX
```shell
brew install tree
```
flags|utility
-----|-------
-d|show only directory
-L #|# is replaced by the max recursivity level.

## System net conntection
Get ip info
```shell
curl ipinfo.io
```

```shell
ifconfig
```
