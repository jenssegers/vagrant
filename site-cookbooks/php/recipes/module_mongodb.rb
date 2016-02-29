['pkg-config', 'libssl-dev', 'libsslcommon2-dev'].each do |pkg|
	package pkg
end

php_pear "mongodb" do
    action :install
end

file "/etc/php5/mods-available/mongodb.ini" do
    content "extension=mongodb.so
"
end

service node["php"]["service"] do
    supports :status => true, :restart => true, :reload => true
end

execute "php5enmod" do
    command "php5enmod mongodb"
    notifies :restart, "service[#{node["php"]["service"]}]", :delayed
end
