" TODO(nils): improve this
" TODO(nils): does not work well with nested functions / macros
" TODO(nils): incorrect fold and foldtext when using fn...\n where{
" {{{ Rust custom fold
autocmd FileType rust setlocal foldmethod=expr
autocmd FileType rust setlocal foldexpr=Nilsfold(v:lnum)
autocmd FileType rust setlocal foldtext=Nilstext()

function! NextNonBlankLine(lnum)
    let numlines = line('$')
    let current = a:lnum + 1

    while current <= numlines
        if getline(current) =~? '\v\S'
            return current
        endif

        let current += 1
    endwhile

    return -2
endfunction

function! IndentLevel(lnum)
    return indent(a:lnum) / &shiftwidth
endfunction

function! IsAnnotation(lnum)
    return getline(a:lnum) =~? '#\[.*\]'
endfunction

function! IsDoc(lnum)
    return getline(a:lnum) =~? '///'
endfunction

function! Nilsfold(lnum)
    " split at empty lines
    if getline(a:lnum) =~? '\v^\s*$'
        return '-1'
    endif

    " block closer
    if getline(a:lnum) =~? '}'
        return '='
    endif

    let this_indent = IndentLevel(a:lnum) > 0
    let next_indent = IndentLevel(NextNonBlankLine(a:lnum)) > 0

    if IsDoc(a:lnum) || IsAnnotation(a:lnum)
        if IsDoc(a:lnum -1) || IsAnnotation(a:lnum -1)
            return '1'
        else
            return '>1'
        endif
    endif

    " body
    if next_indent == this_indent
        return this_indent
        " end
    elseif next_indent < this_indent
        return this_indent
        " start
    elseif next_indent > this_indent
        if IsAnnotation(a:lnum - 1) || IsDoc(a:lnum - 1)
            return next_indent
        else
            return '>' . next_indent
        endif
    endif
endfunction

function! Nilstext()
    let title_line = v:foldstart
    let loop_guard = 5000
    while (loop_guard > 0 && (IsDoc(title_line) || IsAnnotation(title_line)))
        let title_line = (title_line + 1)
        let loop_guard = loop_guard - 1
    endwhile

    let title = getline(title_line)

    " multiline function header
    "
    let title = substitute(title, "(.*)", "(...)", '')
    let title = substitute(title, "->.*", "", '')
    let title = substitute(title, "([^)]*$", "", '')
    let title = substitute(title, "{", "", '')
    let title = substitute(title, "\ *$", "", '')

    let fold_size = (v:foldend - v:foldstart)
    let linecount = '[' . fold_size . ']'
    let prefix = '+-- '
    return prefix . title . ' ' .  linecount
endfunction

" }}}
