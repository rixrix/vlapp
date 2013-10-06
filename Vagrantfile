# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

    ####################################################################################################################
    # Basebox
    ####################################################################################################################
    config.vm.box = "base"

    ####################################################################################################################
    # The url from where the 'config.vm.box' box will be fetched if it
    # doesn't already exist on the user's system.
    #
    # Note: Use Puppetlab's official box (w/ Puppet & Chef installed)
    #
    ####################################################################################################################

    config.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/centos-64-x64-vbox4210.box"

    ####################################################################################################################
    # Main Configuration
    ####################################################################################################################

    config.vm.define :vlapp do |vlapp|
        vlapp.vm.box = "vLAPP"
        vlapp.vm.network :private_network, ip: "192.168.50.10"
        vlapp.vm.synced_folder "shared", "/vagrant_data"

        # Virtualbox
        vlapp.vm.provider "virtualbox" do |v|
            v.name = "vLAPP"
        end

        # Shell provisioning
        # - order is important before provisioning Puppet
        vlapp.vm.provision :shell do |shell|
            shell.path = "scripts/install-modules.sh"
        end

        # Puppet provisioning
        vlapp.vm.provision :puppet do |puppet|
            puppet.manifests_path = "manifests"
            puppet.manifest_file  = "init.pp"
            puppet.module_path = [ 'modules' ]
            puppet.option = [
                '--verbose'
            ]
        end
    end

end
