#
# Cookbook Name:: opentreemap
# Recipe:: default
#
# Copyright 2011, Nick Canzoneri
#
# All rights reserved - Do Not Redistribute
#

include_recipe "apache2"
include_recipe "python"
include_recipe "postgresql::server"
include_recipe "django"

git "/etc/opentreemap" do
  repository "git://github.com/azavea/OpenTreeMap.git"
  action :sync
end
