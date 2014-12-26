include_recipe "apt"

apt_repository "multiverse" do
	uri "http://archive.ubuntu.com/ubuntu"
	distribution "#{node.lsb.codename}"
	components ["multiverse"]
end

apt_repository "updates-multliverse" do
	uri "http://archive.ubuntu.com/ubuntu"
	distribution "#{node.lsb.codename}-updates"
	components ["multiverse"]
end

apt_repository "security-multiverse" do
	uri "http://archive.ubuntu.com/ubuntu"
	distribution "#{node.lsb.codename}-security"
	components ["multiverse"]
end

package "libapache2-mod-fastcgi"

include_recipe "apache2::mod_actions"

apache_module "php5fpm" do
	filename "mod_fastcgi.so"
	identifier "fastcgi_module"
    conf true
end
