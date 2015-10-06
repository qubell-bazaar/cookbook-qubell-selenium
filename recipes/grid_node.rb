node.set['selenium']['node']['host']=node['ipaddress']

case node['platform_family']
  when 'rhel', 'debian'
    include_recipe "xvfb"
    node.set['selenium']['node']['capabilities'] = [
      {
        browserName: 'chrome',
        maxInstances: 5,
        seleniumProtocol: 'WebDriver'
      },
      {
        browserName: 'firefox',
        maxInstances: 5,
        seleniumProtocol: 'WebDriver'
      }
    ]
  when 'windows'
    include_recipe 'ie::bfcache'
    include_recipe 'ie::esc'
    include_recipe 'ie::firstrun'
    include_recipe 'ie::zone'
    include_recipe 'ie::zoom'
    node.set['selenium']['node']['capabilities'] = [
      {
        browserName: 'chrome',
        maxInstances: 5,
        seleniumProtocol: 'WebDriver'
      },
      {
        browserName: 'firefox',
        maxInstances: 5,
        seleniumProtocol: 'WebDriver'
      },
      {
        browserName: 'internet explorer',
        maxInstances: 1,
        seleniumProtocol: 'WebDriver'
      }
    ]

    file "#{node['selenium']['windows']['home']}/drivers/chromedriver_win32-#{node['selenium']['chromedriver_version']}/chromedriver.exe" do
      ignore_failure true
      action :delete
    end
    directory "#{node['selenium']['windows']['home']}/drivers/iedriver" do
      ignore_failure true
      action :delete
    end
  end

include_recipe 'firefox::default'
include_recipe 'chrome::default'
include_recipe 'cookbook-qubell-selenium::default'
include_recipe 'selenium::node'

service "selenium_node" do
  supports :restart => true
  action :restart
end
