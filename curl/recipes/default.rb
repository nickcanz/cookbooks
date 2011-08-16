#
# Cookbook Name:: curl
# Recipe:: default
#
# Copyright 2011, Nick Canzoneri
#
# All rights reserved - Do Not Redistribute
#

apt_package "curl" do
  action :install
end
