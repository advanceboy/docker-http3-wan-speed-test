# server
FROM keioni/nginx-http3@sha256:358f4b3fbb7b787c3123deb8d08faa7101dfb20b413d57176b640d185bec9cdb

# install
RUN apk --update add iproute2 iperf3 python3 sudo
RUN echo 'ALL ALL=(ALL) NOPASSWD: /sbin/tc' >> /etc/sudoers

# add startup code
COPY change-qdisc.sh stop-container.sh /tmp/cgi-bin/
RUN chmod a+x /tmp/cgi-bin/change-qdisc.sh /tmp/cgi-bin/stop-container.sh
COPY docker-entrypoint.sh /tmp/

# start
ENTRYPOINT [ "/tmp/docker-entrypoint.sh" ]
CMD [ ]
