#
# Cookbook Name:: kairosdb
# Recipe:: default
#
# Author: 
# Copyright 2013 PagodaBox Inc.
# 
# See 'LICENSE'
#
 
 
# 1- Install
begin
  include_recipe "kairosdb::#{node[:platform]}_#{node['kairosdb']['install_type']}"
rescue Chef::Exceptions::RecipeNotFound => e
  Chef::Log.info("!!!! #{node['kairosdb']['install_type']} install is not yet supported for #{node[:platform]} :( !!!!")
  raise e
end
