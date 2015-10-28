" "tmux vim conavigation
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>

" " TODO
" cyclic f, F, if wrong was used, cycle from begining of line
" silent ]l in location list, no message that requires enter
" cyclic ]l, if any exist don't show "no more" warning


"rebind common typos
command! Q q
command! Qall qall
command! E e
command! W w

"basic settings
syntax enable             "enables syntax highlighting
filetype plugin indent on "react on filetyps with plugins and syntax
set scrolloff=4           "minimum number of lines to display around cursor
set hlsearch              "highlight search results
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
set ttimeoutlen=150        "faster twitching for everything
set virtualedit=block     "allow cursor to be moved into empty space in visual
set laststatus=2          "always show status line
set encoding=utf-8        "utf-8 encoding
set backupdir=~/.vim/backup "centralized backup
set backspace=indent,eol,start "backspace everywhere
set noswapfile            "no swap files
set foldmethod=indent     "creates fold based on indentation levels
set foldlevel=20          "by defualt open folds to level 20
set cursorline            "highlights the line cursor is at
set cursorcolumn
set showcmd

let g:mapleader ='\'
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


highlight CursorLine term=underline cterm=NONE ctermbg=234 gui=NONE guibg=#0f0f0f
" highlight CursorColumn term=underline cterm=NONE ctermbg=234 gui=NONE guibg=#0f0f0f

call lengthmatters#highlight('ctermbg=235')

let g:syntastic_disabled_filetypes=['tex']
let g:syntastic_always_populate_loc_list=1
let g:syntastic_python_python_exec = '/usr/bin/python3'
let g:syntastic_python_checkers = ['python']
"
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Copy/Paste with os buffer
noremap <leader>y "+y
noremap <leader>Y "+y$
noremap <leader>p "+p
noremap <leader>P "+P

noremap <leader>ss :source ~/.vimrc.after<CR> :echo "sourced vimrc"<CR>

" Y consistent with D
nnoremap Y y$

" move stuff sideways
nnoremap <leader>sl :SidewaysRight<CR>
nnoremap <leader>sh :SidewaysLeft<CR>

" convenient start/end of line
nnoremap 0 ^

" insert mode rempas
inoremap JJ <Esc>o
inoremap KK <Esc>O

" intuitive split placement
set splitbelow
set splitright
" Disable Ex mode
map Q <Nop>
" disable annyoing window
noremap q: <Nop>

"warning when file is chenged
autocmd FileChangedShell * echo "Warning: File changed on disk"
autocmd Cursorhold * checktime "also check for file changes, more sublte

" Spell checking mappings {{{ "
" Pressing <leader>ff will toggle and untoggle spell checking,
" fe sets checking to english and fs sets checking to swedish.
nnoremap <silent> <leader>ff :setlocal spell!<cr>
nnoremap <silent> <leader>fs :setlocal spelllang=sv<cr>
nnoremap <silent> <leader>fe :setlocal spelllang=en<cr>

"SPELLING
"suggestions
nnoremap <leader>fh z=
"go to next error
nnoremap <leader>fn ]s
"go to previous error
nnoremap <leader>fp [s

"location list
"go to next or previous instance (usually error)
nnoremap <leader>en :lne<CR>
nnoremap <leader>ep :lp<CR>
nnoremap <silent> ]l :try<bar>lnext<bar>catch /^Vim\%((\a\+)\)\=:E\%(553\<bar>42\):/<bar>lfirst<bar>endtry<cr>

"git gutter go to next, prev git chunk
"populate quicklist with commited version of current file - fugitive
nnoremap <leader>gl :silent Glog<CR>
nnoremap <leader>gn :GitGutterNextHunk<CR>
nnoremap <leader>gp :GitGutterPrevHunk<CR>
nnoremap ]g :GitGutterNextHunk<CR>
nnoremap [g :GitGutterPrevHunk<CR>

"center window after jumping forward
nnoremap n nzz
nnoremap } }zz
nnoremap { {zz

"turn off search highlighting for current search
nnoremap <silent> <leader>l :nohlsearch<CR>
"turn off search highlighting for in insert mode
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
  \ 'file': '\v\.(exe|a|o|so|dll|aux|pdf|out)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
nnoremap <c-p> :CtrlPClearCache<CR> :CtrlP<CR>
let g:ctrlp_user_command = [
    \ '.git', 'cd %s && git ls-files . -co --exclude-standard',
    \ 'find %s -type f'
    \ ]

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


" betterfixwhitespace
let g:strip_whitespace_on_save=1
highlight ExtraWhitespace ctermbg=52

" augroup MyBetterWhitespace
"   au!
"   au FileType * if &buftype == 'nofile' | exec 'DisableWhitespace' | else | exec 'EnableWhitespace' | endif
"   au FileType diff,gitcommit DisableWhitespace
" augroup END

" select last pasted or changed text
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'
" Pull word under cursor into LHS of a substitute
nnoremap <leader>z :%s#\<<c-r>=expand("<cword>")<cr>\>##gc<left><left><left>
nnoremap <leader>Z :bufdo %s#\<<c-r>=expand("<cword>")<cr>\>##gce<space><bar><space>update<left><left><left><left><left><left><left><left><left><left><left><left><left>

" shebang generator
nnoremap <leader>sb :r ! shebang.sh <c-r>=expand("<cword>")<CR><CR>kdd

"cursorcolumn only in active window
autocmd WinEnter * setlocal cursorcolumn
autocmd WinEnter * setlocal relativenumber
autocmd WinLeave * setlocal nocursorcolumn
autocmd WinLeave * setlocal norelativenumber
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

nnoremap <leader>tt :TagbarToggle<CR>
nnoremap <leader>tp :CtrlPTag<CR>

"disable mouse scroll
noremap <ScrollWheelUp> <Nop>
noremap <ScrollWheelDown> <Nop>
inoremap <ScrollWheelUp> <Nop>
inoremap <ScrollWheelDown> <Nop>

set tags=tags,TAGS;/
let g:gutentags_ctags_executable_haskell = 'haskell-ctags'

noremap <leader>gt <c-w>} " go tag
noremap <leader>tp <c-w>} " tag preview

"quicklist shortcut
noremap <leader>qn :cn<CR>
noremap <leader>qp :cp<CR>

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
" TODO: why is the aucmd?
autocmd VimEnter,Colorscheme * :highlight IndentGuidesOdd  ctermbg=235
autocmd VimEnter,Colorscheme * :highlight IndentGuidesEven ctermbg=234
let g:indent_guides_enable_on_vim_startup = 1
:IndentGuidesEnable

"showmark settings
"let g:showmarks_include="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyx"

"mathematica conceal
let g:mma_candy = 1

"vim-swoop selection
nnoremap <Leader>/ :call Swoop()<CR>
vnoremap <Leader>/ :call SwoopSelection()<CR>
nnoremap <Leader>7 :call Swoop()<CR>
vnoremap <Leader>7 :call SwoopSelection()<CR>

"startify, session management
let g:startify_session_persistence = 1 "autosave sessions
let g:startify_bookmarks = [ '~/dotfiles/vimrc.after' ]

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

" toggle location and quickfix lists
" mnemonic: list/ ( quick | location )
nnoremap <leader>ll :call ToggleLocationList()<CR>
nnoremap <leader>lq :call ToggleQuickfixList()<CR>

nnoremap <silent> <leader>nt :<c-u>split<cr><c-w>k:resize 10<cr>gg

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

vnoremap <leader>ul "+y :!rmtpasta<cr>

"toggle slimed down display to handle files with very long lines
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

nnoremap <silent><C-n> :call NumberToggle()<cr>

if ! has("gui_running")
    highlight LineNr term=underline cterm=NONE ctermbg=232 ctermfg=243 gui=italic guibg=#0e0e0e guifg=#727272
    highlight SignColumn term=NONE cterm=NONE ctermbg=232 ctermfg=255 gui=NONE guibg=#0e0e0e guifg=#f0f0f0
    " area below text in doc, including tildes
    highlight NonText term=bold cterm=bold ctermbg=bg ctermfg=125 gui=bold guibg=bg guifg=#808080
endif

highlight GitGutterAdd          ctermbg=232 ctermfg=22
highlight GitGutterChange       ctermbg=232 ctermfg=yellow
highlight GitGutterDelete       ctermbg=232 ctermfg=red
highlight GitGutterChangeDelete ctermbg=232 ctermfg=yellow

highlight WarningMsg ctermbg=232
highlight Exception ctermbg=232
" idealy ask signature to use another highlight group for these, but doesn't
" seem to work
" let g:SignatureMarkerTextHL='GitGutterAdd'
" let g:SignatureMarkTextHL='GitGutterAdd'
" let g:SignatureMarkTextHL = "'GitGutterAdd'"

" let syntastic_error_symbol='<>' "doesn't seem to change anything
" let ycm_error_symbol='<>' "nor this

highlight YcmErrorSign ctermbg=232

runtime! plugin/unimpaired.vim
" experimental insert row above/below,
" marks -> signature side effects!
noremap ]f <Esc>mao<Esc>`a:delmarks a<CR>:SignatureRefresh<CR>
noremap [f <Esc>maO<Esc>`a:delmarks a<CR>:SignatureRefresh<CR>

noremap <BS> <Nop>

let g:peekaboo_delay = 500


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

" Push the repository of the currently opened file
nnoremap <leader>gp :call VimuxRunCommandInDir("git push", 0)<CR>

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

" nmap <C-I>  <Plug>(exjumplist-go-last)
" nmap <C-O>  <Plug>(exjumplist-go-first)

nmap <leader>ji  <Plug>(exjumplist-go-last)
nmap <leader>jo  <Plug>(exjumplist-go-first)

" nmap <C-M-i>  <Plug>(exjumplist-go-last)
" nmap <C-M-o>  <Plug>(exjumplist-go-first)
" nmap <M-)>  <Plug>(exjumplist-next-buffer)
" nmap <M-(>  <Plug>(exjumplist-previous-buffer)
"
" vim-rsi overloads some keys I need
silent! iunmap ä
silent! iunmap ö

" echo which property of highlight govenrs word under cursor
nnoremap <leader>hi :echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')<cr>

autocmd FileType make setlocal noexpandtab

noremap <leader>my :!python3 %<cr>

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


" Status Line: {{{

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
  let stat .= Color(active, 5, active ? ' »' : ' «')
  let stat .= ' %<'

  if fname == '__Gundo__'
    let stat .= 'Gundo'
  elseif fname == '__Gundo_Preview__'
    let stat .= 'Gundo Preview'
  elseif fname == '__Tagbar__'
    let stat .= 'Tagbar'
  else
    let stat .= '%f'
  endif

  let stat .= ' ' . Color(active, 3, active ? '«' : '»')

  " file modified
  let stat .= Color(active, 4, modified ? ' +' : '')

  " read only
  "
  let stat .= Color(active, 4, readonly ? ' ‼' : '')

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
" }}}

" }}}

" change status line colour if it is in insert mode {{{
if version >= 700
    if has("autocmd")
    augroup StatuslineColorGroup
        " Clear autocmds for this group
        autocmd!
        " au InsertEnter * highlight StatusLine gui=NONE guifg=#FFFFFF guibg=#9D3569 ctermbg=127
        au InsertEnter * highlight CursorLineNr guibg=#9D3569 ctermbg=235 ctermfg=33


        au InsertLeave * highlight StatusLine gui=NONE guifg=#d6d6d6 guibg=#602040 ctermbg=53
        au InsertLeave * highlight CursorLineNr guibg=#602040 ctermbg=53 ctermfg=232




    augroup end
    endif
endif
" }}}
"
inoremap ^] ^X^]
inoremap ^F ^X^F
inoremap ^D ^X^D
inoremap ^L ^X^L

" gi inserts text from last insertion position.
inoremap ^} <Esc>b5<C-}>ea
