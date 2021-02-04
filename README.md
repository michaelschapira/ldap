# ldap
docker file for a simple strait forward ApacheDS server

# runing the container

docker run  --name apacheds -it -p 10389:10389 -v volume_path:/var/lib/apacheds-2.0.0.AM26/rhocp antineutrinos/apacheds

# default security
admin dn : uid=admin,ou=system

password : secret
