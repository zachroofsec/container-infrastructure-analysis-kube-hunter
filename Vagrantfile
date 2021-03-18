Vagrant.configure("2") do |config|
    config.vm.provider "virtualbox" do |vb|
        vb.gui = false
        vb.memory = "5192"
    end
    

    # For "final" demo environment that learner will use
    config.vm.define "demo_kube_hunter", primary: true do |demo|
        demo.vm.box = "zachroofsec/kube-hunter-tutorial"
        demo.vm.box_version = "1.0.0"
        demo.ssh.forward_agent = true
        demo.vm.synced_folder ".", "/home/vagrant/kube-hunter-tutorial", type:"virtualbox"
    end

    # For demo environment (while creating tutorial)
    config.vm.define "demo_inprog_kube_hunter", autostart: false do |demo_inprog|
        demo_inprog.vm.box = "kalilinux/rolling"
        demo_inprog.vm.box_version = "2021.1.0"
        demo_inprog.ssh.forward_agent = true
        demo_inprog.vm.synced_folder ".", "/home/vagrant/kube-hunter-tutorial", type:"virtualbox"
        demo_inprog.vm.provision "shell", path: "install-helpers/prompt-orchestrator.sh", privileged: true
    end

    # For test environment
    config.vm.define "test_kube_hunter", autostart: false do |test|
        test.vm.box = "kalilinux/rolling"
        test.vm.box_version = "2021.1.0"
        test.ssh.forward_agent = true
        test.vm.provision "shell", path: "install-helpers/prompt-orchestrator.sh", privileged: true
        test.vm.synced_folder ".", "/home/vagrant/kube-hunter-tutorial", type:"virtualbox"
    end
end
