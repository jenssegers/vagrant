php_pear "igbinary" do
    action :install
end

file "/etc/php5/mods-available/igbinary.ini" do
    content "extension=igbinary.so
"
end

file "/etc/php5/fpm/conf.d/igbinary.ini" do
	action :delete
end

service node["php"]["service"] do
    supports :status => true, :restart => true, :reload => true
end

execute "php5enmod" do
    command "php5enmod igbinary"
    notifies :restart, "service[#{node["php"]["service"]}]", :delayed
end
