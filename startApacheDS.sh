#!/bin/bash
ADS_INST_PATH="/opt/apacheds/apacheds-2.0.0.AM26/instances/rhocp" 

if [ ! -f ${ADS_INST_PATH}/pvc.init ]; then
    touch ${ADS_INST_PATH}/pvc.init
    echo "Copying default instance to the volume mount point"
    cp -r ${ADS_INST_PATH}/../default/* ${ADS_INST_PATH}/
    echo "changing ownership to be owned by apacheds user and group"
    #chown -R apacheds:apacheds /var/lib/apacheds-2.0.0.AM26/rhocp 
else
    echo "Volume has been initialized - Doing nothing"
fi

echo "Starting instance rhocp"
/opt/apacheds-2.0.0.AM26/bin/apacheds console rhocp
