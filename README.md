My personal Vagrant-based PHP development environment.

## Installation

Install Virtualbox and Vagrant:

 - Virtualbox: https://www.virtualbox.org
 - Vagrant: https://www.vagrantup.com/downloads

More information about the Vagrant installation process: https://docs.vagrantup.com/v2/installation/index.html

## Requirements

We are using librarian-chef to download several community Chef cookbooks. Install the gem and download the cookbooks:

    gem install librarian-chef
    librarian-chef install

## Configuration

There are two main configuration files; the `Vagrantfile` which is read by Vagrant, and `Vagrant.json` which contains the Chef provisioning configuration:

### Vagrantfile

The most important configuration parameters can be found at the top of the file:

```
ip_address  = "192.168.13.37"
memory      = "512"
directory   = "/Users/USERNAME/Sites"
```

Make sure that you change the `directory` to the folder that contains all your projects on your machine.

### Vagrant.json

Rename the `Vagrant.json.example` file to `Vagrant.json`. `Vagrant.json` is the main configuration file used by Chef. It should be fairly straightforward to edit the file for your personal setup. Make sure you modify the apps and databases section for your vhost and database configuration. At the top are the Chef recipes that are executed.

## Starting the box

Go to the Vagrant box directory and run:

    vagrant up
