#!/bin/bash

echo "[INFO] Backing up files"

mkdir -v ~/dotfiles_backup
cp -RLfv ~/.bash_profile ~/dotfiles_backup
cp -RLfv ~/.bashrc ~/dotfiles_backup
cp -RLfv ~/.git-autocompletion.sh ~/dotfiles_backup
cp -RLfv ~/.gitattributes ~/dotfiles_backup
cp -Rlfv ~/.gitconfig ~/dotfiles_backup
cp -RLfv ~/.gitignore ~/dotfiles_backup
cp -RLfv ~/.screenrc ~/dotfiles_backup
cp -RLfv ~/.ssh/config ~/dotfiles_backup
cp -RLfv ~/.inputrc ~/dotfiles_backup
cp -RLfv ~/.muttrc ~/dotfiles_backup
cp -RLfv ~/.zshrc ~/dotfiles_backup
cp -RLfv ~/.vimrc ~/dotfiles_backup

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
