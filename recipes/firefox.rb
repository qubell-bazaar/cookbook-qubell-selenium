case node['kernel']['machine']
when 'i686'
    arch = 'i386'
when 'x86_64'
    arch = 'amd64'
end

version = node['selenium']['firefox_version']

if version == ""
then
    package "firefox"
else
    remote_file "/tmp/firefox.deb" do
        source "http://downloads.sourceforge.net/project/ubuntuzilla/mozilla/apt/pool/main/f/" +
        "firefox-mozilla-build/firefox-mozilla-build_#{version}-0ubuntu1_#{arch}.deb"
    end

    dpkg_package "firefox" do
        source "/tmp/firefox.deb"
        action :install
    end
end
