package "php5-intl" do
    action :install
end

execute "php5enmod" do
    command "php5enmod intl"
end
