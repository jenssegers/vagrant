include_recipe "database::mysql"

mysql_connection_info = {
    :host     => 'localhost',
    :username => 'root',
    :password => node['mysql']['server_root_password']
}

mysql_database_user 'homestead' do
  connection mysql_connection_info
  password 'secret'
  host '%'
  action [:create, :grant]
end

mysql_database 'homestead' do
  connection mysql_connection_info
  action :create
end
