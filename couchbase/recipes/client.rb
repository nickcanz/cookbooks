include_recipe 'build-essential'

package 'libevent-dev' do
  action :install
end

bash "install couchbase client" do
  cwd '/tmp'
  code <<-EOH
  wget http://packages.couchbase.com/clients/c/libvbucket{1,1-dbg,-dev}_1.8.0.2-1_i386.deb
  wget http://packages.couchbase.com/clients/c/libcouchbase{1,1-dbg,-dev}_1.0.1-1_i386.deb
  sudo dpkg -i lib{vbucket,couchbase}*.deb
  EOH
end

%w{ couchbase }.each do |g|
  gem_package g do
    action :install
  end
end
