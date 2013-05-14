#
# Cookbook Name:: worker-bee
# recipe:: query-processor
#
# Copyright ModCloth, Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'worker-bee::default'

template '/opt/scripts/query-processor.sh' do
  source 'query-processor.sh.erb'
  mode 0755
end

cron 'Worker Bee - Query Processor' do
  command '/opt/scripts/query-processor.sh'
end

