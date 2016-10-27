#!/bin/bash
# Update libraries
sudo apt-get update
sudo apt-get upgrade -y

# install some dependencies
sudo apt-get install -y software-properties-common python-dev python-pip python3-dev python3-pip build-essential exuberant-ctags ncurses-term python-jinja2 curl git neovim htop zsh tmux

pip install --upgrade pip

pip install flake8 jedi neovim awscli

# getting tmux themes
git clone https://github.com/jimeh/tmux-themepack.git ~/.tmux-themepack

# switch to zsh
chsh -s /bin/zsh

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# set zsh configurations
echo 'Setting zshrc configuration'
cp zshrc ~/.zshrc

# set tmux configurations
echo 'Setting tmux configuration'
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
cp tmux.conf ~/.tmux.conf
source ~/.tmux.conf


# set vim configuration
echo 'Setting vim configuration'
mkdir ~/.config/nvim/
cp vim.rc ~/.config/nvim/init.vim

# install nvm
echo 'Installing nvm'
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.0/install.sh | bash

export NVM_DIR=~/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

echo 'Installing node 0.10'
nvm install node-v0.10

echo 'Installing latest node'
nvm install node

echo 'Installing rvm'
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable --ruby
source /home/henrique/.rvm/scripts/rvm

echo 'Installing ruby'
rvm install 2.1
