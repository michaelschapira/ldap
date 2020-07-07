From centos:latest
Maintainer Michael Schapira <michael.schapira@us.ibm.com>
RUN \
    yum -y upgrade && \
    yum -y install \ 
         java-1.8.0-openjdk && \
    curl -O https://mirrors.ocf.berkeley.edu/apache//directory/apacheds/dist/2.0.0.AM26/apacheds-2.0.0.AM26-x86_64.rpm && \
    yum -y install ./apacheds-2.0.0.AM26-x86_64.rpm && \
    rm ./apacheds-2.0.0.AM26-x86_64.rpm && \
    mkdir -p /var/lib/apacheds-2.0.0.AM26/rhocp && \
    curl -O https://raw.githubusercontent.com/michaelschapira/ldap/master/startApacheDS.sh && \
    chmod +x ./startApacheDS.sh && \
    mv /startApacheDS.sh /root
VOLUME [ "/var/lib/apacheds-2.0.0.AM26/rhocp" ]
WORKDIR /opt/apacheds-2.0.0.AM26
EXPOSE 10389
ENTRYPOINT ["/root/startApacheDS.sh"] 
# ENTRYPOINT ["/bin/bash"]
