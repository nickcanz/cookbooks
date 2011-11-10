include_recipe "rvm"

bash "installing ruby 1.9.3 in rvm" do
  user "root"
  code "rvm install 1.9.3"
  not_if "rvm list | grep 1.9.3"
end

bash "making ruby 1.9.3 the default in rvm" do
  user "root"
  code "rvm --default 1.9.3"
end

gem_package "chef" do
  action :install
end
