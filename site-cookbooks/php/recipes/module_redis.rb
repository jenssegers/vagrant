package "php5-redis" do
    action :install
end

service node["php"]["service"] do
    supports :status => true, :restart => true, :reload => true
end

execute "php5enmod" do
    command "php5enmod redis"
    notifies :restart, "service[#{node["php"]["service"]}]", :delayed
end
