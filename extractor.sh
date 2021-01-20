#!/bin/bash
AUTHFILES=/var/log/auth.lo*
sudo lsof -i -P -n > lsof.txt
netstat > netstat.txt
cat /etc/passwd > passwd.txt
journalctl -k > systemdJournal.txt

for f in $AUTHFILES
do
	cat $f >> ssh.txt
done
