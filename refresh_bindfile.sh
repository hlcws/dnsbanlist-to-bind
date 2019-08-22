#!/bin/bash
prefix="zone \""
suffix="\"{ type master; notify no; file \"/etc/bind/db.empty\"; };"
echo $prefix
echo $suffix
sed "s,.*,$prefix&$suffix," /etc/bind/banlist.txt > /etc/bind/named.conf.banned
