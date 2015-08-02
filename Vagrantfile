# VM to host MongoDB
# -*- mode: ruby -*-
# vi: set ft=ruby :
# encoding: UTF-8

VAGRANTFILE_API_VERSION = "2"

$yumpackages = <<SCRIPT
yum install -y epel-release
yum install -y mongodb
yum install -y mongodb-server
sed -i 's/bind_ip = 127.0.0.1/bind_ip = 0.0.0.0/' /etc/mongod.conf
sudo systemctl start mongod
SCRIPT

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define "mongo" do |mongo|
    mongo.vm.box = "chef/centos-7.0"
    mongo.vm.provision "shell", inline: $yumpackages
    mongo.vm.synced_folder ".", "/vagrant", disabled: true
    mongo.vm.network :forwarded_port, host: 27017, guest: 27017
    mongo.vm.provider "virtualbox" do |provider|
      provider.memory = 1024
    end
  end
end
