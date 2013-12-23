#
# Cookbook Name:: kairosdb
# Recipe:: smartos_package
#
# Author: 
# Copyright 2013 PagodaBox Inc.
# 
# See 'LICENSE'
#

package "pbe-kairosdb" do
  version node['kairosdb']['version']
  action :install
end

directory "/opt/local/kairosdb/conf" do 
  recursive true
end

# add configuration
template "/opt/local/kairosdb/conf/kairosdb.properties" do
  mode 0644
  owner "root"
  group "root"
  variables node['kairosdb']
  # notifies :restart, 'service[kairosdb]', :immediately
end

# add smf

# add service start
# TEMPORARY until smf
execute "start kairos" do 
  command "/opt/local/kairosdb/bin/kairosdb.sh start"
end
