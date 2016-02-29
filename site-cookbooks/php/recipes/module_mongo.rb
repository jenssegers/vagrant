['pkg-config', 'libssl-dev', 'libsslcommon2-dev'].each do |pkg|
	package pkg
end

php_pear "mongo" do
    action :install
end

file "/etc/php5/mods-available/mongo.ini" do
    content "extension=mongo.so
"
end

service node["php"]["service"] do
    supports :status => true, :restart => true, :reload => true
end

execute "php5enmod" do
    command "php5enmod mongo"
    notifies :restart, "service[#{node["php"]["service"]}]", :delayed
end
