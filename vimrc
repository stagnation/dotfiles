execute pathogen#infect()

" Fix for my shell, otherwise some scripts break
if $SHELL =~ 'bin/fish'
    set shell=/bin/sh
    endif

"rebind common typos
command! Q q
command! Qall qall

"basic settings
syntax enable             "enables syntax hilighting
filetype plugin indent on "react on filetyps with plugins and syntax
set scrolloff=4           "minimum number of lines to display around cursor
set hlsearch              "hilight search results
set smarttab              "<TAB> inserts 'shiftwidth' spaces
set tabstop=4             "tab spacing
set expandtab             "use spaces instead of tab
set shiftwidth=4          "amount of spaces for tab to insert
set autoindent            "automatically set the indent when creatig lines
set ruler                 "show cursor position information in statusline
set number                "show line numbers
set wrap                  "wrap text
set linebreak             "preserves word when wrapping
set ttyfast               "'smooth' scrolling
set mouse=a               "enable mouse in terminals that support it
set showmatch             "breifly show matching bracekt when inserting such
set incsearch             "incremental searching as soon as typing begins
set ignorecase            "ignore case when searching
set smartcase             "will override ignore case if searching w/ diff cases
set modeline              "use modelines ??????
set ttimeoutlen=50        "faster twitching for everything
set virtualedit=block     "allow cursor to be moved into empty space in visual
set laststatus=2          "always show status line
set encoding=utf-8        "utf-8 encoding
set backupdir=~/.vim/backup "centralized backup
set backspace=indent,eol,start "backspace everywhere
set noswapfile            "no swap files
set foldmethod=indent     "creates fold based on indentation levels
set foldlevel=20          "by defualt open folds to level 20
set cursorline            "hilights the line cursor is at
set cursorcolumn


" let g:mapleader =" "
" Move up and down in autocomplete with <c-j> and <c-k>
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" retain selection after visual indentation operations
vnoremap > >gv
vnoremap < <gv

" remap Join lines to spilt lines
nnoremap J i<CR><ESC>

color lakris256
if has("gui_running")
    color lakris
endif
hi CursorLine term=underline cterm=NONE ctermbg=234 gui=NONE guibg=#0f0f0f "guifg=fg ctermfg=fg
hi CursorColumn term=underline cterm=NONE ctermbg=234 gui=NONE guibg=#0f0f0f "guifg=fg ctermfg=fg

call lengthmatters#highlight('ctermbg=235')

let g:syntastic_disabled_filetypes=['tex']

" Copy/Paste with os buffer
noremap <leader>y "+y
noremap <leader>Y "+y$
nmap <leader>p "+p
nmap <leader>P "+P

"Y consistent with D
nnoremap Y y$

"intuitive split placement
set splitbelow
set splitright
" Disable Ex mode
map Q <Nop>

" Spell checking mappings {{{ "
" Pressing <leader>ff will toggle and untoggle spell checking,
" fe sets checking to english and fs sets checking to swedish.
nnoremap <silent> <leader>ff :setlocal spell!<cr>
nnoremap <silent> <leader>fs :setlocal spelllang=sv<cr>
nnoremap <silent> <leader>fe :setlocal spelllang=en<cr>

"SPELLING
"suggestions
nnoremap <leader>fa z=
"go to next error
nnoremap <leader>fn ]s
"go to previous error
nnoremap <leader>fp [s

"location list
"go to next or previous instance (usually error)
nnoremap <leader>en :lne<CR>
nnoremap <leader>ep :lp<CR>

"git gutter go to next, prev git chunk
nnoremap <leader>gn :GitGutterNextHunk<CR>
nnoremap <leader>gp :GitGutterPrevHunk<CR>

"center window after jumping forward
nnoremap n nzz
nnoremap } }zz

"turn off search hilighting for current search
nnoremap <leader>l :nohlsearch<CR>
"turn off search hilighting for in insert mode
autocmd InsertEnter * :setlocal nohlsearch
autocmd InsertLeave * :setlocal hlsearch

"move by row rather than line
nnoremap j gj
nnoremap k gk
nnoremap 0 g0
"with better line break handling these sohuldn't matter anyhow...
nnoremap $ g$
"reverse swap
nnoremap gj j
nnoremap gk k
nnoremap g0 0
nnoremap g$ $

"ignore settings for ctrlP
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|aux|pdf|out)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
nnoremap <c-p> :CtrlPClearCache<CR> :CtrlP<CR>

"typo resilience for commands
command! Q q
command! Qall qall
command! W w
command! Wall wall
command! Wq wq
command! WQ wq

"convenient word recognition inside camel/snake case
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e

" select last pasted or changed text
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'


"cursorcolumn only in active window
autocmd WinEnter * setlocal cursorcolumn
autocmd WinLeave * setlocal nocursorcolumn
"
"cursor line only in active window
"autocmd WinEnter * setlocal cursorline
"autocmd WinLeave * setlocal nocursorline

"this seems like nice undo history
if has("persistent_undo")
    set undodir=~/.vim/undodir
    set undofile
endif
nnoremap <leader>u :UndotreeToggle<cr>

"return to cursor location when reopenning file
if has("autocmd")
      autocmd BufReadPost * if line("'\"") > 0 && line ("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

nmap <leader>t :TagbarToggle<CR>

"VIM_LATEX SUITE
"""""""""""""""""""""""""""""""""""""""""""""""""
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
"filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
"""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""
" this is mostly a matter of taste. but LaTeX looks good with just a bit
" of indentation.
set sw=4
" TIP: if you write your \label's as \label{fig:something}, then if you
" type in \ref{fig: and press you will automatically cycle through
" all the figure labels. Very useful!
set iskeyword+=:
"""""""""""""""""""""""""""""""""""""""""""""""""
"END VIM_LATEX


"YCM don't ask for confirmation on loading ycm_extra_conf.py
let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf ='~/dotfiles/ycm_extra_conf.py.DOT'
"YCM go to definiotn of sometihng.
noremap <leader>jd :YcmCompleter GoTo<CR>
let g:ycm_goto_buffer_command = 'horizontal-split'
"always fill location list with ycm errors/warnings
let g:ycm_always_populate_location_list = 1

" Always show line numbers, but only in current window.
set number

" Automatically resize vertical splits.
autocmd WinEnter * :set winfixheight
autocmd WinEnter * :wincmd =

"indentGuide settings
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=234
let g:indent_guides_enable_on_vim_startup = 1

"showmark settings
"let g:showmarks_include="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyx"

"mathematica conceal
let g:mma_candy = 1

"vim-swoop selection
let g:swoopUseDefaultKeyMap=0
nmap <Leader>/ :call Swoop()<CR>
vmap <Leader>/ :call SwoopSelection()<CR>
nmap <Leader>7 :call Swoop()<CR>
vmap <Leader>7 :call SwoopSelection()<CR>

"startify, session management
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

function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>



function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>


function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

"toggle relative number for lines
function! NumberToggle()
  if(&relativenumber == 1)
    set relativenumber!
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

"tmux vim conavigation
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-o> :TmuxNavigatePrevious<cr>
