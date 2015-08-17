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

include_recipe "apache2::mod_fastcgi"
