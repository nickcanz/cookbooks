#
# Cookbook Name:: geos
# Recipe:: default
#
# Copyright 2011, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

include_recipe "curl"

apt_package "autotools-dev" do
  action :install
end

bash "build geos from source" do
  cwd "/tmp"
  code <<-EOH
  curl -C - -O http://download.osgeo.org/geos/geos-3.3.0.tar.bz2
  tar xjvf geos-3.3.0.tar.bz2
  cd geos-3.3.0
  ./configure
  make
  make check
  sudo make install
  sudo ldconfig
  EOH
  not_if {::File.exists? "/usr/local/include/geos.h" }
end
