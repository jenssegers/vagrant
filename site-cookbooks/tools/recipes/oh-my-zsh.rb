package "zsh"

git "/home/vagrant/.oh-my-zsh" do
    repository "https://github.com/robbyrussell/oh-my-zsh.git"
    reference "master"
    action :checkout
    user "vagrant"
    not_if "test -d /home/vagrant/.oh-my-zsh"
end

remote_file "/home/vagrant/.oh-my-zsh/themes/jenssegers.zsh-theme" do
    source "https://raw.githubusercontent.com/jenssegers/dotfiles/master/.oh-my-zsh/themes/jenssegers-server.zsh-theme"
end

remote_file "/home/vagrant/.zshrc" do
    source "https://raw.githubusercontent.com/jenssegers/dotfiles/master/.zshrc"
end

user "vagrant" do
    shell "/bin/zsh"
end
