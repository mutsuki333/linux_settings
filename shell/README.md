# Frequently used commands

## **User managment**
Log in as another user.
`su - USERNAME`
**Add user**
`sudo adduser USERNAME`
To grant it super user privilege
`sudo -aG sudo USERNAME`
**Password**
To change the root password:
`sudo passwd`
To change your user password:
`passwd`
To change other users password:
`sudo passwd USERNAME`

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
