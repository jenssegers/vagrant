# Install tools
node.tools.each do |tool|
	include_recipe "tools::#{tool}"
end
