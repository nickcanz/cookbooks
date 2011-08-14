#
# Cookbook Name:: opentreemap
# Recipe:: default
#
# Copyright 2011, Nick Canzoneri
#
# All rights reserved - Do Not Redistribute
#

include_recipe "git"
include_recipe "apache2"
include_recipe "python"
include_recipe "postgresql::server"
include_recipe "django"

git "/home/vagrant/opentreemap" do
  repository "git://github.com/azavea/OpenTreeMap.git"
  reference "master"
  action :sync
end
