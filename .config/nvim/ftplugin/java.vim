let g:LanguageServerName = "java"
let g:LanguageServerEnablerKey = "java.enabled"

map <silent><F8> :call coc#config('java.enabled', 1) \| CocRestart <CR>

map <F9> :w<CR>:!java % <CR>
imap <F9> <Esc>:w<CR>:!java % <CR>

