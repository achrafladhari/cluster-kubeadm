Vagrant.configure("2") do |config|
  config.vm.provision "shell", inline: <<-SHELL
      apt-get update -y
      echo "10.0.0.10  master-node" >> /etc/hosts
      echo "10.0.0.11  worker-node01" >> /etc/hosts
      echo "10.0.0.12  worker-node02" >> /etc/hosts
  SHELL
  
  config.vm.define "master" do |master|
    master.vm.box = "generic/debian12"
    master.vm.hostname = "master-node"
    master.vm.network "private_network", ip: "10.0.0.10"
    master.vm.provider "libvirt" do |vb|
        vb.memory = 2048
        vb.cpus = 2
    end
    master.vm.provision "shell", path: "./scripts/common.sh"
    master.vm.provision "shell", path: "./scripts/main-master.sh"

  end

  (1..2).each do |i|

  config.vm.define "node0#{i}" do |node|
    node.vm.box = "generic/debian12"
    node.vm.hostname = "worker-node0#{i}"
    node.vm.network "private_network", ip: "10.0.0.1#{i}"
    node.vm.provider "libvirt" do |vb|
        vb.memory = 2048
        vb.cpus = 1
    end
    node.vm.provision "shell", path: "./scripts/common.sh"
  end
  
  end
end
