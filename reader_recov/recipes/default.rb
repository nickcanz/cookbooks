%w{ rails }.each do | my_gem |
  gem_package my_gem do
    action :install
  end
end

%w{ sqlite libsqlite3-dev }.each do |pkg|
  apt_package pkg do
    action :install
  end
end

include_recipe "nodejs"
include_recipe "nodejs::npm"
