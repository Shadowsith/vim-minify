function mincss#Minify()
    silent! %s/\n//g
    silent! %s/\r//g

    let keywords = [';',',',':','{','}','(',')','[',']','=','+','-','\*','\/','<',
                \'>','<=','>=','&','|','!']
    let l:line = getline('.')

    for k in keywords 
        let before = '\s*' . k
        let l:line = substitute(l:line, before, k, 'g')
        let after = k . '\s*' 
        let l:line = substitute(l:line, after, k, 'g')
    endfor
    call setline('.',l:line)
endfunction

function mincss#LineMinify(lnum1,lnum2)
    echo a:lnum1 . " " . a:lnum2
endfunction

function mincss#UnMinifyCSS()
    silent! %s/{\ze[^\r\n]/{\r/g
    silent! %s/){/) {/g
    silent! %s/};\?\ze[^\r\n]/\0\r/g
    silent! %s/;\ze[^\r\n]/;\r/g
    silent! normal ggVG=
endfunction
