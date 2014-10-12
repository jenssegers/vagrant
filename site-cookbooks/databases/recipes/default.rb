
include_recipe "database::mysql"

mysql_connection_info = {
    :host     => 'localhost',
    :username => 'root',
    :password => node['mysql']['server_root_password']
}

node["mysql"]["users"].each do |username, password|

    mysql_database_user "#{username}" do
        connection mysql_connection_info
        password "#{password}"
        host '%'
        action [:create, :grant]
    end

end

node["mysql"]["databases"].each do |database|

    mysql_database "#{database}" do
        connection mysql_connection_info
        action :create
    end

end
