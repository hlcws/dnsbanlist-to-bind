#!/bin/bash
banlisturl="https://raw.githubusercontent.com/hectorm/hmirror/master/data/stevenblack/list.txt"
templist="/etc/bind/banlist.txt"
zonefile="/etc/bind/named.conf.banned"
/usr/bin/wget -O $templist $banlisturl
prefix="zone \""
suffix="\"{ type master; notify no; file \"/etc/bind/db.empty\"; };"
sed "s,.*,$prefix&$suffix," $templist > $zonefile
/usr/sbin/service bind9 reload
/usr/sbin/service bind9 status
