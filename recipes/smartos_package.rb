#
# Cookbook Name:: kairosdb
# Recipe:: smartos_package
#
# Author: 
# Copyright 2013 PagodaBox Inc.
# 
# See 'LICENSE'
#

package "openjdk7" do
  version "1.7.25nb2"
end

package "kairosdb" do
  version node['kairosdb']['version']
  action :install
end

# add configuration
template "/opt/local/kairosdb/conf/kairosdb.properties" do
  mode 0644
  owner "root"
  group "root"
  variables node['kairosdb']
  # notifies :restart, 'service[kairosdb]', :immediately
end

#  

# add smf

# add service start
# TEMPORARY until smf
execute "start kairos" do 
  command "/opt/local/kairosdb/bin/kairosdb.sh start"
end
