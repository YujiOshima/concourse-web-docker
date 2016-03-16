FROM vyshane/concourse-base
MAINTAINER Vy-Shane Xie

EXPOSE 8080 2222
COPY scripts/ /usr/local/scripts/

ENTRYPOINT ["/usr/local/scripts/docker-entrypoint.sh"]
CMD ["concourse", "web"]
