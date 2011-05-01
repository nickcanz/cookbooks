git "~/.dotfiles" do
    repository "git://github.com/ac3522/dotfiles.git"
    action :sync
end

execute "rake_install" do
  cwd "~/.dotfiles"
  command "rake install"
end
