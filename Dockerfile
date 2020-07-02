From centos:latest
Maintainer Michael Schapira <michael.schapira@us.ibm.com>
RUN \
    yum -y upgrade && \
    yum -y install \ 
         java-1.8.0-openjdk && \
    curl -O https://mirrors.ocf.berkeley.edu/apache//directory/apacheds/dist/2.0.0.AM26/apacheds-2.0.0.AM26-x86_64.rpm && \
    yum -y install ./apacheds-2.0.0.AM26-x86_64.rpm && \
    rm ./apacheds-2.0.0.AM26-x86_64.rpm 
WORKDIR /opt/apacheds-2.0.0.AM26
EXPOSE 10389
ENTRYPOINT ["/opt/apacheds-2.0.0.AM26/bin/apacheds", "console", "default"] 