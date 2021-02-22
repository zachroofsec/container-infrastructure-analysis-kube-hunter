#!/bin/bash

GO_DOWNLOAD_PATH=/tmp/go.tar.gz
SSHGIT_CONFIG_PATH=/tmp/config.yaml

## Install Golang
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin:/usr/local/go/bin

apt-get update && apt-get install -y git &&\
    wget https://storage.googleapis.com/golang/go1.11.1.linux-amd64.tar.gz -O "${GO_DOWNLOAD_PATH}" &&\
    tar -C /usr/local -xzf "${GO_DOWNLOAD_PATH}" &&\
    mkdir -p "${GOPATH}"

## Install shhgit binary and sshgit configuration
go get -v github.com/eth0izzle/shhgit &&
wget https://raw.githubusercontent.com/eth0izzle/shhgit/3ce441853d999dacf6e20e59b116c135dcdd0c68/config.yaml -O "${SSHGIT_CONFIG_PATH}"

## Look for credentials within /host

# Can be slow
#shhgit --config-path /tmp -local /host

# To make the demo go faster, we're going to cheat a only look within a subdirectory of /host
shhgit --config-path /tmp -local /host/.docker
