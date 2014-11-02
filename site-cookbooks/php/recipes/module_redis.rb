tmp_dir = Chef::Config[:file_cache_path]

git "#{tmp_dir}/phpredis" do
    repository "https://github.com/nicolasff/phpredis.git"
    not_if "test -f `php-config --extension-dir`/redis.so"
end

execute "redis-phpize" do
    cwd "#{tmp_dir}/phpredis"
    command "phpize"
    not_if "test -f `php-config --extension-dir`/redis.so"
end

execute "redis-configure" do
    cwd "#{tmp_dir}/phpredis"
    command "./configure --enable-redis-igbinary"
    not_if "test -f `php-config --extension-dir`/redis.so"
end

execute "redis-make" do
    cwd "#{tmp_dir}/phpredis"
    command "make"
    not_if "test -f `php-config --extension-dir`/redis.so"
end

execute "redis-install" do
    cwd "#{tmp_dir}/phpredis"
    command "make install"
    not_if "test -f `php-config --extension-dir`/redis.so"
end

file "/etc/php5/mods-available/redis.ini" do
    content "extension=redis.so
"
end

execute "php5enmod" do
    command "php5enmod redis"
end
