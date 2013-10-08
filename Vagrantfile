#!/usr/bin/env ruby

Vagrant.configure("2") do |config|

  config.berkshelf.enabled = true
  config.ssh.forward_agent = true

  config.vm.provider :virtualbox do |v|
    v.customize ["modifyvm", :id, "--natdnsproxy1", "off"]
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "off"]
    v.customize ["modifyvm", :id, "--cpus", "2", "--memory", "1024", "--cpuexecutioncap", "75"]
  end

  config.vm.provider :vmware_fusion do |v|
    v.vmx["memsize"] = "1024"
    v.vmx["numvcpus"] = "2"
  end

  config.vm.define :smartos do |smartos|

    smartos.vm.provider :virtualbox do |v, override|
      override.vm.box     = "smartos-base1310-64-virtualbox-20130806.box"
      override.vm.box_url = "http://dlc-int.openindiana.org/aszeszo/vagrant/smartos-base1310-64-virtualbox-20130806.box"
    end

    smartos.vm.provider :vmware_fusion do |v, override|
      override.vm.box     = "smartos-base1310-64-vmware_fusion-20130806.box"
      override.vm.box_url = "http://dlc-int.openindiana.org/aszeszo/vagrant/smartos-base1310-64-vmware_fusion-20130806.box"
    end

    smartos.vm.guest   = :solaris

    smartos.vm.provision :shell,
      :inline => 'which chef-solo >/dev/null || (sudo true && curl -sL http://cuddletech.com/chef/install.sh | bash)'

    smartos.vm.provision :chef_solo do |chef|
      chef.add_recipe 'kairosdb'
    end
  end

  config.vm.define :centos do |centos|

    centos.vm.provider :virtualbox do |v, overrides|
      overrides.vm.box     = "virtualbox_centos-6.4-x86_64-minimal.box"
      overrides.vm.box_url = "https://s3.amazonaws.com/vagrant.pagodabox.com/boxes/centos-6.4-x86_64-minimal.box"
    end

    centos.vm.provider :vmware_fusion do |v, overrides|
      overrides.vm.box     = "vmware_CentOS-6.4-i386-v20130427.box"
      overrides.vm.box_url = "http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.4-i386-v20130427.box"
    end

    centos.vm.provision :shell do |shell|
      shell.inline = "touch $1 && chmod 0440 $1 && echo -e $2 > $1" 
      shell.args   = %q{/etc/sudoers.d/root_ssh_agent "Defaults\tenv_keep += \"SSH_AUTH_SOCK\""}
    end

    centos.vm.provision :chef_solo do |chef|
      chef.add_recipe 'kairosdb'
    end

  end

  config.vm.define :ubuntu do |ubuntu|

    ubuntu.vm.provider :virtualbox do |v, overrides|
      overrides.vm.box     = "virtualbox_precise64"
      overrides.vm.box_url = 'http://files.vagrantup.com/precise64.box'
    end

    ubuntu.vm.provider :vmware_fusion do |v, overrides|
      overrides.vm.box     = "vmware_raring64.box"
      overrides.vm.box_url = "https://s3.amazonaws.com/life360-vagrant/raring64.box"
    end

    ubuntu.vm.provision :shell do |shell|
      shell.inline = "touch $1 && chmod 0440 $1 && echo -e $2 > $1" 
      shell.args   = %q{/etc/sudoers.d/root_ssh_agent "Defaults\tenv_keep += \"SSH_AUTH_SOCK\""}
    end

    ubuntu.vm.provision :chef_solo do |chef|
      chef.add_recipe 'kairosdb'
    end

  end

end