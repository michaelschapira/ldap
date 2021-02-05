FROM alpine:latest
LABEL maintainer="Michael Schapira <michael.schapira@us.ibm.com>"
ARG ADS_FOLDER_BASE=/opt/apacheds
ENV ADS_INSTANCE=${ADS_FOLDER_BASE}/instances/rhocp
RUN \
    apk add openjdk8 curl bash && \
    mkdir ${ADS_FOLDER_BASE} && \
    cd ${ADS_FOLDER_BASE} && \
    curl -O https://mirrors.gigenet.com/apache//directory/apacheds/dist/2.0.0.AM26/apacheds-2.0.0.AM26.tar.gz && \
    adduser apacheds -D -H && \
    tar xzf apacheds-2.0.0.AM26.tar.gz && \
    rm apacheds-2.0.0.AM26.tar.gz && \
    chown -R apacheds:apacheds ${ADS_FOLDER_BASE}
USER apacheds    
RUN \
    cd ${ADS_FOLDER_BASE} && \
    curl -O https://raw.githubusercontent.com/michaelschapira/ldap/alpine/startApacheDS.sh && \
    mkdir -p ${ADS_INSTANCE} && \
    ln -s ${ADS_INSTANCE} ${ADS_FOLDER_BASE}/apacheds-2.0.0.AM26/instances/ && \
    chmod +x ./startApacheDS.sh  
VOLUME [ "${ADS_INSTANCE}" ]
WORKDIR ${ADS_FOLDER_BASE}
EXPOSE 10389
ENTRYPOINT ["./startApacheDS.sh"] 


