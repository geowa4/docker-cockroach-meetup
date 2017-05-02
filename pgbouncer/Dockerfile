FROM debian:jessie
CMD pgbouncer pgbouncer.config -u nobody
RUN apt-get update && \
    apt-get install -y pgbouncer
COPY pgbouncer.config pgbouncer.config
COPY pgbouncer.auth pgbouncer.auth
