#!/bin/bash

echo "Copying default instance to the volume mount point"
cp -r /var/lib/apacheds-2.0.0.AM26/default/* /var/lib/apacheds-2.0.0.AM26/rhocp/
echo "changing ownership to be owned by apacheds user and group"
chown -R apacheds:apacheds /var/lib/apacheds-2.0.0.AM26/rhocp 

echo "Starting instance rhocp"
/opt/apacheds-2.0.0.AM26/bin/apacheds console rhocp
