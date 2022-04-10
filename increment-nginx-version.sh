#!/bin/bash
#


[ -d tmp ] && rm -rf tmp
mkdir tmp
git clone https://github.com/robinmordasiewicz/nginx.git tmp/
cp tmp/VERSION nginx/VERSION
[ -d tmp ] && rm -rf tmp

version=`cat nginx/VERSION`

sed -e "s/image: robinhoodis\/nginx:.*/image: robinhoodis\/nginx:${version}/" nginx/deployment.yaml > nginx/deployment.yaml.tmp && mv nginx/deployment.yaml.tmp nginx/deployment.yaml
