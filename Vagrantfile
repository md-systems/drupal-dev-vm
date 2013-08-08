# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|                                                                     
  config.vm.box = 'debian-70rc1-x64-vbox4210'
  config.vm.box_url = 'http://puppet-vagrant-boxes.puppetlabs.com/debian-70rc1-x64-vbox4210.box'

  config.vm.network :forwarded_port, guest: 80, host: 8080

  config.vm.synced_folder './docroot', '/var/www'
       
  config.vm.provision :shell, :inline => "apt-get update"
  config.vm.provision :puppet do |puppet|
    puppet.module_path = 'modules'
  end
end
