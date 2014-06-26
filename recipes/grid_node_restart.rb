include_recipe 'selenium::default'

SERVNAME='run-node'
service SERVNAME do
  supports :restart => true
  action :restart
end
