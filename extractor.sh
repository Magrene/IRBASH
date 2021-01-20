#!/bin/bash
AUTHFILES=/var/log/auth.lo*

KERNFILES=/var/log/kern.lo*
sudo lsof -i -P -n > lsof.txt
sudo netstat > netstat.txt
cat /etc/passwd > passwd.txt
sudo journalctl -k > systemdJournal.txt
systemctl list-units --type=service > systemctl.txt
ps aux > psaux.txt
cat /etc/group > group.txt
sudo cat /etc/sudoers > sudoers.txt
history > history.txt


for f in $AUTHFILES
do
	cat $f >> ssh.txt
done

for f in $KERNFILES
do
	cat $f >> kern.txt
done


