## Introduction to Unix/Linux

Operating system

Interface between user and the computer hardware.

## Unix flavors

#### Linux
#### Mac OS
#### AIX
#### Solaris
#### HP-UX
------------------------------------------------------------------------------------------------------------------------------------------

## Linux Flavors

#### RHEL (Red Hat Enterprise Linux)
#### CentOS
#### Ubuntu
#### Amazon Linux
#### Fedora
#### Linux Mint
#### OpenSUSE
------------------------------------------------------------------------------------------------------------------------------------------

### Why Linux?

### Multi-User & Multi -Tasking
### Open Source
### Security
### Need less resources


### File system hierarchy

#### / - This is top level directory
#### /root - It is home directory for root user
#### /home - It is home directory for other users
#### /boot - It contains bootable files for Linux
#### /etc - It contains all configuration files
#### /usr - by default soft wares are installed in this directory
#### /bin - It contains commands used by all users
#### /sbin - It contains commands used by only root user (root)

------------------------------------------------------------------------------------------------------------------------------------------

### Unix Basic Commands

### File System Navigation
ls: Lists files and directories in the current directory
cd: Changes the current working directory
pwd: Prints the current working directory
mkdir: Creates a new directory
rmdir: Removes an empty directory
### File Manipulation
touch: Creates an empty file or updates file timestamps
cp: Copies files or directories
mv: Moves or renames files and directories
rm: Removes files or directories
cat: Displays the contents of a file
less: Views file contents one screen at a time
head: Displays the beginning of a file
tail: Displays the end of a file
chmod: Changes file permissions
chown: Changes file ownership
### Text Processing
grep: Searches for patterns in files
sed: Stream editor for filtering and transforming text
awk: Pattern scanning and text processing language
sort: Sorts lines of text
uniq: Removes duplicate lines from sorted text
wc: Counts lines, words, and characters in a file
tr: Translates or deletes characters
### System Information
uname: Displays system information
top: Shows running processes and system resource usage
ps: Displays information about active processes
df: Shows disk space usage
du: Displays disk usage of files and directories
free: Displays amount of free and used memory
### User and Group Management
whoami: Displays the current user's username
id: Prints user and group information
groups: Shows group membership for a user
useradd: Creates a new user account
userdel: Deletes a user account
passwd: Changes user password
### Process Management
kill: Terminates processes by their process ID
pkill: Sends signals to processes based on name
bg: Puts a job in the background
fg: Brings a background job to the foreground
jobs: Lists active jobs in the current shell session
### Networking
ping: Tests network connectivity to a specific host
ifconfig: Displays or configures network interfaces
netstat: Displays network connections and statistics
ssh: Securely connects to remote systems
scp: Securely copies files between hosts
File Compression
gzip: Compresses files
gunzip: Decompresses gzip files
tar: Archives files and directories
### System Administration
sudo: Executes a command as another user, typically the superuser
shutdown: Shuts down or restarts the system
crontab: Schedules commands to run at specified times

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