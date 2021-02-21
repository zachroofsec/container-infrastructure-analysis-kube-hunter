#!/bin/bash
#set -x

# +--------------------+
# GENERAL
# +--------------------+

# Starts the attack simulation environment (in Kubernetes)

# +--------------------+
# MINIKUBE
# +--------------------+

echo "Starting Kubernetes via minikube"
minikube delete || true
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
kubectl apply -f start-helpers/psp.yml

kubectl apply -f start-helpers/apache-deployment.yml \
        -f start-helpers/apache-service.yml

# +--------------------+
# MISSION
# +--------------------+

echo "----------------------------------------------------------------"
echo "MISSION"
echo "You've been hired to do a blackbox test of Globomantics Inc"
echo "Globomantics stated that all servers have been patched"
echo "Globomantics would like you to ascertain the security of their Kubernetes cluster"
echo "----------------------------------------------------------------"
