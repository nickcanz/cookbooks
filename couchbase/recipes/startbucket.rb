bash "start couchbase bucket" do
  cwd '/tmp'
  code <<-EOH
  curl -u vagrant:vagrant -d name=newbucket -d ramQuotaMB=100 -d authType=none -d replicaNumber=2 -d proxyPort=11215 http://localhost:8091/pools/default/buckets
  EOH
end
