" {{{ VIMUX "
if !has ('nvim')
    " VIMUX Settings for tmux integration as repl
    " size settings
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
