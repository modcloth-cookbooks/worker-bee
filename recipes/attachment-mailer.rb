#
# Cookbook Name:: worker-bee
# recipe:: attachment-mailer
#
# Copyright ModCloth, Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe "worker-bee::default"

cookbook_file '/opt/scripts/attachment-mailer.sh' do
  source 'attachment-mailer.sh'
  mode 0755
end

