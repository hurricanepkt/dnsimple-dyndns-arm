FROM arm32v7/ubuntu:16.04
RUN apt-get update \
    && apt-get install -y \
    curl 
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint
RUN chmod +x /usr/local/bin/docker-entrypoint
ENTRYPOINT [ "docker-entrypoint" ]
CMD [ "update" ]
