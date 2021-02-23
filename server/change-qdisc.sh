#!/bin/sh

# parse query_string
oldIFS=$IFS
IFS=,
set -- ${QUERY_STRING}
DELAY=$1
LOSS=$2
IFS=$oldIFS

# run tc
sudo /sbin/tc qdisc change dev eth0 root netem limit 128mb delay $DELAY loss $LOSS
