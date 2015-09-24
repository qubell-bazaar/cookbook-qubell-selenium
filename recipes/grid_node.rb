node.set['selenium']['node']['host']=node['ipaddress']

case node['platform_family']
  when 'rhel', 'debian'
    #include_recipe "cookbook-qubell-selenium::xvfb"
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
  end

include_recipe 'firefox::default'
include_recipe 'chrome::default'
include_recipe 'cookbook-qubell-selenium::default'
include_recipe 'selenium::node'
