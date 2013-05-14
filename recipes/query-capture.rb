#
# Cookbook Name:: worker-bee
# recipe:: query-capture
#
# Copyright ModCloth, Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'worker-bee::default'

template '/opt/scripts/query-capture.sh' do
  source 'query-capture.sh.erb'
  mode 0755
end

cron 'Worker Bee - Query Capture' do
  minute '0'
  hour '3'
  command '/opt/scripts/query-capture.sh'
end

