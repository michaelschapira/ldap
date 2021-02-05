# ldap
docker file for a simple strait forward [Apache Directory Server](http://directory.apache.org/apacheds/) based on [Alpine Linux](https://docs.alpinelinux.org/user-handbook/0.1a/index.html). 

# Building the image
`docker build -t alpine_apcheds --rm path_to_git_repo`


# runing the container
`docker run --name alpine_apacheds -v /tmp/apacheds:/opt/apacheds/instances/rhocp -p 10389:10389 -p alpine_apcheds`

# Ports
10389 - Default non SSL LDAP port
10636 - LDAPS port


# default security
Using ApacheDS default security passowrd. 

admin dn : uid=admin,ou=system
password : secret

______________________
TODO - allow usage of a K8S secret for the password. 