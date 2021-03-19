#!/bin/bash

# +--------------------+
# GENERAL
# +--------------------+

## shhgit can find secrets within git repos (or within the file system)

# +--------------------+
# OPTIONS
# +--------------------+

# default path to recursively search for credentials
# /host/.docker is used to make the demo go quicker
SEARCH_PATH='/host/.docker'

OUTPUT_PATH='/tmp/shhgit.txt' # default output path

while getopts 's:o:' flag; do
    case "${flag}" in
        s) SEARCH_PATH="${OPTARG}" ;;
        o) OUTPUT_PATH="${OPTARG}" ;;
        *) ;;

    esac
done

echo "Search path set to ${SEARCH_PATH}"
echo "Output path set to ${OUTPUT_PATH}"

# +--------------------+
# INSTALLS
# +--------------------+

GO_DOWNLOAD_PATH=/tmp/go.tar.gz
SSHGIT_CONFIG_PATH=/tmp/config.yaml

## Install Golang (and dependencies)
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin:/usr/local/go/bin

apt-get update && apt-get install -y git &&
    wget https://storage.googleapis.com/golang/go1.11.1.linux-amd64.tar.gz -O "${GO_DOWNLOAD_PATH}" &&
    tar -C /usr/local -xzf "${GO_DOWNLOAD_PATH}" &&
    rm -rf "$GO_DOWNLOAD_PATH" &&
    mkdir -p "${GOPATH}"
#
### Install shhgit binary and configuration file
go get -v github.com/eth0izzle/shhgit
wget https://raw.githubusercontent.com/eth0izzle/shhgit/3ce441853d999dacf6e20e59b116c135dcdd0c68/config.yaml -O "${SSHGIT_CONFIG_PATH}"

# +--------------------+
# RUN
# +--------------------+

## -config-path: path for the config
## -local: Recursively searches a directory
shhgit -config-path /tmp -local "${SEARCH_PATH}" > "${OUTPUT_PATH}" 2>&1
