
include_recipe "curl"
include_recipe "build-essential"

bash "build ruby 1.9.3 from source" do
  cwd "/tmp"
  code <<-EOH
  curl -C - -O http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p0.tar.gz
  tar xzvf ruby-1.9.3-p0.tar.gz
  cd ruby-1.9.3-p0
  ./configure
  make
  sudo make install
  EOH
  not_if "ruby -v | grep 1.9.3"
end

