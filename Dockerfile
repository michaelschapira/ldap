From alpine:latest
LABEL maintainer="Michael Schapira <michael.schapira@us.ibm.com>"
RUN \
    apk add openjdk8 curl bash && \
    mkdir /opt/apacheds && \
    cd /opt/apacheds && \
    curl -O https://mirrors.gigenet.com/apache//directory/apacheds/dist/2.0.0.AM26/apacheds-2.0.0.AM26.tar.gz && \
    adduser apacheds -D -H && \
    tar xzf apacheds-2.0.0.AM26.tar.gz && \
    rm apacheds-2.0.0.AM26.tar.gz && \
    chown -R apacheds:apacheds /opt/apacheds
USER apacheds    
RUN \
    cd /opt/apacheds && \
    curl -O https://raw.githubusercontent.com/michaelschapira/ldap/alpine/startApacheDS.sh && \
    mkdir -p /opt/apacheds/instances/rhocp && \
    ln -s /opt/apacheds/instances/rhocp/ /opt/apacheds/apacheds-2.0.0.AM26/instances/ && \
    chmod +x ./startApacheDS.sh  
VOLUME [ "/opt/apacheds//instances/rhocp" ]
WORKDIR /opt/apacheds
EXPOSE 10389
ENTRYPOINT ["./startApacheDS.sh"] 
# ENTRYPOINT ["/bin/bash"]

