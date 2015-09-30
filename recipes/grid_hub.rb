#
# Setup selenium hub
#

include_recipe 'cookbook-qubell-selenium::default'
include_recipe 'selenium::hub'

case node['platform_family']
  when "rhel"
    service "selenium_hub" do
      provider Chef::Provider::Service::Init::Redhat
      supports :restart => true
      action :restart
    end
  when "windows"
    service 'selenium_hub' do
      provider Chef::Provider::Service::Windows
      supports :restart => true
      action :restart
    end
  end
