include_recipe "apache2"

apache_site "000-default" do
    enable false
end

web_app "vagrant" do
    server_name "localhost"
    server_aliases ["*"]
    allow_override "all"
    docroot "/var/www"
    template "vagrant.conf.erb"
    cookbook "apache2"
end
