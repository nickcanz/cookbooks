%w{ nokogiri rest_client }.each do | my_gem |
  gem_package my_gem do
    action :install
  end
end
