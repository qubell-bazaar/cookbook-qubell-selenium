name 'selenium'
maintainer 'Cameron Johnston, Dmytro Makhno, Vasyl Khomenko, Artem Ivantsov'
maintainer_email 'support@qubell.com'
description 'installs components required for running selected flavors of selenium and selenium grid'
version '1.0.1'
%w{ java python runit }.each { |cb| depends cb }
