#!/bin/bash
#

cat nginx/VERSION | awk -F. -v OFS=. 'NF==1{print ++$NF}; NF>1{if(length($NF+1)>length($NF))$(NF-1)++; $NF=sprintf("%0*d", length($NF), ($NF+1)%(10^length($NF))); print}' > nginx/VERSION.tmp && mv nginx/VERSION.tmp nginx/VERSION
version=`cat nginx/VERSION`

sed -e "s/[0-9].[0-9].[0-9]/${version}/" nginx/deployment.yaml > nginx/deployment.yaml.tmp && mv nginx/deployment.yaml.tmp nginx/deployment.yaml

