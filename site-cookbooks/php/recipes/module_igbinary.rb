php_pear "igbinary" do
    action :install
end

file "/etc/php5/mods-available/igbinary.ini" do
    content "extension=igbinary.so
"
end

execute "php5enmod" do
    command "php5enmod igbinary"
end
