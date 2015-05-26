mkdir -p ~/.vim/autoload ~/.vim/bundle && \
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
mkdir -p ~/.vim/backup
mkdir -p ~/.vim/colors
ln -s ~/dotfiles/lakris256.vim ~/.vim/colors/

git clone https://github.com/junegunn/vim-peekaboo          ~/.vim/bundle/vim-peekaboo
git clone https://github.com/ntpeters/vim-better-whitespace ~/.vim/bundle/vim-better-whitespace
git clone https://github.com/ludovicchabant/vim-gutentags   ~/.vim/bundle/vim-gutentags
git clone https://github.com/eparreno/vim-matchit           ~/.vim/bundle/vim-matchit
git clone https://github.com/michaeljsmith/vim-indent-object ~/.vim/bundle/vim-indent-object
git clone https://github.com/scrooloose/syntastic/           ~/.vim/bundle/syntastic
git clone https://github.com/majutsushi/tagbar               ~/.vim/bundle/tagbar
git clone https://github.com/tpope/vim-fugitive              ~/.vim/bundle/vim-fugitive
git clone https://github.com/bronson/vim-trailing-whitespace ~/.vim/bundle/vim-trailing-whitespace
git clone https://github.com/whatyouhide/vim-lengthmatters   ~/.vim/bundle/vim-lengthmatters
git clone https://github.com/vim-scripts/camelcasemotion     ~/.vim/bundle/camelcasemotion
git clone https://github.com/Osse/double-tap                 ~/.vim/bundle/double-tap
git clone https://github.com/wellle/targets.vim              ~/.vim/bundle/targets.vim
git clone https://github.com/mbbill/undotree                 ~/.vim/bundle/undotree
git clone https://github.com/airblade/vim-gitgutter          ~/.vim/bundle/vim-gitgutter
git clone https://github.com/nathanaelkane/vim-indent-guides ~/.vim/bundle/vim-indent-guides
git clone https://github.com/mhinz/vim-startify              ~/.vim/bundle/vim-startify
git clone https://github.com/pelodelfuego/vim-swoop          ~/.vim/bundle/vim-swoop
git clone https://github.com/christoomey/vim-tmux-navigator  ~/.vim/bundle/vim-tmux-navigator
git clone https://github.com/kshenoy/vim-signature           ~/.vim/bundle/vim-signature
git clone https://github.com/kien/ctrlp.vim                  ~/.vim/bundle/ctrlp.vim
git clone https://github.com/godlygeek/tabular               ~/.vim/bundle/tabular
git clone https://github.com/tpope/vim-commentary            ~/.vim/bundle/vim-commentary

# macro to grab end of github link and write corresponding plugin path
# 0f/;;;lvEyA ~/.vim/bundle/pIgit clone^[0

# align on ~
# :Tabularize /\~<cr>
# fix '~' generated
# :%s/\~\ /\~/<cr>
