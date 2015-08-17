include_recipe "custom::databases"
include_recipe "custom::apps"

cookbook_file "/etc/motd" do
    source "motd"
end
