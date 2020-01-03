FROM splunk/splunk

MAINTAINER "Hari Chintala"

USER root

ADD Splunk_TAs/splunk-add-on-for-amazon-web-services_461.tgz /opt/splunk/etc/apps

RUN chmod -R 777 /tmp
COPY common-conf/splunk_entrypoint.sh /tmp

RUN chmod 777 /tmp/splunk_entrypoint.sh

ENTRYPOINT [ "/tmp/splunk_entrypoint.sh" ]
CMD [ "start-service" ]
