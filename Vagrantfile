# 3 Node Load Balancing Architecture for webapps using Nginx
# Vagrant shell provisioning

Vagrant.configure("2") do |config|

  config.vm.define "lb1" do |lb1|
    lb1.vm.box = "ubuntu/xenial64"
    lb1.vm.network "private_network", ip: "10.0.0.10"
    lb1.vm.provision "shell", path: "https://gist.githubusercontent.com/abraunton/263a1796578ebc487af8/raw/7da0dced1083610bf3275a9fae3dca05bf0ae51a/provision-lb.sh"
  end

  config.vm.define "web1" do |web1|
    web1.vm.box = "ubuntu/xenial64"
    web1.vm.network "private_network", ip: "10.0.0.11"
    web1.vm.provision :shell do |shell|
      shell.args = "1"
      shell.path = "https://gist.githubusercontent.com/abraunton/1bfbf0aba866baa3b1fa/raw/ef4f6423de7fe5884051f63d5c6e1d55d3ee2974/provision-web.sh"
    end
  end

  config.vm.define "web2" do |web2|
    web2.vm.box = "ubuntu/xenial64"
    web2.vm.network "private_network", ip: "10.0.0.12"
    web2.vm.provision :shell do |shell|
      shell.args = "2"
      shell.path = "https://gist.githubusercontent.com/abraunton/1bfbf0aba866baa3b1fa/raw/ef4f6423de7fe5884051f63d5c6e1d55d3ee2974/provision-web.sh"
    end
  end

end
