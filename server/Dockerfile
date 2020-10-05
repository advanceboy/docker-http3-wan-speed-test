# server
FROM keioni/nginx-http3

# install
RUN apk --update add iproute2 iperf3

# add startup code
COPY docker-entrypoint.sh /tmp

# start
ENTRYPOINT [ "/tmp/docker-entrypoint.sh" ]
CMD [ ]
