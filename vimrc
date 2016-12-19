" vim: foldmethod=marker foldlevel=0 foldcolumn=3
" Initialization, plug manager {{{ "
" Fix for my shell, otherwise some scripts break
if $SHELL =~ 'bin/fish'
    set shell=/bin/sh
endif
" :s#.*github.com/#Plug '#<cr>:s#$#'#<cr>:nohlsearch<cr>
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-rsi', { 'on': [] }
Plug 'spiiph/vim-space'
Plug 'Valloric/YouCompleteMe'
Plug 'junegunn/vim-easy-align'
Plug 'whatyouhide/vim-lengthmatters'
Plug 'vim-scripts/Indent-Guides'
Plug 'ferranpm/vim-isolate'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/vim-peekaboo'
Plug 'ntpeters/vim-better-whitespace'
Plug 'ludovicchabant/vim-gutentags'
Plug 'eparreno/vim-matchit'
Plug 'michaeljsmith/vim-indent-object'
Plug 'scrooloose/syntastic/'
Plug 'majutsushi/tagbar'
Plug 'milkypostman/vim-togglelist'
" Plug 'bronson/vim-trailing-whitespace'
Plug 'vim-scripts/camelcasemotion'
Plug 'rust-lang/rust.vim'
Plug 'wellle/targets.vim'
Plug 'mbbill/undotree'
Plug 'airblade/vim-gitgutter'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'mhinz/vim-startify'
" Plug 'pelodelfuego/vim-swoop'
Plug 'christoomey/vim-tmux-navigator'
Plug 'kshenoy/vim-signature'
Plug 'idbrii/vim-hiinterestingword'
" Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-commentary'
Plug 'wellle/visual-split.vim'
Plug 'kana/vim-operator-user'
Plug 'ferranpm/vim-isolate'
Plug 'unblevable/quick-scope'
Plug 'haya14busa/vim-operator-flashy'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/CSApprox'
if has ('nvim')
    Plug 'kassio/neoterm'
    Plug 'critiqjo/lldb.nvim'
    Plug 'benekastah/neomake'
    Plug 'brettanomyces/nvim-editcommand'
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'}
    Plug 'sebastianmarkow/deoplete-rust'
endif


" explicitly load rsi so ä can be unmapped

call plug#load('vim-rsi')
silent! iunmap ä

call plug#end()

" }}} Initialization "
" TODO
" cyclic f, F, if wrong was used, cycle from begining of line
" silent ]l in location list, no message that requires enter
" cyclic ]l, if any exist don't show "no more" warning
" Deoplete Options {{{
if has ('nvim')
    let g:deoplete#enable_at_startup = 1
	let g:deoplete#sources#rust#racer_binary='/home/nils/.cargo/bin/racer'
  	let g:deoplete#sources#rust#rust_source_path='/home/nils/rust/rust_source/rust/src'

endif
" }}}
" {{{ Tmux navigation "
" "tmux vim conavigation
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>

if has ('nvim')
    tnoremap <silent> <c-h> <C-\><C-n>:TmuxNavigateLeft<cr>
    tnoremap <silent> <c-j> <C-\><C-n>:TmuxNavigateDown<cr>
    tnoremap <silent> <c-k> <C-\><C-n>:TmuxNavigateUp<cr>
    tnoremap <silent> <c-l> <C-\><C-n>:TmuxNavigateRight<cr>
endif

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

" operator flashy
map y <Plug>(operator-flashy)
nmap Y <Plug>(operator-flashy)$

"center window after jumping forward
nnoremap n nzz
nnoremap } }zz
nnoremap { {zz

"typo resilience for commands
command! Q q
command! Qall qall
command! W w
command! Wall wall
command! Wq wq
command! WQ wq

"move by row rather than line
nnoremap j gj
nnoremap k gk
"reverse swap
nnoremap gj j
nnoremap gk k

"Insert and Append on wrapped lines
nnoremap gI g0i
nnoremap gA g$i

"Reuse last command
nnoremap <c-p> :<c-p>
" }}} Utility rebinds "
" {{{ Settings
syntax enable                  "enables syntax highlighting
set background=dark            "required for colorschemes
set fileformat=unix            "proper unix linebreaks
filetype plugin indent on      "react on filetyps with plugins and syntax
set scrolloff=4                "minimum number of lines to display around cursor
set hlsearch                   "highlight search results
set smarttab                   "<TAB> inserts 'shiftwidth' spaces
set tabstop=4                  "tab spacing
set expandtab                  "use spaces instead of tab
set shiftwidth=4               "amount of spaces for tab to insert
set autoindent                 "automatically set the indent when creatig lines
set ruler                      "show cursor position information in statusline
set number                     "show line numbers
set nowrap                     "do not wrap text
set linebreak                  "preserves word when wrapping
set ttyfast                    "'smooth' scrolling
set mouse=a                    "enable mouse in terminals that support it
set showmatch                  "breifly show matching bracekt when inserting such
set incsearch                  "incremental searching as soon as typing begins
set ignorecase                 "ignore case when searching
set smartcase                  "will override ignore case if searching w/ diff cases
set modeline                   "use modelines
set ttimeoutlen=5              "faster twitching for everything
set virtualedit=block          "allow cursor to be moved into empty space in visual
set laststatus=2               "always show status line
if !has('nvim')
    set encoding=utf-8         "utf-8 encoding
endif
set backupdir=~/.vim/backup    "centralized backup
set backspace=indent,eol,start "backspace everywhere
set noswapfile                 "no swap files
set foldmethod=indent          "creates fold based on indentation levels
set foldlevel=20               "by defualt open folds to level 20
set cursorline                 "highlights the line cursor is at
set cursorcolumn
set showcmd
set wildmenu                    "menu line with autocomplete options

" intuitive split placement
set splitbelow
set splitright
" Disable Ex mode
map Q <Nop>
" disable annyoing window
nnoremap q: <Nop>

let g:mapleader ='\'
" }}} Settings "
" {{{ Colors, Look and feel "
color liquorice-approx
if has("gui_running")
    color liquorice
endif

set number

if ! has("gui_running")
    highlight LineNr term=underline cterm=NONE ctermbg=232 ctermfg=243 gui=italic guibg=#0e0e0e guifg=#727272
    highlight SignColumn term=NONE cterm=NONE ctermbg=232 ctermfg=255 gui=NONE guibg=#0e0e0e guifg=#f0f0f0
    " area below text in doc, including tildes
    highlight NonText term=bold cterm=bold ctermbg=bg ctermfg=125 gui=bold guibg=bg guifg=#808080
endif

"showmark settings
"let g:showmarks_include="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyx"

nnoremap <silent><C-n> :call NumberToggle()<cr>

"toggle relative number for lines
function! NumberToggle()
  if(&relativenumber == 1)
    set relativenumber!
    set number
  else
    set relativenumber
  endif
endfunc

highlight CursorLine term=underline cterm=NONE ctermbg=234 gui=NONE guibg=#0f0f0f
" highlight CursorColumn term=underline cterm=NONE ctermbg=234 gui=NONE guibg=#0f0f0f

call lengthmatters#highlight('ctermbg=235')

" {{{ Syntastic Signs "
highlight WarningMsg ctermbg=232
highlight Exception ctermbg=232
" }}} Syntastic Signs "
"
" idealy ask signature to use another highlight group for these, but doesn't
" seem to work
" let g:SignatureMarkerTextHL='GitGutterAdd'
" let g:SignatureMarkTextHL='GitGutterAdd'
" let g:SignatureMarkTextHL = "'GitGutterAdd'"

" let syntastic_error_symbol='<>' "doesn't seem to change anything
" let ycm_error_symbol='<>' "nor this

highlight YcmErrorSign ctermbg=232

"cursorcolumn only in active window
autocmd WinEnter * setlocal cursorcolumn
autocmd WinEnter * setlocal relativenumber
autocmd WinLeave * setlocal nocursorcolumn
autocmd WinLeave * setlocal norelativenumber
"
"cursor line only in active window
"autocmd WinEnter * setlocal cursorline
"autocmd WinLeave * setlocal nocursorline

" Automatically resize vertical splits.
autocmd WinEnter * :set winfixheight
autocmd WinEnter * :wincmd =


" {{{ GitGutter Sign colors '
highlight GitGutterAdd          ctermbg=232 ctermfg=22
highlight GitGutterChange       ctermbg=232 ctermfg=yellow
highlight GitGutterDelete       ctermbg=232 ctermfg=red
highlight GitGutterChangeDelete ctermbg=232 ctermfg=yellow
" }}} GitGutter Sign colors "
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

hi InsertCursor  ctermfg=15 guifg=#fdf6e3 ctermbg=37  guibg=#2aa198
hi VisualCursor  ctermfg=15 guifg=#fdf6e3 ctermbg=125 guibg=#d33682
hi ReplaceCursor ctermfg=15 guifg=#fdf6e3 ctermbg=65  guibg=#dc322f
hi CommandCursor ctermfg=15 guifg=#fdf6e3 ctermbg=166 guibg=#cb4b16


" }}} Graphics of cursor
" Status Function: {{{2
function! Status(winnr)
  let stat = ''
  let active = winnr() == a:winnr
  let buffer = winbufnr(a:winnr)

  let modified = getbufvar(buffer, '&modified')
  let readonly = getbufvar(buffer, '&ro')
  let fname = bufname(buffer)

  function! Color(active, num, content)
    if a:active
      return '%' . a:num . '*' . a:content . '%*'
    else
      return a:content
    endif
  endfunction

  " column
  let stat .= '%1*' . (col(".") / 100 >= 1 ? '%v ' : ' %2v ') . '%*'

  " file
  let stat .= Color(active, 3, active ? ' »' : ' «')
  let stat .= ' %<'

  if fname == '__Gundo__'
    let stat .= 'Gundo'
  elseif fname == '__Gundo_Preview__'
    let stat .= 'Gundo Preview'
  elseif fname == '__Tagbar__'
    let stat .= 'Tagbar'
  else
    let path = expand('%:h')
    let stat .= Color(active, 5, path != "." ? path . '/' : '')
    let stat .= Color(active, 4, '%t')
  endif

  let stat .= ' ' . Color(active, 3, active ? '«' : '»')

  " file modified
  let stat .= Color(active, 4, modified ? ' +' : '')

  " read only
  "
  let stat .= Color(active, 4, readonly ? ' readonly' : '')

  " paste
  if active && &paste
    let stat .= ' %2*' . 'P' . '%*'
  endif

  " right side
  let stat .= '%='

  " git branch
  if exists('*fugitive#head')
    let head = fugitive#head()

    if empty(head) && exists('*fugitive#detect') && !exists('b:git_dir')
      call fugitive#detect(getcwd())
      let head = fugitive#head()
    endif
  endif

  if !empty(head)
    let stat .= Color(active, 3, ' ← ') . head . ' '
  endif

  return stat
endfunction
" }}}
" Status AutoCMD: {{{
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
" Status Colors: {{{
hi User1 ctermfg=33  guifg=#268bd2  ctermbg=233 guibg=#fdf6e3 gui=bold
hi User2 ctermfg=125 guifg=#d33682  ctermbg=7  guibg=#eee8d5 gui=bold
hi User3 ctermfg=253  guifg=#719e07  ctermbg=53  guibg=#eee8d5 gui=bold
hi User4 ctermfg=33  guifg=#2aa198  ctermbg=53  guibg=#eee8d5 gui=bold
hi User5 ctermfg=247, ctermbg=53
" }}}
" }}} Colors "
" {{{ Syntastic "
let g:syntastic_disabled_filetypes=['tex']
let g:syntastic_always_populate_loc_list=1
let g:syntastic_python_python_exec = '/usr/bin/python3'
let g:syntastic_python_checkers = ['python']
" }}} Syntastic "
" {{{ EasyAlign "
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" }}} EasyAlign "
" {{{ Insert Mode maps "
inoremap JJ <Esc>o
inoremap KK <Esc>O

" Move up and down in autocomplete with <c-j> and <c-k>
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")
"
inoremap ^] ^X^]
inoremap ^F ^X^F
inoremap ^D ^X^D
inoremap ^L ^X^L

" open tag preview from insert mode
inoremap ^} <Esc>b5<C-}>ea
inoremap <c-]> <esc>mzb<c-w>}`za

" }}} Insert Mode maps "
" {{{ file and shell stuff
"warning when file is chenged
autocmd FileChangedShell * echo "Warning: File changed on disk"
autocmd Cursorhold * checktime "also check for file changes, more sublte

"return to cursor location when reopenning file
if has("autocmd")
      autocmd BufReadPost * if line("'\"") > 0 && line ("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" }}} file and shell stuff
" Spell checking mappings {{{ "
" Pressing <leader>ff will toggle and untoggle spell checking,
" fe sets checking to english and fs sets checking to swedish.
nnoremap <silent> <leader>ff :setlocal spell!<cr>
nnoremap <silent> <leader>fs :setlocal spelllang=sv<cr>
nnoremap <silent> <leader>fe :setlocal spelllang=en_us<cr>
" automatically correct word to first suggestion even if spell is off
nnoremap <silent> <leader>f= :setlocal spell<cr>1z=:setlocal spell!<cr>

"SPELLING
"suggestions
nnoremap <leader>fh z=
" }}} Spell checking mappings "
" {{{ Jump binds "
"go to next item in location list, loop around if end is reached
nnoremap <silent> ]l :try<bar>lnext<bar>catch /^Vim\%((\a\+)\)\=:E\%(553\<bar>42\):/<bar>lfirst<bar>endtry<cr>

"git gutter go to next, prev git chunk
nnoremap ]g :GitGutterNextHunk<CR>
nnoremap [g :GitGutterPrevHunk<CR>

"git conflic marker search
nnoremap <leader>gC /^.*\(<<<\\|====\\|>>>>\).*$<cr>

"quicklist shortcut
nnoremap ]q :cn<CR>
nnoremap [q :cp<CR>
" }}} Jump binds "
" {{{ Fugitive GitGutter and Git "
"populate quicklist with commited version of current file - fugitive
nnoremap <leader>gl :silent Glog<CR>
nnoremap <leader>gc :Gcommit<CR>

nnoremap <leader>gr :GitGutterRevertHunk<CR>
nnoremap <leader>ga :GitGutterStageHunk<CR>
nnoremap <leader>gp :GitGutterPreviewHunk<cr>
" }}} Fugitive "
" {{{ Search mappings "

"turn off search highlighting for current search
nnoremap <silent> <leader>l :nohlsearch<CR>
"turn off search highlighting for in insert mode
autocmd InsertEnter * :setlocal nohlsearch
autocmd InsertLeave * :setlocal hlsearch

" Pull word under cursor into LHS of a substitute
" Courtesy of Ohm
nnoremap <leader>z :%s#\<<c-r>=expand("<cword>")<cr>\>##gc<left><left><left>
nnoremap <leader>Z :bufdo %s#\<<c-r>=expand("<cword>")<cr>\>##gce<space><bar><space>update<left><left><left><left><left><left><left><left><left><left><left><left><left>

"vim-swoop selection
nnoremap <Leader>/ :call Swoop()<CR>
vnoremap <Leader>/ :call SwoopSelection()<CR>
nnoremap <Leader>7 :call Swoop()<CR>
vnoremap <Leader>7 :call SwoopSelection()<CR>
" }}} Search Mappings "
" CtrlP {{{
if exists(':CtrlPClearCache')
    "ignore settings for ctrlP
    let g:ctrlp_custom_ignore = {
                \ 'dir':  '\v[\/]\.(git|hg|svn)$',
                \ 'file': '\v\.(exe|a|o|so|dll|aux|pdf|out)$',
                \ 'link': 'some_bad_symbolic_links',
                \ }
    nnoremap <c-p> :CtrlPClearCache<CR> :CtrlP<CR>
    let g:ctrlp_user_command = [
                \ '.git', 'cd %s && git ls-files . -co --exclude-standard',
                \ 'find %s -type f'
                \ ]
endif
" }}} CtrlP "
" {{{ word motions inside camel/snake case"
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e
" }}} word motions inside camel/snake case"
" {{{ Whistespace handling "

" betterfixwhitespace
let g:strip_whitespace_on_save=1
highlight ExtraWhitespace ctermbg=52

" augroup MyBetterWhitespace
"   au!
"   au FileType * if &buftype == 'nofile' | exec 'DisableWhitespace' | else | exec 'EnableWhitespace' | endif
"   au FileType diff,gitcommit DisableWhitespace
" augroup END

" }}} Whistespace handling "
" {{{ Undo history "
"this seems like nice undo history
if has("persistent_undo")
    set undodir=~/.vim/undodir
    set undofile
endif
nnoremap <leader>u :UndotreeToggle<cr>
" }}} Undo history "
" {{{ Tag plugins "
nnoremap <leader>tt :TagbarToggle<CR>
nnoremap <leader>tp :CtrlPTag<CR>

set tags=tags,TAGS;/
let g:gutentags_ctags_executable_haskell = 'haskell-ctags'

noremap <leader>gt <c-w>} " go tag
noremap <leader>tp <c-w>} " tag preview

" }}} Tag Plugins "
" {{{ disable mouse scroll
noremap <ScrollWheelUp> <Nop>
noremap <ScrollWheelDown> <Nop>
inoremap <ScrollWheelUp> <Nop>
inoremap <ScrollWheelDown> <Nop>
" }}} disable mouse scroll
" {{{ YouCompleteMe "
"YCM don't ask for confirmation on loading ycm_extra_conf.py
let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf ='~/dotfiles/ycm_extra_conf.py.DOT'

"YCM go to definiotn of sometihng.
noremap <leader>jd :YcmCompleter GoTo<CR>

let g:ycm_goto_buffer_command = 'horizontal-split'
"always fill location list with ycm errors/warnings
let g:ycm_always_populate_location_list = 1
" }}} YouCompleteMe
" {{{ IndentGuide "
"indentGuide settings
let g:indent_guides_auto_colors = 0
" TODO: why is the aucmd?
autocmd VimEnter,Colorscheme * :highlight IndentGuidesOdd  ctermbg=235
autocmd VimEnter,Colorscheme * :highlight IndentGuidesEven ctermbg=234
let g:indent_guides_enable_on_vim_startup = 1
" IndentGuidesEnable
" }}} IndentGuide "
" {{{ startify, session management
let g:startify_session_persistence = 1 "autosave sessions
let g:startify_bookmarks = [ '~/dotfiles/vimrc' ]

let g:startify_list_order = [
        \ ['   These are my bookmarks:'],
        \ 'bookmarks',
        \ ['   These are my sessions:'],
        \ 'sessions',
        \ ['   My most recently', '   used files'],
        \ 'files',
        \ ['   My most recently used files in the current directory:'],
        \ 'dir',
        \ ]
" }}} startify
" {{{ Location Quickfix
" toggle location and quickfix lists
" mnemonic: list/ ( quick | location )
nnoremap <leader>ll :call ToggleLocationList()<CR>
nnoremap <leader>lq :call ToggleQuickfixList()<CR>
" }}} Location Quickfix
" {{{ small function mappings
" open small split with top of document, to see /edit includes
nnoremap <silent> <leader>nt :<c-u>split<cr><c-w>k:resize 10<cr>gg

vnoremap <leader>ul "+y :!rmtpasta<cr>

" select last pasted or changed text
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" shebang generator
nnoremap <leader>sb :r ! shebang.sh <c-r>=expand("<cword>")<CR><CR>kdd

" move stuff sideways
nnoremap <leader>sl :SidewaysRight<CR>
nnoremap <leader>sh :SidewaysLeft<CR>

" echo which property of highlight govenrs word under cursor
nnoremap <leader>hi :echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')<cr>

nnoremap <leader>m :make<cr><cr>

" }}} small function mappings
" {{{ Spill functions, heuristic solutions "
"toggle slimed down display to handle files with very long lines
" NB(nils): resetting funtionality does not work
function! SpillToggleLongLineDisplay()
  if(&cursorline == 1)
    set filetype=
    set nocursorline
    set nocursorcolumn
    LengthmattersDisable
    set nowrap
  else
    set cursorline
    set cursorcolumn
    LengthmattersEnable
    set wrap
  endif
endfunc
nnoremap <leader>st :call SpillToggleLongLineDisplay()<cr>
" }}} spill functions
" {{{ Unimpaired "
runtime! plugin/unimpaired.vim
" experimental insert row above/below,
" marks -> signature side effects!
noremap <leader>o <Esc>mao<Esc>`a:delmarks a<CR>:SignatureRefresh<CR>
noremap <leader>O <Esc>maO<Esc>`a:delmarks a<CR>:SignatureRefresh<CR>
" }}} Unimpaired "
" {{{ VIMUX "
if !has ('nvim')
    " VIMUX Settings for tmux integration as repl
    "size settings
    "
    noremap <Leader>vh :let g:VimuxOrientation='h'<CR> :let g:VimuxHeight=50<CR>
    noremap <Leader>vv :let g:VimuxOrientation='v'<CR> :let g:VimuxHeight=50<CR>

    " Run the current file with rspec
    map <Leader>rb :call VimuxRunCommand("clear; rspec " . bufname("%"))<CR>

    " Run command without sending a return
    map <Leader>rq :call VimuxRunCommand("clear; rspec " . bufname("%"), 0)<CR>

    " Prompt for a command to run map
    map <Leader>vp :VimuxPromptCommand<CR>

    map <Leader>vm :VimuxPromptCommand("make ")<CR>
    "
    " Run last command executed by VimuxRunCommand
    map <Leader>vl :VimuxRunLastCommand<CR>

    " Inspect runner pane map
    map <Leader>vi :VimuxInspectRunner<CR>

    " Close vim tmux runner opened by VimuxRunCommand
    map <Leader>vq :VimuxCloseRunner<CR>


    " Clear the tmux history of the runner pane
    map <Leader>vc :VimuxClearRunnerHistory<CR>

    " Zoom the tmux runner page
    map <Leader>vz :VimuxZoomRunner<CR>

    " Compile currently opened latex file to pdf
    autocmd Filetype tex nnoremap <buffer> <Leader>rr :update<Bar>:call VimuxRunCommandInDir('latexmk -pdf', 1)<CR>

    " Run the current file with rspec
    map <Leader>rb :call VimuxRunCommand("clear; rspec " . bufname("%"))<CR>

    " Prompt for a command to run
    map <Leader>vp :VimuxPromptCommand<CR>

    " Run last command executed by VimuxRunCommand
    map <Leader>vl :VimuxRunLastCommand<CR>

    " Inspect runner pane
    map <Leader>vi :VimuxInspectRunner<CR>

    " Close vim tmux runner opened by VimuxRunCommand
    map <Leader>vq :VimuxCloseRunner<CR>

    " Interrupt any command running in the runner pane
    map <Leader>vx :VimuxInterruptRunner<CR>

    " Zoom the runner pane (use <bind-key> z to restore runner pane)
    map <Leader>vz :call VimuxZoomRunner()<CR>

    function! VimuxSlime()
        call VimuxSendText(@v)
        call VimuxSendKeys("Enter")
    endfunction

    " If text is selected, save it in the v buffer and send that buffer it to tmux
    vnoremap <LocalLeader>vs "vy :call VimuxSlime()<CR>
    nnoremap <leader>vs 0"vy$ :call VimuxSlime()<CR>
    nnoremap <leader>vs V"vy :call VimuxSlime()<CR>

    " Select current paragraph and send it to tmux
    " nmap <LocalLeader>vs vip<LocalLeader>vs<CR>

    let g:VimuxHeight = "30"
    let g:VimuxOrientation = "v"
endif
" }}} VIMUX "
" {{{ exjumplist mappings "
" nmap <C-I>  <Plug>(exjumplist-go-last)
" nmap <C-O>  <Plug>(exjumplist-go-first)

nmap <leader>ji  <Plug>(exjumplist-go-last)
nmap <leader>jo  <Plug>(exjumplist-go-first)

" nmap <C-M-i>  <Plug>(exjumplist-go-last)
" nmap <C-M-o>  <Plug>(exjumplist-go-first)
" nmap <M-)>  <Plug>(exjumplist-next-buffer)
" nmap <M-(>  <Plug>(exjumplist-previous-buffer)
"
" }}} exjumplist mappings "
" {{{ Filetype specific settings, mappings "
if has("autocmd")
    autocmd FileType make setlocal noexpandtab

    autocmd FileType python nnoremap <leader>my :!python3 %<cr>

    autocmd FileType vimperator setlocal commentstring=\"\ %s
    autocmd FileType vim setlocal foldmethod=marker

    autocmd FileType c setlocal commentstring=\/\/\ %s
    autocmd FileType cpp setlocal commentstring=\/\/\ %s
    autocmd FileType cpp setlocal foldmethod=syntax

    autocmd FileType cpp vmap <leader>ac <CR><c-g><c-x>\/\/<CR>

    autocmd FileType tex setlocal wrap
    autocmd Filetype tex nnoremap <buffer> <leader>k :w<cr>:!rubber --pdf -f %<cr><cr>
    autocmd FileType tex LengthmattersDisable
    autocmd FileType tex nnoremap gJ gJi <esc>

    autocmd FileType tex setlocal makeprg=rubber\ --pdf\ -f\ %\ >/dev/null

    function! SilentMake()
        silent make
        redraw!
    endfunction
    command! Silentmake call SilentMake()
endif

" }}} Filetype specific mappings "
" {{{ Neoterm, quasi-repl
" if has('nvim')
    nnoremap <silent> <leader>vs :TREPLSend<cr>
    vnoremap <silent> <leader>vs :TREPLSend<cr>
    let g:neoterm_size=45
" endif
" }}}} Neoterm
" {{{ neovim terminal settings
if has ('nvim')
    highlight TermCursor ctermfg=red guifg=red

    " Window split settings
    highlight TermCursor ctermfg=red guifg=red
    set splitbelow
    set splitright

    " Terminal escape
    tnoremap <Leader><ESC> <C-\><C-n>

    autocmd BufEnter * if &buftype == 'terminal' | :startinsert | endif

    tmap <c-x> <Plug>EditCommand

endif " has('nvim')
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
" }}} neovim terminal settings
" {{{ neovim neomake
if has('nvim')
    autocmd! BufWritePost * Neomake
endif
" }}}
" {{{ TODO, NB and FIXME comments
if has("autocmd")
    " remove default comment and add the desired strings
    " to get higher priority
    " then read default
    autocmd filetype cpp setlocal comments-=://
    autocmd filetype cpp setlocal comments+=://\ TODO(nils):
    autocmd filetype cpp setlocal comments+=://\ FIXME(nils):
    autocmd filetype cpp setlocal comments+=://\ NB(nils):
    autocmd filetype cpp setlocal comments+=://

    autocmd filetype cpp syntax keyword cTodo contained NB

    autocmd FileType c setlocal comments-=://
    autocmd FileType c setlocal comments+=://\ TODO(nils):
    autocmd FileType c setlocal comments+=://\ FIXME(nils):
    autocmd FileType c setlocal comments+=://\ NB(nils):
    autocmd FileType c setlocal comments+=://

    autocmd Filetype c syntax keyword cTodo contained NB

    " TODO(nils): what do fb and b mean? any number of spaces before/after?
    autocmd FileType python setlocal formatoptions=croql
    autocmd FileType python setlocal comments-=:#
    autocmd FileType python setlocal comments-=b:#
    autocmd FileType python setlocal comments+=:#\ TODO(nils):
    autocmd FileType python setlocal comments+=:#\ FIXME(nils):
    autocmd FileType python setlocal comments+=:#\ NB(nils):
    autocmd FileType python setlocal comments+=b:#
    autocmd FileType python setlocal comments+=:#

    autocmd Filetype python syntax keyword pythonTodo contained NB

    autocmd FileType vim setlocal comments-=:\"
    autocmd FileType vim setlocal comments+=:\"\ TODO(nils):
    autocmd FileType vim setlocal comments+=:\"\ FIXME(nils):
    autocmd FileType vim setlocal comments+=:\"\ NB(nils):
    autocmd Filetype vim setlocal comments+=:\"

    autocmd FileType vim syntax keyword vimTodo contained NB
    hi link vimTodo Todo

endif
" }}}
nnoremap <BS> <Nop>
" something sets / to ' ' in my rc
let @/=''

let g:peekaboo_delay = 500
" disable commentary deprecated binds
nnoremap <leader><leader> NOP
nnoremap <leader><leader><leader> NOP
nnoremap <leader><leader>u NOP

function! SyntaxRule()
    echo synIDattr(synID(line("."), col("."), 1), "name")
endfunction


" TODO(nils): flip quickscope colors so first match is more pronounced
" TODO(nils): ]P eller något för paste nästa rad från "*
" NB(nils): modeline is the name for # v i m: setting=value -- no 'set' required
" NB(nils): gi inserts text from last insertion position.
" NB(nils): :b# öppna senaste buffern
