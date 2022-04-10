#!/bin/bash
#

[ -d tmp ] && rm -rf tmp
mkdir tmp
git clone https://github.com/robinmordasiewicz/helm-charts.git tmp/
cp tmp/VERSION.helmchart jenkins/VERSION
[ -d tmp ] && rm -rf tmp

HELMVERSION=`cat jenkins/VERSION`

cat jenkins.yaml | sed -e "s/targetRevision:.*/targetRevision: \"${HELMVERSION}\"/"  > jenkins.yaml.tmp && mv jenkins.yaml.tmp jenkins.yaml
