#!/bin/bash
#

curl -s https://raw.githubusercontent.com/robinmordasiewicz/helm-charts/main/VERSION.helmchart > jenkins/VERSION

HELMVERSION=`cat jenkins/VERSION`

cat jenkins.yaml | sed -e "s/targetRevision:.*/targetRevision: ${HELMVERSION}\"/"  > jenkins.yaml.tmp && mv jenkins.yaml.tmp jenkins.yaml
