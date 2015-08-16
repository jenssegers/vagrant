mysql_service "default" do
	port "3306"
	bind_address "0.0.0.0"
	initial_root_password node["mysql"]["server_root_password"]
	action [:create, :start]
end

mysql_client "default" do
	action :create
end

directory "/var/run/mysqld" do
	action :delete
	not_if { File.symlink?("/var/run/mysqld") }
end

link "/var/run/mysqld" do
	to "/run/mysql-default"
end
