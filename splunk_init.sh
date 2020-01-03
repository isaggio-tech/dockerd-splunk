#/bin/bash

# Should use Complex Password: Else Below Error
# ERROR: Password did not meet complexity requirements. Password must contain at least:
# * 8 total printable ASCII character(s).
SPLUNK_PASS='Root@123'


#Stop any Existing Splunk Docker Containers
echo "Tearing Down Splunk Docker Lab:::: [$( docker ps --filter "ancestor=splunk/splunk" -q)]"
docker stop $(docker ps --filter "ancestor=splunk/splunk" -q)

docker build -t splunk_apps:latest .
#docker run -d -e 'SPLUNK_START_ARGS=--accept-license' -e 'SPLUNK_PASSWORD=Root@123' -p '8000:8000' -p '8088:8088' splunk_apps:latest start
docker run -d -p '8000:8000' -p '8088:8088' splunk_apps:latest

status="1"
while [ $status == "1" ]
  do 
    echo "Splunk Engine Not Ready Yet, Sleeping for 5 Seconds....!"
    docker ps | grep splunk | grep healthy
    status=$?
    sleep 5
  done

echo ":::::::::::::::::::: USAGE ::::::::::::::::::::"
echo "INFO: Visit Splunk on, http://localhost:8000"
echo "INFO: UserName: admin, Password: ${SPLUNK_PASS}"
