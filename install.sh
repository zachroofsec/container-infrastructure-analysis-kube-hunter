#!/bin/bash
# set -x

# +--------------------+
# GENERAL
# +--------------------+

## Installs dependencies for the attack simulation environment
## Tested on FRESH install of Kali Linux 2020.3.0 on 2/2021

# NOTE: This script is NOT guaranteed to work into the future
# (packages can be removed from package repositories)

# +--------------------+
# BREW INSTALLS
# +--------------------+

# Redirecting /dev/null activates "non-interactive" installation of brew
bash install-helpers/install-brew.sh < /dev/null

## Setup paths for `brew install`
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

# minikube: For running the Kubernetes cluster
# k9s: Helps us inspect the Kubernetes cluster
# krew: Will allow us to install kubectl plugins
# aquasecurity/trivy/trivy: Allows us to inspect vulnerable docker images
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
    cp install-helpers/config.json "${DOCKER_CONFIGS/config.json}"

echo "----------------------------------------------------------------"
echo "Installation finished!"
echo 'You must run `bash start.sh` to start the simulation environment'
echo "NOTE: Inspecting start.sh can spoil the tutorial's investigation"
echo 'IMPORTANT: You MUST now log out (and back in) for the installation'
echo 'changes to take effect!'
echo "----------------------------------------------------------------"
