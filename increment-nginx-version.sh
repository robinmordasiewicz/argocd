#!/bin/bash
#


[ -d tmp ] && rm -rf tmp
mkdir tmp
git clone https://github.com/robinmordasiewicz/nginx.git tmp/
cp tmp/VERSION nginx/VERSION
[ -d tmp ] && rm -rf tmp

# cat nginx/VERSION | awk -F. -v OFS=. 'NF==1{print ++$NF}; NF>1{if(length($NF+1)>length($NF))$(NF-1)++; $NF=sprintf("%0*d", length($NF), ($NF+1)%(10^length($NF))); print}' > nginx/VERSION.tmp && mv nginx/VERSION.tmp nginx/VERSION
version=`cat nginx/VERSION`

argotag=`cat VERSION`

sed -e "s/image: robinhoodis\/nginx:.*/image: robinhoodis\/nginx:${version}/" nginx/deployment.yaml > nginx/deployment.yaml.tmp && mv nginx/deployment.yaml.tmp nginx/deployment.yaml

sed -e "s/targetRevision:.*/targetRevision: ${argotag}/" nginx.yaml > nginx.yaml.tmp && mv nginx.yaml.tmp nginx.yaml
