# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  # Use Debian 7 base box provided by puppetlabs.
  config.vm.box = 'debian-70rc1-x64-vbox4210'
  config.vm.box_url = 'http://puppet-vagrant-boxes.puppetlabs.com/debian-70rc1-x64-vbox4210.box'

  config.vm.provider :virtualbox do |vb|
    # Speed up networking on Mac OS X.
    vb.customize ['modifyvm', :id, '--natdnshostresolver1', 'on']
    # Give it more ram.
    vb.customize ['modifyvm', :id, '--memory', '1024']
  end                                                  

  # When experiencing bad performance, uncomment the following two lines
  # to improve performance. You might need tho change the ip address to
  # something that is free on your system.
  # See http://docs.vagrantup.com/v2/synced-folders/nfs.html for further
  # details.
  # config.vm.network :private_network, ip: '10.0.0.2'
  # config.vm.synced_folder '.', '/vagrant', :nfs => true

  # Allow to access apache from the host system.
  config.vm.network :forwarded_port, guest: 80, host: 8080

  # Provision system with a standard lamp envirionment plus drush.
  config.vm.provision :shell, :inline => "apt-get update"
  config.vm.provision :puppet do |puppet|
    puppet.module_path = 'modules'
  end
end
