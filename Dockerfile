FROM buildkite/agent:latest
MAINTAINER Democracy Works, Inc. <dev@democracy.works>

ENV DOCKER_VERSION 1.5.0
# install docker client
ADD https://get.docker.io/builds/Linux/x86_64/docker-${DOCKER_VERSION} /bin/docker
RUN chmod +x /bin/docker
COPY ./start /bin/start

ENTRYPOINT ["/bin/start"]
CMD []
