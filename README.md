# Usage

In your home folder, use `config` instead of `git` and add/commit files as usual.

```
cd ~
config status
config add .zshrc
config commit -m "updated zshrc"
config push origin master
```

# Installation on new system

```
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
echo ".cfg" >> .gitignore # to avoid recursion problems
git clone --bare https://github.com/aekh/dotfiles.git $HOME/.cfg
config checkout
# fix conflicts
config checkout
config config --local status.showUntrackedFiles no # to avoid untracked mess
```

Enjoy!

