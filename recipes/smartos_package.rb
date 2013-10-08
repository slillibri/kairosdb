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
  version "1.7.21nb3"
end

package "kairosdb" do
  version node['kairosdb']['version']
  action :install
end

# add configuration

# add smf

# add service start
# TEMPORARY until smf
execute "start kairos" do 
  command "/opt/local/kairosdb/bin/kairosdb.sh start"
end