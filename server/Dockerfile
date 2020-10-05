# server
FROM keioni/nginx-http3@sha256:358f4b3fbb7b787c3123deb8d08faa7101dfb20b413d57176b640d185bec9cdb

# install
RUN apk --update add iproute2 iperf3

# add startup code
COPY docker-entrypoint.sh /tmp

# start
ENTRYPOINT [ "/tmp/docker-entrypoint.sh" ]
CMD [ ]
