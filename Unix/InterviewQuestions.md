# Linux Core Interview Questions
## 1. What is Linux?
Linux is an open-source, Unix-like operating system kernel developed by Linus Torvalds in 1991. It forms the core of many operating systems and is widely used in servers, embedded systems, and personal computers.
## 2. What are the basic components of Linux?
The basic components of Linux include the kernel, shell, GUI, system utilities, and application programs.
## 3. What is the Linux kernel?
The Linux kernel is the core component of the operating system that manages hardware resources and provides essential services to other software.
## 4. What is a Linux distribution?
A Linux distribution is a complete operating system built on the Linux kernel, including system utilities, applications, and package management systems. Examples include Ubuntu, Fedora, and Debian.
## 5. How do you check memory and CPU stats in Linux?
Use commands like top, htop, free, and vmstat to check memory and CPU statistics.
## 6. How would you create a partition on a raw disk?
Use tools like fdisk, parted, or gparted to create partitions on a raw disk.
## 7. What is the purpose of the /etc directory?
The /etc directory contains system-wide configuration files and scripts.
## 8. What is /etc/fstab used for?
/etc/fstab (file system table) contains information about disk partitions and filesystems to be mounted at boot time.
## 9. How do you create a new user with sudo privileges?
Use the useradd command to create a user, then add them to the sudo group: sudo usermod -aG sudo username.
## 10. How can you see all running processes?
Use the ps aux command to view all running processes.
## 11. What is swap space and when is it used?
Swap space is used when the physical RAM is full. It's a portion of the hard drive used as virtual memory.
## 12. How do you kill a process in Linux?
Use the kill command followed by the process ID, e.g., kill -9 PID.
## 13. How do you restart a service in Linux?
Use the systemctl restart service_name command for systemd-based systems.
## 14. Where would you look to find system logs?
System logs are typically found in the /var/log directory.
## 15. How do you install packages on RHEL and Ubuntu/Debian?
For RHEL: sudo yum install package_name
For Ubuntu/Debian: sudo apt-get install package_name
## 16. What is LVM and what are its advantages?
LVM (Logical Volume Manager) allows flexible disk space management. It enables easy resizing of volumes and snapshots.
## 17. How do you see the IP address assigned to a machine?
Use the ip addr show or ifconfig command.
## 18. How do you configure the firewall in Linux?
Use iptables for older systems or ufw (Uncomplicated Firewall) for newer Ubuntu systems.
## 19. What is SSH and how do you use it?
SSH (Secure Shell) is a protocol for secure remote login. Use ssh username@hostname to connect to a remote machine.
## 20. How do you set up a load balancer or reverse proxy?
Tools like Nginx or HAProxy can be configured as load balancers or reverse proxies.
## 21. How would you troubleshoot a server that is running slowly?
Use tools like top, htop, iotop, and vmstat to identify resource-intensive processes and bottlenecks.
## 22. What is an inode and what is it used for?
An inode is a data structure that stores metadata about a file, including permissions, ownership, and disk block locations.
## 23. How do you display and manage kernel modules?
Use lsmod to list modules, modprobe to load modules, and rmmod to remove modules.
## 24. What is "load average" and how do you show it?
Load average represents system load over time. Use the uptime command to display it.
## 25. What is a chroot jail and when would you use it?
A chroot jail changes the apparent root directory for a process, isolating it from the rest of the system. It's used for security and testing purposes.
## 26. How do you make a shell script executable?
Use the chmod +x script_name.sh command.
## 27. What is the shebang (#!) in a shell script?
The shebang specifies which interpreter should be used to run the script, e.g., #!/bin/bash.
## 28. How do you pass arguments to a shell script?
Arguments are passed after the script name and accessed using $1, $2, etc., within the script.
## 29. What is a package manager?
A package manager is a tool for installing, updating, and removing software packages on a Linux system.
## 30. How do you update the package list in Ubuntu?
Use the command sudo apt update.
## 31. How do you search for a string in multiple files?
Use the grep command, e.g., grep "search_string" /path/to/files/*.
## 32. How do you find files modified in the last 24 hours?
Use the find command: find /path -mtime -1.
## 33. What is the difference between hard links and symbolic links?
Hard links point directly to the inode, while symbolic links point to the file path.
## 34. How do you compress and decompress files in Linux?
Use tools like gzip, tar, or zip for compression, and their respective decompression commands.
## 35. How do you count the number of lines in a file?
Use the wc -l filename command.
## 36. What is RAID and what are the common RAID levels?
RAID (Redundant Array of Independent Disks) combines multiple disk drives for improved performance or redundancy. Common levels include RAID 0, 1, 5, and 10.
## 37. How do you check the SMART status of a hard drive?
Use the smartctl command, e.g., smartctl -a /dev/sda.
## 38. How do you mount an NFS share?
Use the mount command: mount -t nfs server:/share /mnt/point.
## 39. What is the difference between MBR and GPT partitioning schemes?
MBR (Master Boot Record) is older and limited to 2TB partitions, while GPT (GUID Partition Table) supports larger partitions and more partition entries.
## 40. How do you identify system bottlenecks?
Use tools like top, iostat, vmstat, and sar to monitor system resources and identify performance issues.
## 41. What is the purpose of the nice command?
The nice command adjusts the scheduling priority of a process.
## 42. How do you optimize disk I/O performance?
Use techniques like proper filesystem choice, I/O scheduling, and disk caching.
## 43. What is CPU affinity and how do you set it?
CPU affinity binds a process to specific CPU cores. Use the taskset command to set affinity.
## 44. How do you tune kernel parameters?
Modify kernel parameters by editing /etc/sysctl.conf or using the sysctl command.
## 45. What is syslog and how does it work?
Syslog is a standard for message logging, allowing centralized logging of system and application events.
## 46. How do you rotate log files?
Use the logrotate utility to manage log file rotation and compression.
## 47. What is Ansible and how does it work?
Ansible is an open-source automation tool that uses YAML-based playbooks to define automation tasks.
## 48. How do you create a cron job?
Edit the crontab file using crontab -e and add the desired schedule and command.
## 49. What is the purpose of the lsof command?
lsof lists open files and the processes that have them open.
## 50. How do you check the version of the Linux kernel?
Use the uname -r command.

# Generic Questions 

## 51. What are day to day activities where you need to interact with Unix/Linux commands?
Answers may vary

## 52. Can you give me examples of 2-3 automation tasks where you used bash scripting?
Answers may vary

## 53. What is the most challenging work you have done in automation where bash scripting was used by you ?
Answers may vary