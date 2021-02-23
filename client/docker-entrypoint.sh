#!/bin/sh

iperf3 -c server -i 0
iperf3 -c server -u -b 100G -i 0

# wait for the nginx started
until curl -fsLk https://server/ > /dev/null 2>&1
do
  sleep 1
done

# test
delays='215ms 100ms 46ms 22ms 10ms 4ms 2ms 1ms 0ms'
losses='50% 32% 18% 9% 4% 2% 1% 0%'

for i in `seq ${NUMBER_OF_TESTS:-3}`; do
  for d in $delays; do
    for l in $losses; do
      # set delay
      curl http://server:8080/cgi-bin/change-qdisc.sh?${d},${l}
      # test speed (default timeout is 30sec)
      curl --http1.1 -sLk https://server/tmp/data.bin -o /dev/null -m ${MAX_DOWNLOAD_TIME:-30} -w "${d} ${l} %{http_version} %{size_download} %{speed_download}\n"
      curl --http2 -sLk https://server/tmp/data.bin -o /dev/null -m ${MAX_DOWNLOAD_TIME:-30} -w "${d} ${l} %{http_version} %{size_download} %{speed_download}\n"
      curl --http3 -sLk https://server/tmp/data.bin -o /dev/null -m ${MAX_DOWNLOAD_TIME:-30} -w "${d} ${l} %{http_version} %{size_download} %{speed_download}\n"
    done
  done
done

curl http://server:8080/cgi-bin/change-qdisc.sh?0ms,0%
curl http://server:8080/cgi-bin/stop-container.sh
