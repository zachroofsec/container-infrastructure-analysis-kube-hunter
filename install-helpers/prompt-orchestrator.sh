#!/bin/bash
set -x

chmod +x /home/vagrant/kube-hunter-tutorial/install-helpers/prompt-installer.sh
/home/vagrant/kube-hunter-tutorial/install-helpers/prompt-installer.sh --force
echo 'export STARSHIP_CONFIG=/home/vagrant/kube-hunter-tutorial/install-helpers/starship.toml' >> /home/vagrant/.bashrc
echo 'eval "$(starship init bash)"' >> /home/vagrant/.bashrc