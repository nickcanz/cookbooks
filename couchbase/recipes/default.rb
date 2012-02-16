include_recipe 'curl'

bash "install couchbase server" do
  cwd "/tmp"
  code <<-EOH
  wget http://packages.couchbase.com/releases/1.8.0/couchbase-server-community_x86_1.8.0.deb
  sudo dpkg -i couchbase-server-community_x86_1.8.0.deb

  curl -d path=/var/tmp/test http://localhost:8091/nodes/self/controller/settings
  curl -d memoryQuota=293 http://localhost:8091/pools/default
  curl -d username=vagrant -d password=vagrant -d port=8091 http://localhost:8091/settings/web
  EOH
end
