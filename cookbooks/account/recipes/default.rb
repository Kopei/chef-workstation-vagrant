#
# Cookbook:: account
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

user 'deployer' do
  username "deployer"
  home  '/home/deployer'
  uid  3000
  gid  'docker'
  shell  '/bin/bash'
  action :create
end

user 'jenkins' do
    username 'jenkins'
    home '/home/jenkins'
    uid 4000
    gid 'wheel'
    shell '/bin/bash'
    action :create
end



