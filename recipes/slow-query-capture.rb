#
# Cookbook Name:: worker-bee
# recipe:: slow-query-capture
#
# Copyright ModCloth, Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'worker-bee::default'

template '/opt/scripts/slow-query-capture.sh' do
  source 'slow-query-capture.sh.erb'
  mode 0755
end

cron 'Worker Bee - Slow Query Capture' do
  minute '0'
  hour '8'
  command '/opt/scripts/slow-query-capture.sh'
end

