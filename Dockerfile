FROM buildkite/agent:latest
MAINTAINER Democracy Works, Inc. <dev@democracy.works>

ENV DOCKER_VERSION 1.10.3
ENV FLEETCTL_VERSION 0.11.7

# install openssl and jq
RUN apk add --update openssl jq && rm -rf /var/cache/apk/*

# install docker client
ADD https://get.docker.io/builds/Linux/x86_64/docker-${DOCKER_VERSION} /usr/bin/docker
RUN chmod +x /usr/bin/docker

# install fleetctl
ADD https://github.com/coreos/fleet/releases/download/v${FLEETCTL_VERSION}/fleet-v${FLEETCTL_VERSION}-linux-amd64.tar.gz /tmp/fleet.tar.gz
RUN tar -C /tmp -xzf /tmp/fleet.tar.gz && mv /tmp/fleet-v${FLEETCTL_VERSION}-linux-amd64/fleetctl /bin/ && \
    rm -rf /tmp/fleet-v${FLEETCTL_VERSION}-linux-amd64 && rm /tmp/fleet.tar.gz

COPY hooks /buildkite/hooks
