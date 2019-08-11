if exists('g:vim_filter')
    finish
endif
let g:vim_filter = 1

command! -nargs=? Remove call vim_filter#FilterRemove(<q-args>)
command! -nargs=? Add call vim_filter#FilterAdd(<q-args>)
