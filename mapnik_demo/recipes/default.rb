include_recipe 'mapnik'

%w{ rake }.each do |gem|
  gem_package gem do
    action :install
  end
end

bash "install tilelite server" do
  cwd "/tmp"
  code <<-EOH
  sudo easy_install tilelite
  sudo easy_install Werkzeug
  EOH
end
