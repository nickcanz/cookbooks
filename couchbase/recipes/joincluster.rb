bash "Join server ones cluster" do
  cwd "/tmp"
  code <<-EOH
  curl -u vagrant:vagrant -d clusterMemberHostIp=33.33.33.10 -d clusterMemberPort=8091 -d user=vagrant -d password=vagrant http://localhost:8091/node/controller/doJoinCluster
  EOH
end
