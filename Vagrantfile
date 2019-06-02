# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
require 'json'

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.hostname = 'web1'
  vagrant_json = JSON.parse(Pathname(__FILE__).dirname.join('nodes', "#{config.vm.hostname}.json").read)

  config.vm.box = "generic/rhel7"

#  config.omnibus.chef_version = :latest

  config.vm.provision :chef_solo do |chef|
    chef.log_level = :debug
    chef.arguments = "--chef-license accept"

    chef.nodes_path = "nodes"
    chef.cookbooks_path = ["site-cookbooks", "cookbooks"]
    chef.run_list = vagrant_json.delete('run_list')
    chef.json = vagrant_json
  end
end
