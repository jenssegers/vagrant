VAGRANTFILE_API_VERSION = "2"

# --------------------------------------------------------------------------
# Configuration
# --------------------------------------------------------------------------

# Variables
ip_address  = "10.255.255.10"
cpus        = "1"
memory      = "512"
directory   = "/Users/Jens/Projects"


# --------------------------------------------------------------------------
# Vagrant stuff
# --------------------------------------------------------------------------

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  #config.vm.box = "ubuntu/trusty64"
  config.vm.box = "parallels/ubuntu-14.04"

  # Port forwarding
  config.vm.network "forwarded_port", guest: 80, host: 8000     # Nginx HTTP
  config.vm.network "forwarded_port", guest: 443, host: 8443    # Nginx HTTPS
  config.vm.network "forwarded_port", guest: 3306, host: 3306   # Mysql
  config.vm.network "forwarded_port", guest: 27017, host: 27017 # Mongodb

  # Private network
  config.vm.network "private_network", ip: ip_address
  config.vm.hostname = "vagrant"

  # Folders
  config.vm.synced_folder directory, "/var/www"

  # VirtualBox
  config.vm.provider "virtualbox" do |vb|
    vb.name = "Vagrant"
    vb.customize ["modifyvm", :id, "--memory", memory]
    vb.customize ["modifyvm", :id, "--cpus", cpus]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  end

  # Parallels
  config.vm.provider "parallels" do |prl|
    prl.name = "Vagrant"
    prl.linked_clone = true
    prl.memory = memory
    prl.cpus = cpus
  end

  # Get Chef json
  VAGRANT_JSON = JSON.parse(Pathname(__FILE__).dirname.join("Vagrant.json").read)

  # Provisioning
  if Vagrant.has_plugin?("vagrant-omnibus")
    config.omnibus.chef_version = "latest"
  end

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["site-cookbooks", "cookbooks"]
    chef.run_list = VAGRANT_JSON.delete("run_list") if VAGRANT_JSON["run_list"]
    chef.json = VAGRANT_JSON
  end

end
