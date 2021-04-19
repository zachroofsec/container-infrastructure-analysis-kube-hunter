#!/bin/bash

# +--------------------+
# GENERAL
# +--------------------+

# Starts the demo environment (in Kubernetes)

# +--------------------+
# MISC
# +--------------------+

# Get parent dir path
PARENT_DIR_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Allow commands (installed by brew) to be called
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

# +--------------------+
# MINIKUBE
# +--------------------+

minikube delete || true
echo "Starting Kubernetes via minikube..."
echo "(Depending on your internet speed, this might take 5 - 10 minutes)"
minikube start \
    --delete-on-failure \
    --driver docker \
    --kubernetes-version v1.20.0 \
    --memory 2g \
    --extra-config=kubelet.authorization-mode=AlwaysAllow \
    --extra-config=kubelet.anonymous-auth=True \
    --extra-config=apiserver.enable-admission-plugins=PodSecurityPolicy \
    --addons=pod-security-policy > /dev/null 2>&1

# +--------------------+
# KUBERNETES CONFIGS
# +--------------------+

echo "Applying Kubernetes configurations"

## Apply PERMISSIVE Pod Security Policy so Apache can be created
kubectl apply -f "$PARENT_DIR_PATH/start-helpers/psp.yml" > /dev/null 2>&1

kubectl apply -f "$PARENT_DIR_PATH/start-helpers/apache-deployment.yml" \
        -f "$PARENT_DIR_PATH/start-helpers/apache-service.yml"

# +--------------------+
# MISSION
# +--------------------+

echo "----------------------------------------------------------------"
echo "MISSION"
echo "You're on the Blue Team of Globomantics Inc"
echo "Globomantics would like you to ascertain the security of their Kubernetes cluster"
echo "Globomantics stated that all servers have been patched"
echo "----------------------------------------------------------------"
