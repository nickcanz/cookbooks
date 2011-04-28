git "~/.dotfiles" do
    repository "git://github.com/ac3522/dotfiles.igt"
    reference "master"
    action :sync
    migrate true
    migration_command "rake install"
end
