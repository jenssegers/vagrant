# Disable default site
nginx_site "default" do
    enable false
end

# Set up nginx sites
node["apps"].each do |domain, config|
	variables = config.dup
	variables["domain"] = domain

	# Append aliases to the server name
	if variables["aliases"]
		variables["server_name"] = domain + " " + variables["aliases"].join(" ")
	else
		variables["server_name"] = domain
	end

    nginx_site domain do
        template "app.erb"
        variables variables
        enable true
        notifies :restart, "service[nginx]", :delayed
    end
end
