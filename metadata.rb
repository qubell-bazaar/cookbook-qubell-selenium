name 'selenium'
maintainer 'Dmytro Makhno'
maintainer_email 'support@qubell.com'
description 'installs components required for running selected flavors of selenium and selenium grid'
version '0.0.3'
%w{ java python runit }.each { |cb| depends cb }
