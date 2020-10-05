#!/bin/sh

nohup iperf3 -s &
head -c 536870912 /dev/urandom > /usr/local/nginx/html/tmp/512MiB.bin
nginx-runner
