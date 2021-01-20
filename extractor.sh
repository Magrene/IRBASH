#!/bin/bash
AUTHFILES=/var/log/auth.lo*
KERNFILES=/var/log/kern.lo*
SYSFILES=/var/log/syslog*

sudo dpkg -V > dpkgVerify.txt
sudo iptables -S > ipTablesRules.txt
ip addr show > ipaddr.txt
ip link show > iplink.txt
sudo ss -tulw > sstulw.txt
sudo ss -tulwn > sstulwn.txt
sudo lsof -i -P -n > lsof.txt
sudo netstat -tulpn > netstat.txt
cat /etc/passwd > passwd.txt
sudo journalctl -k > systemdJournal.txt
systemctl list-units --type=service > systemctl.txt
ps aux > psaux.txt
cat /etc/group > group.txt
sudo cat /etc/sudoers > sudoers.txt
history > history.txt
ls /usr/lib/systemd/system > usrsystemd.txt
ls /etc/systemd/system > etcsystemd.txt
cat /etc/resolv.conf > dns.txt
sudo ifconfig > ifconfig.txt
sudo ip tcp_metrics show > tcpmetrics.txt

for user in $(cut -f1 -d: /etc/passwd); 
do 
	crontab -u $user -l >> cronjobs.txt 
done

for f in $AUTHFILES
do
	cat $f >> authlog.txt
done

for f in $KERNFILES
do
	cat $f >> kernlog.txt
done

for f in $SYSFILES
do
	cat $f >> syslog.txt
done

