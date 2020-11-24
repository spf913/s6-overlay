FROM centos:centos8
MAINTAINER Damage_Brain@damage_brain.us

COPY container-files /

RUN yum -y update && \
yum -y clean all && \
cd /tmp && \
curl -L https://www.dropbox.com/s/htqwhzalq2bbbvu/s6-overlay-amd64.tar.gz -o s6-overlay-amd64.tar.gz && \
tar xzf s6-overlay-amd64.tar.gz -C / && \
rm -f s6-overlay-amd64.tar.gz && \
sh /usr/local/sbin/fix-bins.sh

ENTRYPOINT ["/init"]
