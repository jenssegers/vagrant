include_recipe "apache2"

apache_site "000-default" do
    enable false
end

web_app "vagrant" do
    server_name "localhost"
    allow_override "all"
    docroot "/var/www"
    cookbook "apache2"
end
