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
echo "[INFO] Installing oh-my-zsh"

rm -rf ~/.oh-my-zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

ln -fsv $(pwd)/zsh/zshrc ~/.zshrc
chsh -s /bin/zsh || chsh -s /usr/bin/zsh

echo
echo "[INFO] Installing vim and extras"

rm -rf ~/.vim/backups ~/.vim/bundle ~/.vim/swaps ~/.vim/undo
rm -rf ~/.vim

ln -Fsv $(pwd)/vim/ ~/.vim
ln -fsv ~/.vim/vimrc ~/.vimrc

mkdir ~/.vim/backups
mkdir ~/.vim/swaps
mkdir ~/.vim/undo
mkdir ~/.vim/bundle

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

vim +PluginInstall +qall

cd ~/.vim/bundle/YouCompleteMe
./install.sh --clang-completer
cd ~/.vim/bundle/vimproc.vim
make

if [ "$(uname)" == "Darwin" ]; then
    echo "bash osx"
fi
