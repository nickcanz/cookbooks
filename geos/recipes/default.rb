#
# Cookbook Name:: geos
# Recipe:: default
#
# Copyright 2011, Nick Canzoneri
#
# All rights reserved - Do Not Redistribute

include_recipe "curl"
include_recipe "build-essential"

apt_package "autotools-dev" do
  action :install
end

bash "build geos from source" do
  cwd "/tmp"
  code <<-EOH
  sudo awk '{ if (NR == 1) {gsub(/$/, " /usr/lib/local"); 1; print; }}' /etc/ld.so.conf > output.temp && sudo mv output.temp /etc/ld.so.conf
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
