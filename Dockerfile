FROM centos
LABEL project="OpenShift Tools"
LABEL maintainer "andrew.darley@lmco.com"

ENV https_proxy=http://proxy-ics.external.lmco.com:80/
USER root

# Update image
RUN yum --setopt=tsflags=nodocs update -y && yum --setopt=tsflags=nodocs install -y httpd wget python3-pip traceroute nmap whois curl wget httpd openssh-clients 
    
    
RUN wget https://mirror.openshift.com/pub/openshift-v4/clients/ocp/latest/openshift-client-linux.tar.gz && \
    tar xvf openshift-client-linux.tar.gz && \
    cp oc /usr/local/bin && rm -rf oc openshift-client-linux.tar.gz kubectl README.md && \
    oc version && pip3 install --upgrade awscli==1.16.206 s3cmd==2.0.2 python-magic


COPY index.html /var/www/html/


# Add configuration file
#ADD action /var/www/cgi-bin/action
RUN chmod 755 /var/www/html/
RUN echo "The Web Server is Running" >> /var/www/html/index.html
EXPOSE 80

# Start the service
CMD while true; do date; sleep 10; done
