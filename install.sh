#!/bin/bash

echo "[INFO] Backing up files"

mkdir -v ~/dotfiles_backup
cp -RLfv ~/.bash_profile ~/dotfiles_backup
cp -RLfv ~/.bashrc ~/dotfiles_backup
cp -RLfv ~/.git-autocompletion.sh ~/dotfiles_backup
cp -RLfv ~/.gitattributes ~/dotfiles_backup
cp -RLfv ~/.gitconfig ~/dotfiles_backup
cp -RLfv ~/.gitignore ~/dotfiles_backup
cp -RLfv ~/.screenrc ~/dotfiles_backup
cp -RLfv ~/.ssh/config ~/dotfiles_backup
cp -RLfv ~/.inputrc ~/dotfiles_backup
cp -RLfv ~/.muttrc ~/dotfiles_backup
cp -RLfv ~/.zshrc ~/dotfiles_backup
cp -RLfv ~/.vimrc ~/dotfiles_backup

echo
echo "[INFO] Symlinking environment"

ln -fsv $(pwd)/bash/bash_profile ~/.bash_profile
ln -fsv $(pwd)/bash/bashrc ~/.bashrc
ln -fsv $(pwd)/git/git-autocompletion.sh ~/.git-autocompletion.sh
ln -fsv $(pwd)/git/gitattributes ~/.gitattributes
ln -fsv $(pwd)/git/gitconfig ~/.gitconfig
ln -fsv $(pwd)/git/gitignore ~/.gitignore
ln -fsv $(pwd)/screen/screenrc ~/.screenrc
ln -fsv $(pwd)/ssh/config ~/.ssh/config
ln -fsv $(pwd)/bash/inputrc ~/.inputrc

echo
echo "[INFO] Installing Other Packages"

echo
echo "[INFO] Installing oh-my-zsh"

ln -Fsv $(pwd)/oh-my-zsh/ ~/.oh-my-zsh
ln -Fsv $(pwd)/zsh/zshrc ~/.zshrc
chsh -s /bin/zsh

echo
echo "[INFO] Installing vim and extras"

ln -Fsv $(pwd)/vim/ ~/.vim
ln -fsv ~/.vim/vimrc ~/.vimrc
vim +PluginInstall +qall
