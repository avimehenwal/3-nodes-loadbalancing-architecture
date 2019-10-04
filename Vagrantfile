# 3 Node Load Balancing Architecture for webapps using Nginx

$script = <<-LBSCRIPT
echo 'Starting Provision: lb1'
sudo apt-get update
sudo apt-get install -y nginx
sudo service nginx stop
sudo rm -rf /etc/nginx/sites-enabled/default
sudo touch /etc/nginx/sites-enabled/default
echo "upstream testapp {
        server 10.0.0.11;
        server 10.0.0.12;
}

server {
        listen 80 default_server;
        listen [::]:80 default_server ipv6only=on;

        root /usr/share/nginx/html;
        index index.html index.htm;

        # Make site accessible from http://localhost/
        server_name localhost;

        location / {
                proxy_pass http://testapp;
        }

}" >> /etc/nginx/sites-enabled/default
sudo service nginx start
echo "Machine: lb1" >> /usr/share/nginx/html/index.html
echo 'Provision lb1 complete'
LBSCRIPT

$webscript = <<-SCRIPT
echo 'Starting Provision: web'$1
sudo apt-get update
sudo apt-get install -y nginx
echo "Machine: web"$1 >> /usr/share/nginx/html/index.html
echo 'Provision web'$1 'complete'
SCRIPT


BOX_IMAGE = "bento/ubuntu-18.04"
NODE_COUNT = 2

Vagrant.configure("2") do |config|
  config.vm.define "master" do |subconfig|
    subconfig.vm.box = BOX_IMAGE
    subconfig.vm.hostname = "master"
    subconfig.vm.network :private_network, ip: "10.0.0.10", virtualbox__intnet: "mynetwork"
  end
  
  (1..NODE_COUNT).each do |i|
    config.vm.define "node#{i}" do |subconfig|
      subconfig.vm.box = BOX_IMAGE
      subconfig.vm.hostname = "node#{i}"
      subconfig.vm.network :private_network, ip: "10.0.0.#{i + 10}", virtualbox__intnet: "mynetwork"
    end
  end

  # provision all machine 
  config.vm.provision "docker", images: ["nginx"]
  # Install avahi on all machines  
  config.vm.provision "shell", inline: <<-SHELL
    apt-get install -y avahi-daemon libnss-mdns
  SHELL
end