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
include_recipe "postgis"

%w{ libapache2-mod-wsgi python-psycopg2 binutils libgeos-c1 libgdal1-1.6.0 libproj0
    python-django-tagging python-imaging python-xlrd python-feedparser python-memcache
    python-beautifulsoup python-django-debug-toolbar python-simplejson
    python-django-extensions python-gdal
}.each do |pkg|
  apt_package pkg do
    action :install
  end
end

git "/home/vagrant/opentreemap" do
  repository "git://github.com/azavea/OpenTreeMap.git"
  reference "master"
  action :sync
end
