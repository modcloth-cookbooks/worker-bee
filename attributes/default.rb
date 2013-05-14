#
# Cookbook Name:: worker-bee
# Attributes:: default
#
# Copyright ModCloth, Inc.
#
# All rights reserved - Do Not Redistribute
#

default[:worker_bee][:query_processor][:to_address]         = 'person@company.com'
default[:worker_bee][:query_processor][:from_address]       = 'person@company.com'
default[:worker_bee][:query_processor][:processor_dir]      = '/tmp'
default[:worker_bee][:query_processor][:process_for]        = 'localhost'

default[:worker_bee][:query_capture][:capture_dir]          = '/tmp'
default[:worker_bee][:query_capture][:capture_time]         = '600'

