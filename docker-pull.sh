# https://registry-console-default.apps.rhtps.io/registry#/images/nikto/nikto-openshift:latest
# docker-registry-default.apps.rhtps.io

TOKEN=`oc whoami -t`
sudo docker login --username=nsabine --password=${TOKEN} docker-registry-default.apps.rhtps.io
sudo docker pull docker-registry-default.apps.rhtps.io/nikto/nikto-openshift:latest

