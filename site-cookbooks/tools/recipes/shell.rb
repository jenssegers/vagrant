
git "/home/vagrant/.oh-my-zsh" do
    repository "https://github.com/robbyrussell/oh-my-zsh.git"
    reference "master"
    action :checkout
    not_if "test -d /home/vagrant/.oh-my-zsh"
end

remote_file "/home/vagrant/.zshrc" do
    source "https://raw.githubusercontent.com/jenssegers/dotfiles/master/.zshrc"
    action :create_if_missing
end

remote_file "/home/vagrant/.oh-my-zsh/themes/jenssegers.zsh-theme" do
    source "https://raw.githubusercontent.com/jenssegers/dotfiles/master/.oh-my-zsh/themes/jenssegers.zsh-theme"
    action :create_if_missing
end

remote_file "/home/vagrant/.gitconfig" do
    source "https://raw.githubusercontent.com/jenssegers/dotfiles/master/.gitconfig"
    action :create_if_missing
end

remote_file "/home/vagrant/.gitignore" do
    source "https://raw.githubusercontent.com/jenssegers/dotfiles/master/.gitignore"
    action :create_if_missing
end

cookbook_file "/home/vagrant/.aliases" do
    source "aliases"
end

user "vagrant" do
    shell "/bin/zsh"
end
