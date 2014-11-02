package "php5-mcrypt" do
    action :install
end

execute "php5enmod" do
    command "php5enmod mcrypt"
end
