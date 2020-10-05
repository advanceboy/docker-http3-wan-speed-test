# client
FROM keioni/curl-http3 AS curlimage

FROM alpine:3

# install iperf
RUN apk --update add iproute2 iperf3

COPY --from=curlimage /bin /bin/
COPY --from=curlimage /sbin /sbin/
COPY --from=curlimage /lib /lib/
COPY --from=curlimage /etc /etc/
COPY --from=curlimage /usr /usr/

#start
ENTRYPOINT [ "/bin/ash" ]
CMD []
