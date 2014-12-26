package "php5-redis" do
    action :install
end

execute "php5enmod" do
    command "php5enmod redis"
end
