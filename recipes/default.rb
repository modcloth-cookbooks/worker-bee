#
# Cookbook Name:: worker-bee
# recipe:: default
#
# Copyright ModCloth, Inc.
#
# All rights reserved - Do Not Redistribute
#

directory '/opt/scripts' do
  action :create
  mode '0755'
  owner 'root'
  group 'root'
end

