package "zsh"

git "/home/vagrant/.oh-my-zsh" do
    repository "https://github.com/robbyrussell/oh-my-zsh.git"
    reference "master"
    action :checkout
    user "vagrant"
    not_if "test -d /home/vagrant/.oh-my-zsh"
end

remote_file "/home/vagrant/.zshrc" do
    source "https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/templates/zshrc.zsh-template"
end

user "vagrant" do
    shell "/bin/zsh"
end
