#
# Cookbook:: docker-ce
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.
install_packages = ['yum-utils', 'device-mapper-persistent-data',  'lvm2']


package install_packages do
  action :install
end
#
execute 'install container-selinux' do
  command 'sudo yum install -y http://mirror.centos.org/centos/7/extras/x86_64/Packages/container-selinux-2.95-2.el7_6.noarch.rpm'
  action :run
  not_if 'yum list installed | grep container-selinux'
end
# install EPEL (to install pigz)
execute 'install EPEL' do
  command "sudo yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-$(rpm -E '%{rhel}').noarch.rpm"
  action :run
  not_if 'yum list installed | grep epel-release'
end


# add docker repo
execute 'add docker-ce repo' do
  command 'wget https://download.docker.com/linux/centos/docker-ce.repo -O /etc/yum.repos.d/docker-ce.repo'
  action :run
end

execute 'yum makecache' do
    command "yum makecache fast"
    action :run
end


# install docker
package ['docker-ce', 'docker-ce-cli', 'containerd.io'] do
  action :install
end

# install docker-compose
execute 'install docker-compose' do
  command 'curl -L "https://github.com/docker/compose/releases/download/1.23.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose'
  action :run
end

execute 'chmod docker-compose' do 
    command 'chmod +x /user/local/bin/docker-compose'
    action :run
end
# start and enable docker service
service 'docker' do
  action [:start, :enable]
end


