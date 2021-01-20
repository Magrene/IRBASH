#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
else
AUTHFILES=/var/log/auth.lo*
KERNFILES=/var/log/kern.lo*
SYSFILES=/var/log/syslog*
mkdir artifacts

sudo ss -tulpan > sstulpan.txt
mv sstulpan.txt ./artifacts

sudo ps faux > psfaux.txt
mv psfaux.txt ./artifacts

sudo dpkg -V > dpkgVerify.txt
mv dpkgVerify.txt ./artifacts

sudo iptables -S > ipTablesRules.txt
mv ipTablesRules.txt ./artifacts

ip addr show > ipaddr.txt
mv ipaddr.txt ./artifacts

ip link show > iplink.txt
mv iplink.txt ./artifacts

sudo ss -tulw > sstulw.txt
mv sstulw.txt ./artifacts

sudo ss -tulwn > sstulwn.txt
mv sstulwn.txt ./artifacts

sudo lsof -i -P -n > lsof.txt
mv lsof.txt ./artifacts

sudo netstat -tulpn > netstat.txt
mv netstat.txt ./artifacts

cat /etc/passwd > passwd.txt
mv passwd.txt ./artifacts

sudo journalctl -k > systemdJournal.txt
mv systemdJournal.txt ./artifacts

systemctl list-units --type=service > systemctl.txt
mv systemctl.txt ./artifacts

ps aux > psaux.txt
mv psaux.txt ./artifacts

cat /etc/group > group.txt
mv group.txt ./artifacts

sudo cat /etc/sudoers > sudoers.txt
mv sudoers.txt ./artifacts

history > history.txt
mv history.txt ./artifacts

ls /usr/lib/systemd/system > usrsystemd.txt
mv usrsystemd.txt ./artifacts

ls /etc/systemd/system > etcsystemd.txt
mv etcsystemd.txt ./artifacts

cat /etc/resolv.conf > dns.txt
mv dns.txt ./artifacts

sudo ifconfig > ifconfig.txt
mv ifconfig.txt ./artifacts

sudo ip tcp_metrics show > tcpmetrics.txt
mv tcpmetrics.txt ./artifacts

for user in $(cut -f1 -d: /etc/passwd); 
do 
	crontab -u $user -l >> cronjobs.txt 
done
mv cronjobs.txt  ./artifacts

for f in $AUTHFILES
do
	cat $f >> authlog.txt
done
mv authlog.txt  ./artifacts

for f in $KERNFILES
do
	cat $f >> kernlog.txt
done
mv kernlog.txt  ./artifacts

for f in $SYSFILES
do
	cat $f >> syslog.txt
done
mv ksyslog.txt ./artifacts

fi