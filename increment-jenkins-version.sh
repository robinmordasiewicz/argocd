#!/bin/bash
#

curl -s https://raw.githubusercontent.com/robinmordasiewicz/jenkins-container/main/VERSION > jenkins/VERSION

sed -re "s/targetRevision: [0-9]+\.[0-9]+\.[0-9]+-*([0-9]*)/targetRevision: `cat jenkins/VERSION`/" jenkins.yaml > jenkins.yaml.tmp && mv jenkins.yaml.tmp jenkins.yaml

