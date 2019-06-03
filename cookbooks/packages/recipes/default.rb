#
# Cookbook:: packages
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

install_yum_packages = ['git','epel-release','python-pip', 'python-dev', 'libffi-dev', 'openssl-dev', 'gcc', 'libc-dev', 'htop','iftop','nmap']


package install_yum_packages do 
    action :install
end

