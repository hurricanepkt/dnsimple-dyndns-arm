FROM lsiobase/ubuntu.armhf:bionic

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="dnsimple-dyndns-arm version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="hurricanepkt"


RUN apt-get update && apt-get install -y \
  curl \
  && rm -rf /var/lib/apt/lists/*


COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint
RUN chmod +x /usr/local/bin/docker-entrypoint
ENTRYPOINT [ "docker-entrypoint" ]
CMD [ "update" ]