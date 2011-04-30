deploy "~/.dotfiles" do
    repo "git://github.com/ac3522/dotfiles.git"
    revision "HEAD"
    action :deploy
    migrate true
    migration_command "rake install"
end
