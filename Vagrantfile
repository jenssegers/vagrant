VAGRANTFILE_API_VERSION = "2"

# --------------------------------------------------------------------------
# Configuration
# --------------------------------------------------------------------------

# Variables
ip_address  = "192.168.33.10"
memory      = "1024"
directory   = "/Users/Jens/Sites"


# --------------------------------------------------------------------------
# Vagrant stuff
# --------------------------------------------------------------------------

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "ubuntu/trusty64"

  # Port forwarding
  config.vm.network "forwarded_port", guest: 80, host: 8000
  config.vm.network "forwarded_port", guest: 3306, host: 3306

  # Private network
  config.vm.network "private_network", ip: ip_address
  config.vm.hostname = "vagrant"

  # Folders
  config.vm.synced_folder directory, "/var/www", type: "nfs"

  # VirtualBox
  config.vm.provider "virtualbox" do |vb|
    vb.name = "Vagrant"
    vb.customize ["modifyvm", :id, "--memory", memory]
    vb.customize ["modifyvm", :id, "--cpus", "1"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  end

  # Get Chef json
  VAGRANT_JSON = JSON.parse(Pathname(__FILE__).dirname.join('Vagrant.json').read)

  # Provisioning
  config.omnibus.chef_version = :latest
  config.vm.provision "chef_solo" do |chef|
    chef.cookbooks_path = ["site-cookbooks", "cookbooks"]
    chef.run_list = VAGRANT_JSON.delete('run_list') if VAGRANT_JSON['run_list']
    chef.json = VAGRANT_JSON
  end

end
