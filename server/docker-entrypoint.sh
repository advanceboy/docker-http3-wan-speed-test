#!/bin/sh

# start iperf
nohup iperf3 -s &

# start qdisc manager server
tc qdisc add dev eth0 root netem limit 128mb delay 0ms loss 0%
OLD_DIR=$(pwd)
cd /tmp
nohup python3 -m http.server --cgi 8080 &
cd "$OLD_DIR"

# make dummy file (default 128MiB)
head -c ${DATA_SIZE:-134217728} /dev/urandom > /usr/local/nginx/html/tmp/data.bin

# start nginx
nginx-runner
