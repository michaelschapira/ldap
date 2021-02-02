# ldap
docker file for a simple strait forward ApacheDS server

# runing the container

docker run  --name apacheds -it -p 10389:10389 antineutrinos/apacheds

# default security
admin dn : uid=admin,ou=system

password : secret
