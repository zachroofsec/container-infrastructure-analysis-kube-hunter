# What is this?

+ Supplementary repo for the course: [Container Infrastructure Analysis with kube-hunter](https://app.pluralsight.com/library/courses/container-infrastructure-analysis-kube-hunter/)

# Prerequisites

1. Basic Docker knowledge
    + Recommended course: [Getting Started With Docker](https://app.pluralsight.com/library/courses/getting-started-docker)

2. Basic Kubernetes knowledge
    + Recommended course: [Getting Started With Kubernetes](https://app.pluralsight.com/library/courses/kubernetes-getting-started)

# Main Setup Instructions

## Option 1: VM with everything installed **(preferred method)**

1. [Install Vagrant](https://www.vagrantup.com/docs/installation)
2. `git clone https://github.com/zachroofsec/kube-hunter-tutorial.git && cd kube-hunter-tutorial`
3. `vagrant up && vagrant ssh`
4. `cd kube-hunter-tutorial`

## Option 2: Install yourself

1. **Important**
    + You must be on a recent version of Kali Linux (e.g., 2021.1.0)!
    + There might be problems if package names change into the future
2. `git clone https://github.com/zachroofsec/kube-hunter-tutorial.git && cd kube-hunter-tutorial`
3. `bash install.sh`
4. `source $HOME/.bashrc`
5. `bash start.sh`

# Special Thanks

+ Aqua Security
    + [Open Source Project Descriptions](https://www.aquasec.com/products/open-source-projects/)
    + [Github](https://github.com/aquasecurity)
    + [Twitter](https://twitter.com/AquaSecTeam)

# Course Links

## Pluralsight Courses

+ [Infrastructure Analysis with Trivy](https://app.pluralsight.com/library/courses/container-infrastructure-analysis-trivy/)
    + NOTE: Course dives deeper into Trivy (and Docker Registry tampering)

## Youtube

+ [DIY Pen-Testing for Your Kubernetes Cluster - Liz Rice, Aqua Security](https://www.youtube.com/watch?v=fVqCAUJiIn0)

## Blogs/Documentation

+ [kube-hunter documentation](https://github.com/aquasecurity/kube-hunter)
+ [kube-hunter website](https://kube-hunter.aquasec.com/)
+ [kubeletctl](https://github.com/cyberark/kubeletctl)
+ [Trivy](https://github.com/aquasecurity/trivy)
+ [k9s](https://k9scli.io/)
+ [Pod Security Policy](https://kubernetes.io/docs/concepts/policy/pod-security-policy/)
+ [Docker Image History Modification](https://www.justinsteven.com/posts/2021/02/14/docker-image-history-modification)
+ [shhgit](https://github.com/eth0izzle/shhgit)

