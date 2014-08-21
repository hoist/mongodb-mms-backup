###
#
# A simple image for installing the mongodb-mms-backup-agent
#
###
FROM ubuntu:14.04
MAINTAINER Kingsquare <docker@kingsquare.nl>

####
# Install prequisites + cleanup
RUN apt-get update && apt-get install -y curl logrotate && \
	apt-get clean && rm -rf /tmp/* /var/tmp/* /var/lib/apt/lists/*

ADD resources/ /

####
# Install Agent itself
RUN curl -sSL https://mms.mongodb.com/download/agent/backup/mongodb-mms-backup-agent_2.4.0.156-1_amd64.deb -o mms.deb && \
	dpkg -i mms.deb && \
	rm mms.deb

####
# Make sure the app is configured correctly
ENTRYPOINT ["/configure.sh"]
USER mongodb-mms-agent

CMD ["mongodb-mms-backup-agent", "-c", "/etc/mongodb-mms/backup-agent.config"]