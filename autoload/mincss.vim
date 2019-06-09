let s:keywords = [';',',',':','{','}','(',')','[',']','=','+','-','\*','\/',
                    \'<','>','<=','>=','&','|','!']

function mincss#Minify()
    let l:min_file = expand('%:r') . '.min.' . expand('%:e') 

    silent! %s/\n//g
    silent! %s/\r//g
    silent! %s/'/"/g

    let l:line = getline('.')
    let l:curl = "curl -X POST --data-urlencode 'input=" . l:line .
                \"' https://cssminifier.com/raw > " . l:min_file
    call system(l:curl)
    echo l:min_file . " written!"
    undo
endfunction

function mincss#LineMinify(lnum1,lnum2)
    let l:cmd1 = a:lnum1 . ',' . a:lnum2 . 's/\n//g'
    let l:cmd2 = a:lnum1 . ',' . a:lnum2 . 's/\r//g'
    let l:cmd3 = a:lnum1 . ',' . a:lnum2 . "s/'/\"/g"
    silent! execute l:cmd1
    silent! execute l:cmd2
    silent! execute l:cmd3

    let l:line = getline(a:lnum1) 
    let l:curl = "curl -s -X POST --data-urlencode 'input=" . l:line .
                \"' https://cssminifier.com/raw"
    let l:minline = system(l:curl)
    call setline(a:lnum1, l:minline)
endfunction

function mincss#UnMinifyCSS()
    %s/[{;}]/&\r/g|norm! =gg
    %s/}/\r}\r/g|norm! =gg
endfunction
