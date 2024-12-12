## Introduction to Unix/Linux

Operating system

Interface between user and the computer hardware.

## Unix flavors

Linux
Mac OS
AIX
Solaris
HP-UX
------------------------------------------------------------------------------------------------------------------------------------------

## Linux Flavors

RHEL (Red Hat Enterprise Linux)
CentOS
Ubuntu
Amazon Linux
Fedora
Linux Mint
OpenSUSE
------------------------------------------------------------------------------------------------------------------------------------------

### Why Linux?

Multi-User & Multi -Tasking
Open Source
Security
Need less resources


### File system hierarchy

/ - This is top level directory
/root - It is home directory for root user
/home - It is home directory for other users
/boot - It contains bootable files for Linux
/etc - It contains all configuration files
/usr - by default soft wares are installed in this directory
/bin - It contains commands used by all users
/sbin - It contains commands used by only root user (root)

------------------------------------------------------------------------------------------------------------------------------------------

### Unix Basic Commands

cat (create & append file)
touch (create blank file)
nano (create & edit file)
vi/vim (create & edit file)
ls (list) (-a, -la)
cd (change directory)
pwd (print working directory)
mkdir (create directory, multiple)
cp (copy)
mv (move)
mv (rename)
rm (remove file)
tree (see in tree structure)
rm -rf(remove directory & recursive)
grep (pick & print)
less (see output)
head (see top 10 lines)
tail (see last 10 lines)
sort (display in Alphabetic/Numeric order)
User
Group
Soft Link (shortcut)
Hard Link (backup)
tar (to pack)
gz (to compress)
yum (to install)
wget (to download)
File/Directory Permissions:

chmod (permissions)
chown (owner)
chgrp (group)
hostname (to see hostname)
ifconfig (to get ip address)
cat /etc/*rele* (to get os version)
yum install httpd (to install package)
yum update httpd (to upgrade package)
yum remove httpd (to uninstall package)
yum list installed (to see installed packages)
service httpd status (to see status)
service httpd start (to start service)
service httpd reload (to restart service)
service httpd restart (to restart service)
chkconfig httpd on (to start service permanently)
chkconfig httpd off (to stop service permanently)
Redirection (redirecting output)
which (to see package installed or not)
sudo (to get root privileges)
whoami (to see user)
find -type f (to see all files in current directory)
find -type d (to see all directories in current directory)
find / -type f (to see all files under top level root directory)
find / -type d (to see all directories under top level root directory)
find / -type f -name <file_name> (to search specific file under top level root directory)
find / -type d -name <dir_name> (to search specific dir under top level root directory)

------------------------------------------------------------------------------------------------------------------------------------------

### Important to remember

cat : ctrl+d
nano : ctrl+x
directory : mkdir -p dir1/dir2 & rm -rf
grep : grep root /etc/passwd
less,more,head,tail : less etc/passwd, head -3 etc/passwd (contents inside file)
sort : contents inside file (sort <file name>)
soft link : ln –s <mainfile> <linkfile>
hard link : ln <mainfile> <linkfile>
Adding single/multiple users to group : gpasswd -a/-M <user>,<user1> <group>
Removing users from group : gpasswd –d <user>,<user1> <group>
tar : tar -cvf <new.tar> <old> , tar -xvf <new.tar> (du -h file name)
zip : gzip <new.tar> , gunzip <new.tar.gz>