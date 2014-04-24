#!/bin/bash

echo "[INFO] Backing up files"

mkdir -v ~/dotfiles_backup
mv -fv ~/.* ~/dotfiles_backup

echo
echo "[INFO] Symlinking environment"

ln -fsv $(PWD)/bash/bash_profile ~/.bash_profile
ln -fsv $(PWD)/bash/bashrc ~/.bashrc
ln -fsv $(PWD)/git/git-autocompletion.sh ~/.git-autocompletion.sh
ln -fsv $(PWD)/git/gitattributes ~/.gitattributes
ln -fsv $(PWD)/git/gitconfig ~/.gitconfig
ln -fsv $(PWD)/git/gitignore ~/.gitignore
ln -fsv $(PWD)/screen/screenrc ~/.screenrc
ln -fsv $(PWD)/ssh/config ~/.ssh/config
ln -fsv $(PWD)/bash/inputrc ~/.inputrc

echo
echo "[INFO] Installing Other Packages"

echo
echo "[INFO] Installing oh-my-zsh"

ln -Fsv $(PWD)/oh-my-zsh ~/.oh-my-zsh
ln -Fsv $(PWD)/zsh/zshrc ~/.zshrc
chsh -s /bin/zsh

echo
echo "[INFO] Installing vim and extras"

ln -fsv $(PWD)/vim/vimrc ~/.vimrc
ln -Fsv $(PWD)/vim ~/.vim
vim +PluginInstall +qall
