FROM haproxy:lts-bookworm
USER root
RUN mkdir --parents /var/lib/haproxy && chown -R haproxy:haproxy /var/lib/haproxy
RUN mkdir /run/haproxy
COPY haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg
