git "/home/vagrant/.dotfiles" do
    repository "git://github.com/ac3522/dotfiles.git"
    action :sync
end

execute "rake_install" do
  cwd "/home/vagrant/.dotfiles"
  command "rake install"
  command "chsh -s /usr/bin/zsh"
end
