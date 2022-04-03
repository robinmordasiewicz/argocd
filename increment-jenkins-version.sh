#!/bin/bash
#

url -s https://raw.githubusercontent.com/robinmordasiewicz/helm-charts/main/VERSION.helmchart > jenkins/VERSION

sed -re "s/targetRevision: [0-9]+\.[0-9]+\.[0-9]+-*([0-9]*)/targetRevision: `cat jenkins/VERSION`/" jenkins.yaml > jenkins.yaml.tmp && mv jenkins.yaml.tmp jenkins.yaml

