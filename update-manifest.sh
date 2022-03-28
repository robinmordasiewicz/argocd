#!/bin/bash
#

version=`cat VERSION`

sed -e "s/[0-9].[0-9].[0-9]/${version}/" nginx-deployment.yaml > nginx-deployment.yaml.tmp && mv nginx-deployment.yaml.tmp nginx-deployment.yaml

