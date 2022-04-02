#!/bin/bash
#

cat jenkins/VERSION | awk -F. -v OFS=. 'NF==1{print ++$NF}; NF>1{if(length($NF+1)>length($NF))$(NF-1)++; $NF=sprintf("%0*d", length($NF), ($NF+1)%(10^length($NF))); print}' > jenkins/VERSION.tmp && mv jenkins/VERSION.tmp jenkins/VERSION
version=`cat jenkins/VERSION`


sed -e "s/[0-9].[0-9].[0-9]/${version}/" jenkins.yaml > jenkins.yaml.tmp && mv jenkins.yaml.tmp jenkins.yaml
