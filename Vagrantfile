Vagrant.configure("2") do |config|
    config.vm.provider "virtualbox" do |vb|
        vb.gui = false
        vb.memory = "5192"
    end

    # For "final" demo environment that learner will use
    config.vm.define "demo", primary: true do |demo|
        config.vm.box = "zachroofsec/kube-hunter"
        config.vm.box_version = "1.0.0"
        config.vm.synced_folder ".", "/home/vagrant/tutorial-kube-hunter"
    end

    # For demo environment (while creating tutorial)
    config.vm.define "demo-inprog", autostart: false do |demo|
        config.vm.box = "kalilinux/rolling"
        config.vm.box_version = "2020.3.0"
    end

    # For test environment
    config.vm.define "test", autostart: false do |test|
        config.vm.box = "kalilinux/rolling"
        config.vm.box_version = "2020.3.0"
        config.vm.synced_folder ".", "/home/vagrant/tutorial-kube-hunter"
    end
end
