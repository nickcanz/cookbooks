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
postgresql_database_user 'rsvpplusplus' do
  connection conn_info
  password 'rsvpplusplus'
  action :create
end

postgresql_database 'rsvpplusplus' do
  connection conn_info
  owner 'rsvpplusplus'
  encoding 'UNICODE'
  action :create
end

postgresql_database_user 'rsvpplusplus' do
  connection conn_info
  password 'rsvpplusplus'
  database_name 'rsvpplusplus'
  action :grant
end
#}}}

#{{{ test database info
postgresql_database_user 'rsvpplusplus_test' do
  connection conn_info
  password 'rsvpplusplus_test'
  action :create
end

postgresql_database 'rsvpplusplus_test' do
  connection conn_info
  owner 'rsvpplusplus_test'
  encoding 'UNICODE'
  action :create
end

postgresql_database_user 'rsvpplusplus_test' do
  connection conn_info
  database_name 'rsvpplusplus_test'
  password 'rsvpplusplus_test'
  action :grant
end
#}}}


bash "add node repository" do
  cwd '/tmp'
  code <<-EOH
  sudo add-apt-repository ppa:chris-lea/node.js
  EOH
  #sudo apt-get update
end

%w{ python-software-properties nodejs npm }.each{ |pkg|
  package pkg do
    action :install
  end
}

bash "install coffeescript" do
  cwd "/tmp"
  code <<-EOH
  sudo npm install -g coffee-script
  EOH
  not_if "npm ls -g | grep coffee-script"
end
