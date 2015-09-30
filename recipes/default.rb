#
# Installs selenium 
#

case node['platform_family']
  when 'windows'
    node.set['java']['install_flavor']='windows'
    node.set['java']['java_home']='C:\Program Files\Java'
    node.set['selenium']['windows']['java']="#{node['java']['java_home']}\\bin\\java.exe"
    powershell_script "disable_firewall" do

      flags "-ExecutionPolicy Unrestricted"
      code <<-EOH
        netsh advfirewall set allprofiles state off
      EOH
    end

  when 'rhel'
    node.set['java']['install_flavor']='openjdk'
    node.set['java']['openjdk_version']="1.7.0.85-2.6.1.2.el7_1"

    service "iptables" do
      action :stop
    end

  when 'debian'
    node.set['java']['install_flavor']='openjdk'

    service "ipfw" do
      action :stop
    end
  end

include_recipe 'java'
include_recipe 'selenium::server'

