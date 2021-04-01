FROM arm32v7/alpine:latest
COPY tmp/qemu-arm-static /usr/bin/qemu-arm-static

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="dnsimple-dyndns-arm version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="hurricanepkt"


RUN apk add --no-cache curl
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint
RUN chmod +x /usr/local/bin/docker-entrypoint
ENTRYPOINT [ "docker-entrypoint" ]
CMD [ "update" ]