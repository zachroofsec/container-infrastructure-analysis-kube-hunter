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
4. `exit`
    + Log out of the shell
5. Open a new shell session
6. `cd kube-hunter-tutorial && bash start.sh`

# Special Thanks

+ Aqua Security
    + [Open Source Project Descriptions](https://www.aquasec.com/products/open-source-projects/)
    + [Github](https://github.com/aquasecurity)
    + [Twitter](https://twitter.com/AquaSecTeam)

# Course Links

## Pluralsight Courses

+ [Container Infrastructure Analysis with Trivy](https://app.pluralsight.com/library/courses/container-infrastructure-analysis-trivy/)
    + NOTE: Course dives deeper into Trivy (and Docker Registry tampering)

## Youtube

+ [DIY Pen-Testing for Your Kubernetes Cluster - Liz Rice, Aqua Security](https://www.youtube.com/watch?v=fVqCAUJiIn0)
+ [Securing your Kubernetes Delivery Pipelines with Notary and TUF](https://www.youtube.com/watch?v=JK70k_B87mw) 

## Blogs/Documentation

+ [Securing A Kubernetes Cluster](https://kubernetes.io/docs/tasks/administer-cluster/securing-a-cluster/)
+ [kube-hunter README](https://github.com/aquasecurity/kube-hunter)
+ [kube-hunter website](https://kube-hunter.aquasec.com/)
+ [kube-hunter modules](https://github.com/aquasecurity/kube-hunter/tree/cdd9f9d43264ae04122407eaf98816254e829c77/kube_hunter/modules)
+ [kube-bench](https://github.com/aquasecurity/kube-bench)
+ [kubeletctl](https://github.com/cyberark/kubeletctl)
+ [Trivy](https://github.com/aquasecurity/trivy)
+ [k9s](https://k9scli.io/)
+ [Pod Security Policies](https://kubernetes.io/docs/concepts/policy/pod-security-policy/)
+ [Docker Image History Modification](https://www.justinsteven.com/posts/2021/02/14/docker-image-history-modification)
+ [shhgit](https://github.com/eth0izzle/shhgit)

