%w{ python-setuptools libmapnik0.7 mapnik-utils python-mapnik }.each do |pkg|
  apt_package pkg do
    action :install
  end
end

bash "install tilelite server" do
  cwd "/tmp"
  code <<-EOH
  sudo easy_install tilelite
  EOH
end

