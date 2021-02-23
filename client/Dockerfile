# client
FROM keioni/curl-http3@sha256:f4ef7bdedf7ebd418d5cabffbfde8b96cea463fb2bc9f0be368b38ef8b4861f5 AS curlimage

FROM alpine:3

# install iperf
RUN apk --update add iproute2 iperf3

COPY --from=curlimage /bin /bin/
COPY --from=curlimage /sbin /sbin/
COPY --from=curlimage /lib /lib/
COPY --from=curlimage /etc /etc/
COPY --from=curlimage /usr /usr/

# add startup code
COPY docker-entrypoint.sh /tmp/

#start
ENTRYPOINT [ "/bin/ash" ]
CMD [ "/tmp/docker-entrypoint.sh" ]
