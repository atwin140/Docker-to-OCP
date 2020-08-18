FROM registry.access.redhat.com/ubi8/ubi:latest
LABEL project="OpenShift Tools"
LABEL maintainer "andrew.darley@lmco.com"

ENV https_proxy=http://proxy-ics.external.lmco.com:80/
ENV NO_PROXY=169.254.169.254,127.0.0.1,localhost,.lmco.com,.svc,.cluster.local,10.128.0.0/14,172.30.0.0/16,.us.lmco.com,.lm        co.com,140.169.28.0/26,140.169.28.96/26,gitlab.us.lmco.com,registry.gitlab.us.lmco.com,docker-registry-default.eocp-dev-app        s.us.lmco.com,eocp-dev-int.us.lmco.com,eocp-dev.us.lmco.com,.eocp-dev-apps.us.lmco.com,100.64.0.0/16,.us-gov-west-1.compute        .internal


RUN yum update -y && yum install -y wget python3-pip rsync openssh-clients && \
    dnf install -y --enablerepo ansible-2.8-for-rhel-8-x86_64-rpms ansible && \
    wget https://mirror.openshift.com/pub/openshift-v4/clients/ocp/latest/openshift-client-linux.tar.gz && \
    tar xvf openshift-client-linux.tar.gz && \
    cp oc /usr/local/bin && rm -rf oc openshift-client-linux.tar.gz kubectl README.md && \
    oc version && pip3 install --upgrade awscli==1.16.206 s3cmd==2.0.2 python-magic
COPY id_key .
RUN echo "Tools platform for OpenShift - by Andrew Darley"

