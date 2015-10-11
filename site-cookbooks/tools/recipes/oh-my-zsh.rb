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
	source "https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/templates/zshrc.zsh-template"
end

execute "change-theme" do
	command "sed -i 's/ZSH_THEME=\"robbyrussell\"/ZSH_THEME=\"jenssegers\"/g' /home/vagrant/.zshrc"
	only_if "grep 'ZSH_THEME=\"robbyrussell\"' /home/vagrant/.zshrc"
end

execute "disable-auto-update" do
	command "sed -i 's/# DISABLE_AUTO_UPDATE=\"true\"/DISABLE_AUTO_UPDATE=\"true\"/g' /home/vagrant/.zshrc"
	only_if "grep '# DISABLE_AUTO_UPDATE=\"true\"' /home/vagrant/.zshrc"
end

user "vagrant" do
    shell "/bin/zsh"
end
