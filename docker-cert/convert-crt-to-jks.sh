#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)

cd $SCRIPT_DIR

docker build -t cert ../ --force-rm -f ./keytool/Dockerfile

docker create -t -i --name cert_generate cert:latest

docker cp cert_generate:/tmp/certificate.jks ./output

docker rm cert_generate
docker rmi $(docker images --format '{{.Repository}}:{{.Tag}}' | grep 'cert:latest')
docker image prune -f
docker rmi $(docker images --format '{{.Repository}}:{{.Tag}}' | grep 'alpine/openssl:latest')
docker rmi $(docker images --format '{{.Repository}}:{{.Tag}}' | grep 'gcr.io/distroless/java11-debian11:nonroot')