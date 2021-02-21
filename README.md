# What is this?
+ Supplementary repo for the course: [Container Infrastructure Analysis with kube-hunter](https://app.pluralsight.com/library/courses/container-infrastructure-analysis-kube-hunter/)

# Setup Instructions
## Option 1: VM with everything installed (preferred method)
1. [Install Vagrant](https://www.vagrantup.com/docs/installation) 
2. `git clone https://github.com/zachroofsec/tutorial-kube-hunter.git && cd tutorial-kube-hunter`
3. `vagrant up && vagrant ssh`
4. `cd tutorial-kube-hunter && bash start.sh`

## Option 2: Install yourself
1. Important
    + You must be on a recent version of Kali Linux (i.e., 2020.3.0)! 
    + There might be problems if package names change into the future
2. `git clone https://github.com/zachroofsec/tutorial-kube-hunter.git && cd tutorial-kube-hunter`
3. `bash install.sh && source $HOME/.bashrc && bash start.sh`

# Special Thanks

# Course Notes

# Additional Resources Slide
