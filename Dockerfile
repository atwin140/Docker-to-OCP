FROM docker.io/library/ubuntu:latest

LABEL project="OCP testing"
LABEL maintainer "andrew.darley@lmco.com"

# ENV https_proxy=http://proxy-ics.external.lmco.com:80/
RUN apt-get update && apt-get upgrade -y
RUN apt-get -y install traceroute nmap whatweb whois curl wget


CMD while true; do /usr/bin/date; /usr/bin/sleep 10; done


EXPOSE 80
