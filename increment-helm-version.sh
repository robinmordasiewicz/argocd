#!/bin/bash
#

#curl -s https://raw.githubusercontent.com/robinmordasiewicz/helm-charts/main/VERSION.helmchart > jenkins/VERSION
git clone https://github.com/robinmordasiewicz/helm-charts.git tmp/
cp tmp/VERSION.helmchart jenkins/VERSION

HELMVERSION=`cat jenkins/VERSION`

cat jenkins.yaml | sed -e "s/targetRevision:.*/targetRevision: \"${HELMVERSION}\"/"  > jenkins.yaml.tmp && mv jenkins.yaml.tmp jenkins.yaml
