#!/bin/bash
AUTHFILES=/var/log/auth.lo*
lsof -i -P -n > lsof.txt
netstat > netstat.txt

for f in $AUTHFILES
do
	cat $f > $f + '.txt'
done
