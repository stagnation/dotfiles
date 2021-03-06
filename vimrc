" vim: foldmethod=marker foldcolumn=3
" Initialization, plugin manager {{{

" Fix for my shell, otherwise some scripts break
if $SHELL =~ 'bin/fish'
    set shell=/bin/sh
endif

let plug_location = '~/.vim/plugged'
if has ('nvim')
    let plug_location = '~/.local/share/nvim/plugged'
endif
" :s#.*github.com/#Plug '#<cr>:s#$#'#<cr>:nohlsearch<cr>
call plug#begin(plug_location)

                                   " Plug 'Konfekt/FastFold'
                                   " Plug 'nathanaelkane/vim-indent-guides'
                                   " Plug 'pelodelfuego/vim-swoop'
                                   " Plug 'w0rp/ale'                              " asynchronous lint engine
                                   " Plug 'wellle/visual-split.vim'
                                   " Plug 'wincent/scalpel'


                                   " Filetype definitions
Plug 'cespare/vim-toml'
Plug 'dag/vim-fish'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'rust-lang/rust.vim'

if has("gui_running")
    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/limelight.vim'
endif

Plug 'airblade/vim-gitgutter'
" Plug 'chrisjohnson/vim-foldfunctions'
Plug 'eparreno/vim-matchit'
Plug 'guyzmo/EnhancedJumps'        " improves <c-i> <c-o> and company, by ingo karkat.
Plug 'haya14busa/vim-operator-flashy'
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-peekaboo'
Plug 'kana/vim-operator-user'
Plug 'kshenoy/vim-signature'
Plug 'lfv89/vim-interestingwords'
Plug 'ludovicchabant/vim-gutentags'
Plug 'mbbill/undotree'
Plug 'michaeljsmith/vim-indent-object'
Plug 'milkypostman/vim-togglelist'
Plug 'ntpeters/vim-better-whitespace'
Plug 'romainl/vim-qf'
Plug 'sirver/UltiSnips'
Plug 'spiiph/vim-space', { 'on': [] }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-surround'
Plug 'unblevable/quick-scope'
Plug 'vim-scripts/camelcasemotion' " make w,b,e respect word boundaries inside camelCase and snake_case
Plug 'vim-scripts/CSApprox'
Plug 'vim-scripts/ingo-library'
Plug 'wellle/targets.vim'

Plug '~/repos/nilsvim_qmark'

if has ('nvim')
    Plug 'kassio/neoterm'
    " Plug 'benekastah/neomake'
    Plug 'brettanomyces/nvim-editcommand'
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'}
    Plug 'sebastianmarkow/deoplete-rust'
    Plug '~/repos/nilsvim_fzf'
endif

if !(has('nvim') || has('gui_running'))
    Plug '~/.vim/plugged/YouCompleteMe' " use local path to manage updates manually
endif

runtime! plugin/unimpaired.vim

" {{{ Initialize plugins and overwrite settings
" load vim-space a head of time so that mappings can be overwritten
call plug#load('vim-space')
nnoremap : ;
nnoremap ; :

xnoremap : ;
xnoremap ; :

vnoremap : ;
vnoremap ; :

" Add all autocommands to a group and clear them when sourcing
" https://gist.github.com/romainl/6e4c15dfc4885cb4bd64688a71aa7063
augroup vimrcAu
    autocmd!
augroup END

" }}}
call plug#end()
" }}}
" {{{ Settings
syntax enable                  " enables syntax highlighting
filetype plugin indent on      " react on filetyps with plugins and syntax

set fileformat=unix            " proper unix linebreaks
set scrolloff=4                " minimum number of lines to display around cursor
set sidescrolloff=4            " minimum number of columnes to display around cursors
set hlsearch                   " highlight search results
set smarttab                   " <TAB> inserts 'shiftwidth' spaces
set hidden                     " allow unsaved hidden buffers - crucial for bufdo, but don't forget to save
set list                       " show funny characters, tabs and CRLF
set spellcapcheck=             " make spell check insensitive to the case of the first letter in a word
set tabstop=4                  " tab spacing
set expandtab                  " use spaces instead of tab
set shiftwidth=4               " amount of spaces for tab to insert
set autoindent                 " automatically set the indent when creatig lines
set ruler                      " show cursor position information in statusline
set number                     " show line numbers
set nowrap                     " do not wrap text
set linebreak                  " preserves word when wrapping
set ttyfast                    " 'smooth' scrolling
set lazyredraw                 " do not update screen during macro playback
set synmaxcol=512              " do not use syntax highlighting for long lines
set mouse=a                    " enable mouse in terminals that support it
set showmatch                  " breifly show matching bracekt when inserting such
set incsearch                  " incremental searching as soon as typing begins
set ignorecase                 " ignore case when searching
set smartcase                  " will override ignore case if searching w/ diff cases
set modeline | set modelines=1 " use modeline
set ttimeoutlen=5              " faster twitching for everything
set virtualedit=block          " allow cursor to be moved into empty space in visual
set laststatus=2               " always show status line
set backspace=indent,eol,start " backspace everywhere
set cursorline                 " highlights the line cursor is at
set cursorcolumn               " highlights the column cursor is at
set showcmd
set wildmenu                   " menu line with autocomplete options
set textwidth=80
set splitbelow                 " intuitive split placement
set splitright                 " intuitive split placement
set nojoinspaces               " do not add a double space after .!? with gq and auto-formatting

" set formatoptions-=t           " disable automatic linebreak at textwidth for non-comments
" set formatoptions-=c           " disable automatic linebreak at textwidth for comments
set formatoptions=
set formatoptions+=c           " auto-wrap coments using textwidth, inserting comment leader
set formatoptions+=j           " remove comment leader when joining lines
set formatoptions+=l           " long lines, longer than textwidth when insert mode is started, do no break automatically
set formatoptions+=o           " insert comment leader with oO if run from a commented line
set formatoptions+=q           " allow formatting of options with gq
set formatoptions+=r           " insert comment leader with <cr>

set shortmess=
" set shortmess+=O
" set shortmess+=o             " NB(nils): slated for removal
set shortmess+=F               " don't write what file/buffer I switch to typically "vimrc XYZ lines, ..."
set shortmess+=T
set shortmess+=c               " no status message for insert mode completions
set shortmess+=f               " "(3 of 5)" instead of "(file 3 of 5)"
set shortmess+=i               " "[noeol]" instead of "[Incomplete last line]"
set shortmess+=l               " "999L, 888C" instead of "999 lines, 888 characters"
set shortmess+=m               " [+] instead of [MODIFIED]
set shortmess+=n               " "[New]" instead of "[New File]"
set shortmess+=t               " t and T truncate messages if they are too long to fit the command line
set shortmess+=x               " write only short format messages for fileformat: unix, mac, dos

set backupdir=~/.vim/backup    " centralized backup
set noswapfile                 " no swap files

if has('vim_starting')         "     vim_starting to not overwrite filetype specific settings
    set foldmethod=syntax
    set foldlevel=20               " by defualt open folds to level 20
endif

if has('nvim')
    set inccommand=nosplit       " highlight all matches for :<range>s/pat/ interactively
endif
if !has('nvim')
    set encoding=utf-8         " utf-8 encoding
endif

" do not back up root's files
if exists('$SUDO_USER')
    set nobackup
    set nowritebackup
    set noswapfile
    set noundofile
endif

let g:mapleader ='\'
" }}}
" Deoplete Options {{{
if has ('nvim')
    let g:deoplete#enable_at_startup = 1
    let g:deoplete#sources#rust#racer_binary='/home/nils/.cargo/bin/racer'
    let g:deoplete#sources#rust#rust_source_path='/home/nils/rust/rust_source/rust/src'
endif
" }}}
" {{{ Utility rebinds
" {{{{ Split navigation

nnoremap <silent> <c-h> <c-w>h
nnoremap <silent> <c-j> <c-w>j
nnoremap <silent> <c-k> <c-w>k
nnoremap <silent> <c-l> <c-w>l

if has ('nvim')
    tnoremap <silent> <c-h> <C-\><C-n><c-w>h
    " tnoremap <silent> <c-j> <C-\><C-n>:TmuxNavigateDown<cr>
    " tnoremap <silent> <c-k> <C-\><C-n>:TmuxNavigateUp<cr>
    tnoremap <silent> <c-l> <C-\><C-n><c-w>j

endif
" }}}}
" convenient start/end of line
nnoremap 0 ^
" retain selection after visual indentation operations
vnoremap > >gv
vnoremap < <gv

" remap Join lines to spilt lines
nnoremap J i<CR><ESC>
noremap <leader>ss :source ~/.vimrc<CR> :echo "sourced vimrc"<CR>

" Copy/Paste with os buffer
noremap <leader>y "+y
noremap <leader>Y "+y$
noremap <leader>p "+p
noremap <leader>P "+P
noremap <leader>d "+d
noremap <leader>D "+D

" Y consistent with D
nnoremap Y y$

" operator flashy - flashes the target of a y<target> command
map y <Plug>(operator-flashy)
nmap Y <Plug>(operator-flashy)$

" center window after jumping forward
nnoremap n nzz
nnoremap } }zz
nnoremap { {zz

" swap ^$ with HL (move to fourth row from top/bottom)
noremap H ^
noremap ^ H
noremap L $
noremap $ L

" readline-like keys for the command line
cnoremap <C-a>	<Home>

" typo resilience for commands
command! Q q
command! Qall qall
command! W w
command! Wall wall
command! Wq wq
command! WQ wq

" move by row rather than line
nnoremap j gj
nnoremap k gk
" reverse swap
nnoremap gj j
nnoremap gk k

" store relative line number jumps in the jump limit if the jump exceeds a threshold
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : '') . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : '') . 'j'

" Insert and Append on wrapped lines
nnoremap gI g0i
nnoremap gA g$i

" Disable Ex mode
map Q <Nop>
" disable annyoing window
nnoremap q: <Nop>

nnoremap <BS> <Nop>

" easier macro repeat in normal buffers
nnoremap <expr> <CR> empty(&buftype) ? '@@' : '<CR>'

" close all other windows, like <c-w>z but bigger
nnoremap <c-w>Z :only<cr>

" open and close folds
" NB(nils): zo and zO are largely synonymous in my use, I prefer to have only
"           one fold level generally, two in this file but that's not very
"           important. Since I often press zO by mistake before remebering zR
"           and the other way around.
"
"           As such, zo for 'open a little' and zO for 'open a lot' still retain
"           the original spirit of the maps, but are more suitable to my use.
nnoremap zO zR
nnoremap zC zM

" }}}
" {{{ Custom Operators
function! SortOperator(...)
    let [first, last] = [line("'["), line("']")]
    exe first . "," .last . ":sort"
endfunction

function! VisualSortOperator(...)
    " the operator is invoked from visual mode, restore the range from the
    " previous visual selection, '< to '>. Store these and return to normal
    silent exe "normal! gv"
    let [first, last] = [line("'<"), line("'>")]
    silent exe "normal! "
    exe first . "," .last . ":sort"
endfunction

vnoremap <silent> gs :<c-u>call VisualSortOperator()<CR>
nnoremap <silent> gs :set operatorfunc=SortOperator<CR>g@
" }}}
" {{{ Colors, Look and feel
" {{{ General
if (has ('folding') && has ('windows'))
    set fillchars+=vert:┃ " Box drawings heavy vertical (U+2503)
endif

" Disable "Pattern not found" messages
if (has('nvim')) | set shortmess+=c | endif

" Use the color column to mark textwidth and the active split
" color column is relative to textwidth
autocmd vimrcAu BufEnter,FocusGained,VimEnter,WinEnter * let &colorcolumn='+0,+' . join(range(40, 254), ',+')
autocmd vimrcAu WinLeave,FocusLost * let &colorcolumn = join(range(0,255), ',')

" TODO(nils): fix visual bg for proton

" Overwrite some color scheme settings so the color scheme can be pulled from
" upstream. Use :source $VIMRUNTIME/**/hitest.vim to show all loaded highlight
" groups and their color.
function! OverrideLiqouriceColors() abort
    highlight LineNr term=underline cterm=NONE ctermbg=232 ctermfg=243
    highlight SignColumn term=NONE cterm=NONE ctermbg=232 ctermfg=255
    highlight ColorColumn ctermbg=232

    highlight YcmErrorSign ctermbg=232

    highlight GitGutterAdd          ctermbg=232 ctermfg=22
    highlight GitGutterChange       ctermbg=232 ctermfg=yellow
    highlight GitGutterDelete       ctermbg=232 ctermfg=red
    highlight GitGutterChangeDelete ctermbg=232 ctermfg=yellow

    highlight NonText     term=bold       cterm=bold  ctermbg=232  ctermfg=125  gui=bold       guibg=bg  guifg=#808080
    highlight CursorLine  term=underline  cterm=NONE  ctermbg=234  gui=NONE     guibg=#0f0f0f

    highlight IndentGuidesOdd  ctermbg=235
    highlight IndentGuidesEven ctermbg=234


    " User colors for status line
    highlight User1  ctermfg=33   guifg=#268bd2  ctermbg=53   guibg=#fdf6e3  gui=bold
    highlight User2  ctermfg=142  guifg=#d33682  ctermbg=53   guibg=#eee8d5  gui=bold
    highlight User3  ctermfg=253  guifg=#719e07  ctermbg=53   guibg=#eee8d5  gui=bold
    highlight User4  ctermfg=33   guifg=#2aa198  ctermbg=53   guibg=#eee8d5  gui=bold
    highlight User5  ctermfg=247  ctermbg=53
    highlight User6  ctermfg=245  ctermbg=235
endfunction

function! OverrideProtonColors () abort
    highlight link User1 TabNumber
    highlight link User2 SpecialKey
    highlight link User3 TabNumber
    highlight link User4 TabNumber
    highlight link User5 NonText

    highlight ColorColumn ctermbg=230
endfunction

augroup MyColors
    autocmd!
    autocmd ColorScheme liquorice-approx call OverrideLiqouriceColors()
    autocmd ColorScheme proton-approx call OverrideProtonColors()
augroup END

if has('vim_starting')
    " do not change colorscheme if vim is already running
    color liquorice-approx
    " if has('gui_running')
    "     colorscheme liquorice
    " endif
endif

" showmark settings
" let g:showmarks_include="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyx"

nnoremap <silent><C-n> :call ToggleRelativeNumber()<cr>

" cursorcolumn only in active window
autocmd vimrcAu WinEnter * setlocal cursorcolumn
autocmd vimrcAu WinLeave * setlocal nocursorcolumn

" relative number only in active window
autocmd vimrcAu WinEnter * setlocal relativenumber
autocmd vimrcAu WinLeave * setlocal norelativenumber

" Automatically resize vertical splits.
autocmd vimrcAu WinEnter * :set winfixheight
autocmd vimrcAu WinEnter * :wincmd =

autocmd vimrcAu VimResized * execute "normal! \<c-w>="

" }}}
" {{{ Graphics of cursor
set gcr=a:block

" mode aware cursors
set gcr+=o:hor50-Cursor
set gcr+=n:Cursor
set gcr+=i-ci-sm:InsertCursor
set gcr+=r-cr:ReplaceCursor-hor20
set gcr+=c:CommandCursor
set gcr+=v-ve:VisualCursor

set gcr+=a:blinkon0

highlight InsertCursor  ctermfg=16 guifg=#fdf6e3 ctermbg=37  guibg=#2aa198
highlight VisualCursor  ctermfg=15 guifg=#fdf6e3 ctermbg=125 guibg=#d33682
highlight ReplaceCursor ctermfg=15 guifg=#fdf6e3 ctermbg=65  guibg=#dc322f
highlight CommandCursor ctermfg=15 guifg=#fdf6e3 ctermbg=166 guibg=#cb4b16
" }}}
" Status line, statusline {{{
function! Status(winnr)
    let stat = ''
    let active = winnr() == a:winnr
    let buffer = winbufnr(a:winnr)

    let modified = getbufvar(buffer, '&modified')
    let readonly = getbufvar(buffer, '&ro')
    let fname = bufname(buffer)
    let separator = '%3* '

    function! Color(active, num, content)
        if a:active
            return '%' . a:num . '*' . a:content . '%*'
        else
            return '%6*' . a:content . '%*'
        endif
    endfunction

    " special color in maximum columnwidth column
    " use color 2 for columns outside textwidth
    let max_columnwidth = 81                                                   " TODO(nils): use ColorColumn[0]
    let longline = (col(".") / max_columnwidth >= 1)

    let stat .= Color(active, 1, longline ? '%2*%3v' : '%2v' )                 " column number

    let stat .= Color(active, 3, active ? ' | ' : ' « ')                       " left active buffer marker
    let stat .= '%<'

    if fname == '__Gundo__'
        let stat .= 'Gundo'
    elseif fname == '__Gundo_Preview__'
        let stat .= 'Gundo Preview'
    elseif fname == '.git/index'
        let stat .= 'git'
    elseif fname =~? 'term://.*fzf'                                            " replace the terminal's special filename based on the running process :help terminal
        let stat .= 'fzf'
    elseif fname =~? '/tmp/.*fish'
        let stat .= 'Commandline'

    else
        let path = fnamemodify(fname, ":h")
        let stat .= Color(active, 5, path != "." ? path . '/' : '')            " base path
        let stat .= Color(active, 4, '%t')                                     " filename
    endif

    let stat .= Color(active, 3, active ? ' | ' : ' » ')                       " right active buffer marker

    " file modified
    let stat .= Color(active, 4, modified ? '+ ' : '')

    " read only
    let stat .= Color(active, 4, readonly ? 'readonly' : '')

    " right side
    let stat .= '%6*%='

    " extra notification markers
    if exists("g:quickfix_pending")
        let stat .= '[Q] '
    endif

    return stat
endfunction

function! SetStatus()
    for nr in range(1, winnr('$'))
        call setwinvar(nr, '&statusline', '%!Status('.nr.')')
    endfor
endfunction

augroup status
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter,BufUnload * call SetStatus()
augroup END

" }}}
" {{{ Gvim prose writing
if has("gui_running")
    function!
    function! SpillProse()
        " disable auto commands that update the custom status function
        " setlocal eventignore=VimEnter,WinEnter,BufWinEnter,BufUnload
        " set statusline='%f'
        Goyo 100%-5x90%
        Limelight
    endfunction

endif
" }}}
" }}}
" {{{ EasyAlign
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Do not add spaces around separator
let g:easy_align_left_margin = 0
let g:easy_align_right_margin = 0
" }}}
" {{{ Insert Mode maps
" Move up and down in autocomplete with <c-j> and <c-k>
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" open tag preview from insert mode
" inoremap ^} <Esc>b5<C-}>ea
" inoremap <c-]> <esc>mzb<c-w>}`za

" }}}
" {{{ file and shell stuff
" warning when file is chenged
autocmd vimrcAu FileChangedShell * echo " Warning: File changed on disk"
autocmd vimrcAu Cursorhold * checktime " also check for file changes, more sublte

" return to cursor location when reopenning file
if has('autocmd')
    autocmd vimrcAu BufReadPost * if line("'\"") > 0 && line ("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" }}}
" Spell checking mappings {{{
" Pressing <leader>ff will toggle and untoggle spell checking,
" fe sets checking to english and fs sets checking to swedish.
nnoremap <silent> <leader>ff :setlocal spell!<cr>
nnoremap <silent> <leader>fs :setlocal spelllang=sv<cr>
nnoremap <silent> <leader>fe :setlocal spelllang=en_us<cr>
" automatically correct word to first suggestion even if spell is off
nnoremap <silent> <leader>f= :setlocal spell<cr>1z=:setlocal spell!<cr>

" }}}
" {{{ Jump binds
" go to next item in location list, loop around if end is reached
nnoremap <silent> ]l :try<bar>lnext<bar>catch /^Vim\%((\a\+)\)\=:E\%(553\<bar>42\):/<bar>lfirst<bar>endtry<cr>

" git gutter go to next and previous git chunk
nmap ]g <Plug>GitGutterNextHunk
nmap [g <Plug>GitGutterPrevHunk

" git conflic marker search
nnoremap <leader>gC /^.*\(<<<\\|====\\|>>>>\).*$<cr>

" quicklist shortcut
nnoremap ]q :cn<CR>
nnoremap [q :cp<CR>

" }}}
" {{{ Fugitive GitGutter and Git
" populate quicklist with commited version of current file - fugitive
nnoremap <leader>gl :silent Glog<CR>
nnoremap <leader>gc :Gcommit<CR>

nmap <leader>gr <Plug>GitGutterUndoHunk
nmap <leader>ga <Plug>GitGutterStageHunk
nmap <leader>gp <Plug>GitGutterPreviewHunk

autocmd vimrcAu FileType gitcommit setlocal textwidth=72 | setlocal spell

" }}}
" {{{ Search mappings

" turn off search highlighting for current search
nnoremap <silent> <leader>nh :nohlsearch<CR>

" turn off search highlighting for in insert mode
autocmd vimrcAu InsertEnter * :setlocal nohlsearch
autocmd vimrcAu InsertLeave * :setlocal hlsearch

" Pull word under cursor into LHS of a substitute
" Courtesy of Ohm
" Similar to the scalpel plugin
nnoremap <leader>z :%s#\<<c-r>=expand("<cword>")<cr>\>##gc<left><left><left>
nnoremap <leader>Z :bufdo %s#\<<c-r>=expand("<cword>")<cr>\>##gce<space><bar><space>update<left><left><left><left><left><left><left><left><left><left><left><left><left>

" Use very magic search to give most character their special use
nnoremap / /\v
vnoremap / /\v

" vim-swoop selection
if has('Swoop')
    nnoremap <Leader>/ :call Swoop()<CR>
    vnoremap <Leader>/ :call SwoopSelection()<CR>
    nnoremap <Leader>7 :call Swoop()<CR>
    vnoremap <Leader>7 :call SwoopSelection()<CR>
endif
" }}}
" {{{ word motions inside camel/snake case
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e
" }}}
" {{{ Whistespace handling

" betterfixwhitespace
let g:strip_whitespace_on_save=1
highlight ExtraWhitespace ctermbg=52

" augroup MyBetterWhitespace
"   au!
"   au FileType * if &buftype == 'nofile' | exec 'DisableWhitespace' | else | exec 'EnableWhitespace' | endif
"   au FileType diff,gitcommit DisableWhitespace
" augroup END

" }}}
" {{{ Undo history
if has('nvim')
    set undofile
else
    " Use persistent history.
    " if !isdirectory("~/.vim-undo-dir")
    "     call mkdir("~/.vim-undo-dir", "p", 0700)
    " endif
    " set undodir=~/.vim-undo-dir
    " set undofile
endif

nnoremap <leader>u :UndotreeToggle<cr>
" }}}
" {{{ Tag plugins
set tags=tags,TAGS;/
let g:gutentags_ctags_executable_haskell = 'haskell-ctags'
let g:gutentags_define_advanced_commands = '1'
let g:gutentags_ctags_executable_rust = "rust-gutentags-wrapper.sh"
let g:gutentags_ctags_exclude = ["*.html"]

" add rust project info to gutentags, ruby and python readds the default value
let g:gutentags_project_info = []
call add(g:gutentags_project_info, {'type': 'python', 'file': 'setup.py'}) " default
call add(g:gutentags_project_info, {'type': 'ruby', 'file': 'Gemfile'}) " default
call add(g:gutentags_project_info, {'type': 'rust', 'file': 'Cargo.toml'})
" }}}
" {{{ YouCompleteMe
" YCM do not ask for confirmation on loading ycm_extra_conf.py
let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf ='~/dotfiles/ycm_extra_conf.py.DOT'

let g:ycm_goto_buffer_command = 'horizontal-split'
" always fill location list with ycm errors/warnings
let g:ycm_always_populate_location_list = 1
" }}}
" {{{ IndentGuide
" indentGuide settings
let g:indent_guides_auto_colors = 0

let g:indent_guides_enable_on_vim_startup = 1
" }}}
" {{{ Location and Quickfix
" toggle location and quickfix lists
" mnemonic: list/ ( quick | location )
nnoremap <leader>ll :call ToggleLocationList()<CR>
nnoremap <leader>lq :call ToggleQuickfixList()<CR>
" }}}
" {{{ small function mappings
" open small split with top of document, to see /edit includes
nnoremap <silent> <leader>nt :<c-u>split<cr><c-w>k:resize 10<cr>gg

" copy to clipboard and send clipboard to aelv
vnoremap <leader>ul "+y :!rmtpasta<cr>

" select last pasted or changed text
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" shebang generator
nnoremap <leader>sb :r ! shebang.sh <c-r>=expand("<cword>")<CR><CR>kdd

" move stuff sideways
if has ('SidewaysRight')
    nnoremap <leader>sl :SidewaysRight<CR>
    nnoremap <leader>sh :SidewaysLeft<CR>
endif

" echo which property of highlight governs word under cursor
nnoremap <leader>hi :echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')<cr>

nnoremap <leader>m :make<cr><cr>

function! ToggleRelativeNumber()
    if(&relativenumber == 1)
        set relativenumber!
        set number
    else
        set relativenumber
    endif
endfunc

function! SilentMake()
    silent make
    redraw!
endfunction
command! Silentmake call SilentMake()

function! SyntaxRule()
    echo synIDattr(synID(line("."), col("."), 1), "name")
endfunction
" }}}
" {{{ Spill functions, heuristic solutions
" toggle slimmed down display to handle files with very long lines
" NB(nils): resetting funtionality does not work
function! SpillToggleLongLineDisplay()
    if(&cursorline == 1)
        set filetype=
        set nocursorline
        set nocursorcolumn
        set nowrap
    else
        set cursorline
        set cursorcolumn
        set wrap
    endif
endfunc
nnoremap <leader>st :call SpillToggleLongLineDisplay()<cr>
" }}}
" {{{ Filetype specific settings, mappings
if has('autocmd')
    autocmd vimrcAu FileType qf setlocal nolist
    autocmd vimrcAu FileType qf setlocal nocursorline

    autocmd vimrcAu FileType make setlocal noexpandtab

    autocmd vimrcAu FileType python nnoremap <leader>my :!python3 %<cr>

    autocmd vimrcAu FileType vimperator setlocal commentstring=\"\ %s

    autocmd vimrcAu FileType vim setlocal foldmethod=marker
    autocmd vimrcAu FileType vim setlocal nospell

    autocmd vimrcAu FileType c setlocal commentstring=\/\/\ %s
    autocmd vimrcAu FileType cpp setlocal commentstring=\/\/\ %s
    autocmd vimrcAu FileType cpp setlocal foldmethod=syntax

    autocmd vimrcAu FileType cpp vmap <leader>ac <CR><c-g><c-x>\/\/<CR>

    autocmd vimrcAu FileType tex setlocal wrap
    autocmd vimrcAu Filetype tex nnoremap <buffer> <leader>k :w<cr>:!rubber --pdf -f %<cr><cr>
    autocmd vimrcAu FileType tex nnoremap gJ gJi <esc>

    autocmd vimrcAu FileType tex setlocal makeprg=rubber\ --pdf\ -f\ %\ >/dev/null

    " rust.vim sets textwidth to 99
    autocmd vimrcAu FileType rust setlocal textwidth=80

    autocmd vimrcAu FileType gitcommit setlocal nolist
endif

" }}}
" {{{ Neoterm, quasi-repl
if has('nvim')
    nnoremap <silent> <leader>vs :TREPLSend<cr>
    vnoremap <silent> <leader>vs :TREPLSend<cr>
    let g:neoterm_size=45
endif
" }}}}
" {{{ neovim terminal settings
if has ('nvim')
    highlight TermCursor ctermfg=red guifg=red

    " Terminal escape
    tnoremap <Leader><ESC> <C-\><C-n>

    autocmd vimrcAu BufEnter * if &buftype == 'terminal' | :startinsert | endif

    tmap <c-x> <Plug>EditCommand

endif
" {{{ neovim homegrown repl
" http://vi.stackexchange.com/questions/2764/send-text-from-one-split-window-to-another/3390#3390
if has('nvim')
    augroup Terminal
        au!
        au TermOpen * let g:last_terminal_job_id = b:terminal_job_id
    augroup END

    function! REPLSend(lines)
        call jobsend(g:last_terminal_job_id, add(a:lines, ''))
    endfunction

    command! REPLSendLine call REPLSend([getline('.')])

    command! RE call REPLSend([@s])
    " nnoremap <silent> <leader>vs :REPLSendLine<cr>
    " vnoremap <silent> <leader>vs "sy:RE<cr>
endif

" }}}
" }}}
" {{{ neovim neomake
if has('nvim') && has ('neomake')
    autocmd! vimrcAu BufWritePost * Neomake
endif
" }}}
" {{{ TODO, NB and FIXME comments
if has('autocmd')
    " remove default comment and add the desired strings
    " to get higher priority
    " then read default
    autocmd vimrcAu filetype cpp setlocal comments-=://
    autocmd vimrcAu filetype cpp setlocal comments+=://\ TODO(nils):
    autocmd vimrcAu filetype cpp setlocal comments+=://\ FIXME(nils):
    autocmd vimrcAu filetype cpp setlocal comments+=://\ NB(nils):
    autocmd vimrcAu filetype cpp setlocal comments+=://

    autocmd vimrcAu filetype cpp syntax keyword cTodo contained NB

    autocmd vimrcAu FileType c setlocal comments-=://
    autocmd vimrcAu FileType c setlocal comments+=://\ TODO(nils):
    autocmd vimrcAu FileType c setlocal comments+=://\ FIXME(nils):
    autocmd vimrcAu FileType c setlocal comments+=://\ NB(nils):
    autocmd vimrcAu FileType c setlocal comments+=://

    autocmd vimrcAu Filetype c syntax keyword cTodo contained NB

    autocmd vimrcAu FileType rust setlocal comments-=://
    autocmd vimrcAu FileType rust setlocal comments+=://\ TODO(nils):
    autocmd vimrcAu FileType rust setlocal comments+=://\ FIXME(nils):
    autocmd vimrcAu FileType rust setlocal comments+=://\ NB(nils):
    autocmd vimrcAu FileType rust setlocal comments+=://

    autocmd vimrcAu Filetype rust syntax keyword cTodo contained NB

    " TODO(nils): what do fb and b mean? any number of spaces before/after?
    autocmd vimrcAu FileType python setlocal formatoptions=croql
    autocmd vimrcAu FileType python setlocal comments-=:#
    autocmd vimrcAu FileType python setlocal comments-=b:#
    autocmd vimrcAu FileType python setlocal comments+=:#\ TODO(nils):
    autocmd vimrcAu FileType python setlocal comments+=:#\ FIXME(nils):
    autocmd vimrcAu FileType python setlocal comments+=:#\ NB(nils):
    autocmd vimrcAu FileType python setlocal comments+=b:#
    autocmd vimrcAu FileType python setlocal comments+=:#

    autocmd vimrcAu Filetype python syntax keyword pythonTodo contained NB

    autocmd vimrcAu FileType vim setlocal comments-=:\"
    autocmd vimrcAu FileType vim setlocal comments+=:\"\ TODO(nils):
    autocmd vimrcAu FileType vim setlocal comments+=:\"\ FIXME(nils):
    autocmd vimrcAu FileType vim setlocal comments+=:\"\ NB(nils):
    autocmd vimrcAu Filetype vim setlocal comments+=:\"

    autocmd vimrcAu FileType vim syntax keyword vimTodo contained NB
    highlight link vimTodo Todo
endif
" }}}
" {{{ Commentary
" disable commentary deprecated binds
nnoremap <leader><leader> NOP
nnoremap <leader><leader><leader> NOP
nnoremap <leader><leader>u NOP
" }}}
" something sets the / register to ' ' in my rc
let @/=''

let g:peekaboo_delay = 500

source ~/dotfiles/rust_fold.vim

" TODO(nils): flip quickscope colors so first match is more pronounced
" TODO(nils): ]P eller något för paste nästa rad från "*
" TODO(nils): cyclic f, F, if wrong was used, cycle from begining of line
" TODO(nils): silent ]l in location list, no message that requires enter
" TODO(nils): cyclic ]l, if any exist don't show "no more" warning
" NB(nils): modeline is the name for # v i m: setting=value -- no 'set' required
" NB(nils): gi inserts text from last insertion position.
" NB(nils): :b# öppna senaste buffern - <c-6>, <c-^>
" NB(nils): g, g; jumps between previous insertion positions
" NB(nils): :let ... <c-a> shows all settings, enter give all their values
" TODO(nils): make plugin that parses jumplist for next/previous new file
"             and jump to that postion in jumplist, rather that bufsurf or many
"             jumps
" TODO(nils): don't reapply folds from modeline when sourcing vimrc
" TODO(nils): make gutentags generate help tags for all ft=vim files
" TODO(nils): map to close preview window and location/quickfix lists, <c-w>Z maybe
" TODO(nils): vim-space does not allow nnoremap n nzz : to center cursor after
"             searching

" NB(nils): :g/a/,/b/ selects a region

" NB(nils): vmap: g<c-a> increment numbers to a numbering sequences,
"           1 1 1 -> 1 2 3
"
" NB(nils): nmap <c-t> jump to location of last <c-]> ignoring any other
" NB(nils): movements while handling the tag.

if filereadable(glob("~/.vimrc.local"))
    source ~/.vimrc.local
endif

let g:EnhancedJumps_CaptureJumpMessages=0

" TODO(nils): if ~/dotfiles in %. add ~/dotfiles to path.
