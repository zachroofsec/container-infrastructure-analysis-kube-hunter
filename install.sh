#!/bin/bash

# +--------------------+
# GENERAL
# +--------------------+

## Installs dependencies for the demo environment
## Tested on FRESH install of Kali Linux 2021.1.0 on 3/2021

# NOTE: This script is NOT guaranteed to work into the future
# (packages can be removed from package repositories)

# +--------------------+
# BREW INSTALLS
# +--------------------+

# Get parent dir path
PARENT_DIR_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Redirecting /dev/null activates "non-interactive" installation of brew
bash "$PARENT_DIR_PATH/install-helpers/brew.sh" < /dev/null

## Setup paths for `brew install`
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

# minikube: For running the local Kubernetes cluster
# k9s: Helps us inspect the Kubernetes cluster
# krew: Will allow us to install kubectl plugins
# trivy: Allows us to inspect vulnerable docker images
# nmap: Allows us to search for host vulnerabilities
# yq: For pretty printing yaml
brew install minikube \
    k9s \
    krew \
    aquasecurity/trivy/trivy \
    nmap \
    yq

# +--------------------+
# APT INSTALLS
# +--------------------+

sudo apt-get -y update &&\
    sudo apt-get -y install docker.io

# +--------------------+
# CURL INSTALLS
# +--------------------+

## kubeletctl will allow us to attack the kubelet
KUBELETCTL_LOCATION=/usr/local/bin/kubeletctl
sudo curl -L "https://github.com/cyberark/kubeletctl/releases/download/v1.6/kubeletctl_linux_amd64" \
     -o $KUBELETCTL_LOCATION &&\
     sudo chmod a+x $KUBELETCTL_LOCATION

# +--------------------+
# PATHS
# +--------------------+

BASHRC_LOCATION="${HOME}/.bashrc"

## Ensure krew is on $PATH
KREW_PATH='export PATH="${PATH}:${HOME}/.krew/bin"'
grep -Rq "${KREW_PATH}" "${BASHRC_LOCATION}"
if [[ $? -eq 0 ]]; then
    echo 'krew is already on $PATH'
else
    echo 'Placing krew onto $PATH'
    echo -e "${KREW_PATH}" >> "${BASHRC_LOCATION}"
fi

## Set up persistent brew paths
BREW_PATHS='eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)'
grep -Rq "${BREW_PATHS}" "${BASHRC_LOCATION}"
if [[ $? -eq 0 ]]; then
    echo 'brew paths have already been created'
else
    echo 'Setting up brew paths'
    echo -e "${BREW_PATHS}" >> "${BASHRC_LOCATION}"
fi

# +--------------------+
# KREW INSTALLS
# +--------------------+

## advise-psp will allow us to generate Pod Security Policies in Kubernetes
kubectl krew install advise-psp || true

# +--------------------+
# CONFIGS
# +--------------------+

# Allow docker to run as non-root
sudo usermod -aG docker $USER

# Docker configurations for Kubernetes environment
DOCKER_CONFIGS="${HOME}/.minikube/files/.docker"
mkdir -p "${DOCKER_CONFIGS}" &&\
    cp "$PARENT_DIR_PATH/install-helpers/config.json" "${DOCKER_CONFIGS/config.json}"

echo "----------------------------------------------------------------"
echo "Installation finished!"
echo 'You must run `bash start.sh` to start the simulation environment'
echo "NOTE: Inspecting start.sh can spoil the tutorial's investigation"
echo 'IMPORTANT: You MUST now log out and log back into the shell'
echo "----------------------------------------------------------------"
