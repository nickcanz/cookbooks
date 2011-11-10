include_recipe "rvm"
include_recipe "rvm::mri_1.9.3"

%w{ rails }.each do | my_gem |
  gem_package my_gem do
    action :install
  end
end

%w{ sqlite3 libsqlite3-dev }.each do |pkg|
  apt_package pkg do
    action :install
  end
end

include_recipe "nodejs"
include_recipe "nodejs::npm"

bash "install coffeescript" do
  cwd "/tmp"
  code <<-EOH
  sudo npm install -g coffee-script
  EOH
end
