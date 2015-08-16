package "php5-imap" do
    action :install
end

service node["php"]["service"] do
    supports :status => true, :restart => true, :reload => true
end

execute "php5enmod" do
    command "php5enmod imap"
    notifies :restart, "service[#{node["php"]["service"]}]", :delayed
end
