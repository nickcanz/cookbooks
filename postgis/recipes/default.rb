#
# Cookbook Name:: postgis
# Recipe:: default
#
# Copyright 2011, Nick Canzoneri
#
# All rights reserved - Do Not Redistribute
#

include_recipe "postgresql::server"
include_recipe "geos"

%w{ proj-bin libxml2 libpq-dev postgresql-server-dev-8.4 }.each do |pkg|
  apt_package pkg do
    action :install
  end
end

bash 'build and install postgis from source' do
  cwd '/tmp'
  code <<-EOH
  curl -C - -O http://postgis.refractions.net/download/postgis-1.5.3.tar.gz
  tar xzvf postgis-1.5.3.tar.gz
  cd postgis-1.5.3
  ./configure --with-geosconfig=/usr/local/include/geos
  make
  make check
  make install
  EOH
end
