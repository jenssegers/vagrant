include_recipe "custom::databases"
include_recipe "custom::vhosts"
include_recipe "custom::custom"

cookbook_file "/etc/motd" do
    source "motd"
end
