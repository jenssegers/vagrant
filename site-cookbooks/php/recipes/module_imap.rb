package "php5-imap" do
    action :install
end

execute "php5enmod" do
    command "php5enmod imap"
end
