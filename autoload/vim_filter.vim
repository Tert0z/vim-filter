
function! vim_filter#FilterAdd(regexp)
    let l:patern = expand('<cword>')
    if a:regexp != ''
        let l:patern = a:regexp
    endif
    if !exists('t:filter')
        let t:filter=[l:patern]
    else
        call add(t:filter, l:patern)
        exec bufwinnr(join(t:filter, '\|')) . 'winc q'
    endif
    call s:Filter()
endfunction

function! vim_filter#FilterRemove(num)
    if exists('t:filter')
        let cw = expand('<cword>')
        exec bufwinnr(join(t:filter, '\|')) . 'winc q'
        if a:num != ''
            call remove(t:filter, a:num)
        elseif
            call filter(t:filter, 'v:val != "' . cw . '"')
        endif
    endif
    call s:Filter()
endfunction

function! s:Filter()
    let @a=''
    let desc = join(t:filter, '\|')
    execute 'g/'.join(t:filter, '\|').'/y A'
    execute "normal \<c-o>"
    new
    exec "file ".desc
    setlocal bt=nofile
    setlocal nobuflisted
    put! a
endfunction
