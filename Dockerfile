FROM buildkite/agent:latest
MAINTAINER Democracy Works, Inc. <dev@democracy.works>

COPY ./start /bin/start

ENTRYPOINT ["/bin/start"]
CMD []
