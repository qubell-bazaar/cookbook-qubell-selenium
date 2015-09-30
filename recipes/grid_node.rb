node.set['selenium']['node']['host']=node['ipaddress']

case node['platform_family']
  when 'rhel', 'debian'
    package "xorg-x11-server-Xvfb"
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

    #file "C:/selenium/drivers/chromedriver_win32-2.16/chromedriver.exe" do
    file "#{node['selenium']['windows']['home']}/drivers/chromedriver_win32-#{node['selenium']['chromedriver_version']}/chromedriver.exe" do
      ignore_failure true
      action :delete
    end
    directory "#{node['selenium']['windows']['home']}/drivers/iedriver" do
      ignore_failure true
      action :delete
    end
    #registry_key 'HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_BFCACHE' do
    #  values [{:name => 'iexplore.exe', :type => :dword, :data => '0'}]
    #  action :create
    #end
  end

include_recipe 'firefox::default'
include_recipe 'chrome::default'
include_recipe 'cookbook-qubell-selenium::default'
include_recipe 'selenium::node'

service "selenium_node" do
  supports :restart => true
  action :restart
end
