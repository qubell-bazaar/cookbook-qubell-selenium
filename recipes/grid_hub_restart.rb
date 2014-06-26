include_recipe 'selenium::default'

SERVNAME='run-hub'
  service SERVNAME do
    supports :restart => true
    action :restart
  end
