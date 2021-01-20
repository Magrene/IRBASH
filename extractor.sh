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
ls /usr/lib/systemd/system > usrsystemd.txt
ls /etc/systemd/system > etcsystemd.txt
for user in $(cut -f1 -d: /etc/passwd); 
do 
	crontab -u $user -l >> crobjobs.txt 
done

for f in $AUTHFILES
do
	cat $f >> ssh.txt
done

for f in $KERNFILES
do
	cat $f >> kern.txt
done


