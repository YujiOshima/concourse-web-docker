FROM yujioshima/concourse-base-docker
MAINTAINER Yuji Oshima

EXPOSE 8080 2222
COPY scripts/ /usr/local/scripts/

ENTRYPOINT ["/usr/local/scripts/docker-entrypoint.sh"]
CMD ["concourse", "web"]
