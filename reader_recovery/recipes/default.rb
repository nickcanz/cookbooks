bash "update sources" do
  code <<-EOH
  sudo apt-get clean; sudo apt-get update
  EOH
end

include_recipe "rvm"
include_recipe "rvm::mri_1.9.3"

%w{ rails }.each do | my_gem |
  gem_package my_gem do
    action :install
  end
end

include_recipe "postgresql::server"

conn_info = {
  :host => 'localhost',
  :username => 'postgres',
  :password => node['postgresql']['password']['postgres']
}

#{{{ Dev database info
postgresql_database_user 'reader_recovery' do
  connection conn_info
  password 'reader_recovery'
  action :create
end

postgresql_database 'reader_recovery' do
  connection conn_info
  owner 'reader_recovery'
  encoding 'UNICODE'
  action :create
end

postgresql_database_user 'reader_recovery' do
  connection conn_info
  password 'reader_recovery'
  database_name 'reader_recovery'
  action :grant
end
#}}}

#{{{ test database info
postgresql_database_user 'reader_recovery_test' do
  connection conn_info
  password 'reader_recovery_test'
  action :create
end

postgresql_database 'reader_recovery_test' do
  connection conn_info
  owner 'reader_recovery_test'
  encoding 'UNICODE'
  action :create
end

postgresql_database_user 'reader_recovery_test' do
  connection conn_info
  database_name 'reader_recovery_test'
  password 'reader_recovery_test'
  action :grant
end
#}}}

include_recipe "nodejs"
include_recipe "nodejs::npm"

bash "install coffeescript" do
  cwd "/tmp"
  code <<-EOH
  sudo npm install -g coffee-script
  EOH
  not_if "npm ls -g | grep coffee-script"
end
