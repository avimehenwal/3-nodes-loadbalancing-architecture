# 3 Node Load Balancing Architecture for webapps using Nginx
# Vagrant shell provisioning

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

Vagrant.configure("2") do |config|

  config.vm.define "lb1" do |lb1|
    lb1.vm.box = "ubuntu/xenial64"
    lb1.vm.network "private_network", ip: "10.0.0.10"
    lb1.vm.provision "shell", inline: $script
  end

  config.vm.define "web1" do |web1|
    web1.vm.box = "ubuntu/xenial64"
    web1.vm.network "private_network", ip: "10.0.0.11"
    web1.vm.provision "shell", inline: $webscript
  end

  config.vm.define "web2" do |web2|
    web2.vm.box = "ubuntu/xenial64"
    web2.vm.network "private_network", ip: "10.0.0.12"
    web2.vm.provision "shell", inline: $webscript
    # web2.vm.provision :shell do |shell|
    #   shell.args = "2"
    #   shell.path = "https://gist.githubusercontent.com/abraunton/1bfbf0aba866baa3b1fa/raw/ef4f6423de7fe5884051f63d5c6e1d55d3ee2974/provision-web.sh"
  end

end
