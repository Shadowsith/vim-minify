let s:keywords = [';',',',':','{','}','(',')','[',']','=','+','-','\*','\/','<',
                \'>','<=','>=','&','|','!']



function mincss#Minify()
    let l:min_file = expand('%:r') . '.min.' . expand('%:e') 

    silent! %s/\n//g
    silent! %s/\r//g

    let l:line = getline('.')

    for k in s:keywords 
        let before = '\s*' . k
        let l:line = substitute(l:line, before, k, 'g')
        let after = k . '\s*' 
        let l:line = substitute(l:line, after, k, 'g')
    endfor
    call setline('.',l:line)

    let l:cmd = 'write! ' . l:min_file 
    execute l:cmd
    undo

endfunction

function mincss#LineMinify(lnum1,lnum2)
    let l:cmd1 = a:lnum1 . ',' . a:lnum2 . 's/\n//g'
    let l:cmd2 = a:lnum1 . ',' . a:lnum2 . 's/\r//g'
    silent! execute l:cmd1
    silent! execute l:cmd2

    let l:line = getline(a:lnum1) 

    for k in s:keywords
        let before = '\s*' . k
        let l:line = substitute(l:line, before, k, 'g')
        let after = k . '\s*'
        let l:line = substitute(l:line, after, k, 'g')
    endfor

    call setline(a:lnum1, l:line)

   call setline(a:lnum1, l:line)

endfunction

function mincss#UnMinifyCSS()
    silent! %s/{\ze[^\r\n]/{\r/g
    silent! %s/){/) {/g
    silent! %s/};\?\ze[^\r\n]/\0\r/g
    silent! %s/;\ze[^\r\n]/;\r/g
    silent! normal ggVG=
endfunction
