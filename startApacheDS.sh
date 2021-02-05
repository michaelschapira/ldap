#!/bin/bash
# ADS_PATH="/opt/apacheds/apacheds-2.0.0.AM26"
# ADS_INST_PATH="/opt/apacheds/instances/rhocp" 

if [ ! -f ${ADS_INSTANCE}/pvc.init ]; then
    touch ${ADS_INSTANCE}/pvc.init
    echo "Copying default instance to the volume mount point"
    cp -r /opt/apacheds/apacheds-2.0.0.AM26/instances/default/* ${ADS_INSTANCE}/
else
    echo "Volume has been initialized - Doing nothing"
fi

export JAVA_HOME='/usr/lib/jvm/default-jvm/'
echo "Starting instance rhocp"
echo "Using ${JAVA_HOME}"
/opt/apacheds/apacheds-2.0.0.AM26/bin/apacheds.sh rhocp start 
sleep 5
tail -f ${ADS_INSTANCE}/log/apacheds.log
