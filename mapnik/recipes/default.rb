%w{ libmapnik0.7 mapnik-utils python-mapnik }.each do |pkg|
  apt_package pkg do
    action :install
  end
end
