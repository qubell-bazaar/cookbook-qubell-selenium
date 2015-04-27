name 'selenium'
maintainer 'Cameron Johnston, Dmytro Makhno, Vasyl Khomenko, Artem Ivantsov'
maintainer_email 'support@qubell.com'
description 'installs components required for running selected flavors of selenium and selenium grid'
version '1.1.0'
%w{ java python runit chrome }.each { |cb| depends cb }

depends 'apt', '~> 2.3'
depends 'chrome', '~> 1.0.9'
depends 'firefox', '~> 2.0.0'
depends 'java', '~> 1.31.0'
depends 'yum', '~> 3.2'