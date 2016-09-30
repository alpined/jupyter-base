FROM alpine:3.4
# MAINTAINER AlpineD <alpined@x1g.com> | http://alpined.x1g.com

# root filesystem
COPY rootfs /

# container builder, let sh run it
RUN /bin/sh /scripts/build.sh
