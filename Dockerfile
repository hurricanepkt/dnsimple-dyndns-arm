FROM arm32v7/alpine:3.10 AS build
RUN apk add --no-cache curl
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint
RUN chmod +x /usr/local/bin/docker-entrypoint
ENTRYPOINT [ "docker-entrypoint" ]
CMD [ "update" ]
