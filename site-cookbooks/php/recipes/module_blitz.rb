version = "0.8.12"
tmp_dir = Chef::Config[:file_cache_path]

remote_file "#{tmp_dir}/blitz-#{version}.tar.gz" do
    source "http://alexeyrybak.com/blitz/all-releases/blitz-#{version}.tar.gz"
    not_if "test -f `php-config --extension-dir`/blitz.so"
end

execute "blitz-untar" do
    cwd "#{tmp_dir}"
    command "tar xvzf blitz-#{version}.tar.gz"
    not_if "test -f `php-config --extension-dir`/blitz.so"
end

execute "blitz-phpize" do
    cwd "#{tmp_dir}/blitz-#{version}"
    command "phpize"
    not_if "test -f `php-config --extension-dir`/blitz.so"
end

execute "blitz-configure" do
    cwd "#{tmp_dir}/blitz-#{version}"
    command "./configure"
    not_if "test -f `php-config --extension-dir`/blitz.so"
end

execute "blitz-install" do
    cwd "#{tmp_dir}/blitz-#{version}"
    command "make install"
    not_if "test -f `php-config --extension-dir`/blitz.so"
end

file "/etc/php5/mods-available/blitz.ini" do
    content "extension=blitz.so
"
end

execute "php5enmod" do
    command "php5enmod blitz"
end
