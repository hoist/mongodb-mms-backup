mongodb-mms-backup docker container
==================

A simple mongdb-mms-backup agent docker image
(derived from (tianon/mongodb-mms)[https://registry.hub.docker.com/u/tianon/mongodb-mms/] )

Running
===
docker run -d -e API_KEY={YOUR_API_KEY} fruitl00p/mongodb-mms-backup

Configuration
===
The agent support various configuration options to be passed via environment variables:

- API_KEY (required) see https://mms.mongodb.com/settings/backup-agent
- SERVER (default: api-backup.mongodb.com) The server to which to connect, AKA the mothership
- HTTPS (default: true) use of HTTPS...  (what else? :))