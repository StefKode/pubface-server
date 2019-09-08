# pubface-server
Configuration automation of public facing server

Readme changed: 2019-02-01

# Intro
This ansible playbook reconfigures a bare, freshly installed Debian server. The goal is to get basic security and make the server as less visible as possible to the outside (eth0):

* use non-default ssh port
* use non-default http and https port
* prevent root login
* create a user whose name and public key are taken from the host running the playbook
* user password is provided using hash
* only allow public-key based logins
* setup restrictive fail2ban policy
* disable ICMP unreachable for all non-used ports
* whitelist only used ports to the outside
* installation and setup of Let's Encrypt SSL Certificate with auto-renewal

# Use
Copy example-config.yml to config.yml. Then modify the variables to your needs, then hit "make"

# Restrictions/Testing
The playbook has been tested on Debian Stretch/minimal setup on netcup.de. The playbook needs a root login and asks for the ssh password at the beginning.
Also you need to ensure that the target host is already in .ssh/known_hosts e.g. by log in once before.

# Variables in config.yml
| Variable | Description |
| --- | --- |
| SERVER_HOST|   This is the name/address of your server.|
| SSH_PORT|      Port ssh listens on. Take care of already used ports!|
| HTTP_PORT|     Port nginx/http listens on. Take care of already used ports!|
| HTTPS_PORT|    Port nginx/https listens on. Take care of already used ports!|
| HTTPS_DOMAIN|  Domain which goes into the nginx- and SSL certificate.|
| EMAIL|         Email used for Let's Encrypt registration|
| REPLUSER|      Standard non-root user on server, must be equal to local user name|
| PASSWDHSH|     Hash of the desired user password. Should be generated with 'mkpasswd'|

# Running this script again
This tool will setup ssh in a way that it can not be run twice. Before running again make sure you re-enable root login and set port to 22 again.
TODO..should be fixed..
