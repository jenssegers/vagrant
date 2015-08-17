mysql_connection_info = {
    :host     => 'localhost',
    :username => 'root',
    :password => node['mysql']['server_root_password']
}

mysql2_chef_gem 'default' do
    client_version node['mysql']['version'] if node['mysql'] && node['mysql']['version']
    action :install
end

# --------------------------------------
# Users
# --------------------------------------

mysql_database_user "root" do
    connection mysql_connection_info
    host '%'
    action :grant
end

mysql_database_user "homestead" do
    connection mysql_connection_info
    password "secret"
    host '%'
    action [:create, :grant]
end

# --------------------------------------
# Databases
# --------------------------------------

node["databases"].each do |database|
    mysql_database database do
        connection mysql_connection_info
        action :create
    end
end
