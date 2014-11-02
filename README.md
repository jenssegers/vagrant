My personal Vagrant-based PHP development environment.

### Installation

Make sure you have installed Vagrant. Then run these commands:

    vagrant plugin install vagrant-omnibus
    gem install librarian-chef
    librarian-chef install

### Configuration

There are two main configuration files:

 - Vagrantfile (Vagrant configuration)
 - Vagrant.json (Chef node configuration)
