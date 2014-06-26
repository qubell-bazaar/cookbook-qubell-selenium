remote_file File.join(node['selenium']['server']['installpath'], 'selenium-server-standalone.jar') do
  action :delete
end

include_recipe 'selenium::grid_hub'
