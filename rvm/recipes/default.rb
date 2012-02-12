include_recipe "curl"
include_recipe "git"

bash "Installing rvm from command" do
  cwd "/tmp"
  code <<-EOH
  bash < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer )
  EOH
  not_if "which rvm | grep ."
end

bash "reload bash" do
  cwd "/tmp"
  code <<-EOH
  exec bash
  EOH
end
