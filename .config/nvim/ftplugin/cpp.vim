let g:LanguageServerName = "clangd"
let g:LanguageServerEnablerKey = "clangd.enabled"
let g:cppversion="20"
let s:compile_command="!g++ -fsanitize=undefined -o Program % --std=c++"
let g:compile_cur_file=s:compile_command . g:cppversion
let s:run_program="!/usr/bin/time -f '\\%es\\t\\%Mkb' " . "timeout -k 3 2 ./Program"
let s:run_program_in_term="!alacritty --config-file=$HOME/.config/alacritty/alacritty_no_transparency.yml --class=Program -e sh -c \"" . s:run_program[1:] . ";read\""

fu! CPP(...)
    let compile_cur_file=s:compile_command . g:cppversion

    exe "w"
    
    cd `=g:codesdir`

    exe compile_cur_file
    
    if v:shell_error != 0
        cd -
        return
    endif


    if a:0 == 0
        exe s:run_program . "<Input.txt &> Output.txt"
    elseif a:1 == 0
        exe s:run_program . "<Input.txt > Output.txt"
    elseif a:1 == 1
        exe s:run_program_in_term
    elseif a:1 == 2
        exe s:run_program . "<Input.txt"
    elseif a:1 == 3
        exe s:run_program . "<Input.txt >> Output.txt"
    endif
    
    if index( [124,125,137], v:shell_error ) >= 0
        silent exe "!echo 'TLE' > Output.txt"
    endif
    cd -
endfu

fu UpdateInput()
    exe "silent !xclip -o -sel clip > " . g:codesdir . "/Input.txt"
endfu

fu CopyOutput()
    exe "silent !xclip -sel clip " . g:codesdir . "/Output.txt"
endfu

"IO
imap <F12> <Esc> :call CPP(0) <CR>
map <F12> :call CPP(0) <CR>
"IO+stderr
imap <F11> <Esc> :call CPP() <CR>
map <F11> :call CPP() <CR>
"Input only
imap<F9> <Esc> :call CPP(2) <CR>
map <F9> :call CPP(2) <CR>
"Input+terminal
imap <F10> <Esc> :call CPP(1) <CR>
map <F10> :call CPP(1) <CR>
"Input+Append
imap <F7> <Esc> :call CPP(3) <CR>
map <F7> :call CPP(3) <CR>

map<silent><F4> :call UpdateInput() <CR>
map<silent><F3> :call CopyOutput() <CR>

map <Leader>m :w \| !make &&./Program <CR>
" map <silent><Leader>tl :call CocAction('toggleService', 'clangd')<CR>
" map <silent><Leader>td :call CocAction('diagnosticToggle', 'clangd')<CR>
