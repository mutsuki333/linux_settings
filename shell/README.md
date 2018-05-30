# Frequently used commands

## **User managment**
Log in as another user.
`su - USERNAME`
**Add user**
`sudo adduser USERNAME`
To grant it super user privilege
`sudo -aG sudo USERNAME` or `sudo adduser USERNAME sudo`
**Password**
To change the root password:
`sudo passwd`
To change your user password:
`passwd`
To change other users password:
`sudo passwd USERNAME`

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
`-R` for recursive, `xyz` for user mod

--|--|--          --|--
read|r|4          owner|o
write|w|2         group|g
execute|x|1       other|o
                  all|a

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
