# FPM settings
default["php"]["packages"] = ["php5-fpm", "php5-dev", "php5-cli", "php-pear"]
default["php"]["conf_dir"] = "/etc/php5/fpm"
default["php"]["ext_conf_dir"] = "/etc/php5/fpm/conf.d"
default["php"]["service"] = "php5-fpm"

# Overide default settings for development
default["php"]["directives"]["display_errors"] = "On"
default["php"]["directives"]["display_startup_errors"] = "On"
default["php"]["directives"]["default_charset"] = "utf-8"
default["php"]["directives"]["html_errors"] = "On"
default["php"]["directives"]["max_execution_time"] = 0
default["php"]["directives"]["opcache.enable"] = "Off"
default["php"]["directives"]["apc.cache_by_default"] = "Off"
default["php"]["directives"]["xdebug.remote_enable"] = "On"
default["php"]["directives"]["xdebug.remote_connect_back"] = "On"
default["php"]["directives"]["xdebug.var_display_max_data"] = -1
default["php"]["directives"]["xdebug.var_display_max_depth"] = 8
default["php"]["directives"]["xdebug.max_nesting_level"] = 200

# PHP pool settings
default["php"]["pool"]["pm"] = "ondemand"
default["php"]["pool"]["pm.max_children"] = 3
default["php"]["pool"]["pm.process_idle_timeout"] = "10s"
