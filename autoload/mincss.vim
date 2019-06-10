function mincss#Done(file)
    echo s:min_file . " written!"
endfunction

function mincss#Minify()
    let s:min_file = expand('%:r') . '.min.' . expand('%:e') 

    silent! %s/\n//g
    silent! %s/\r//g
    silent! %s/'/"/g

    let l:line = getline('.')
    let l:curl = "curl -X POST --data-urlencode 'input=" . l:line .
                \"' https://cssminifier.com/raw > " . s:min_file
    call job_start(["/bin/bash", "-c", l:curl], {'close_cb': 'mincss#Done', 'out_io': 'null'})
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
    let s:lnum1 = a:lnum1
    let l:curl = "curl -s -X POST --data-urlencode 'input=" . l:line .
                \"' https://cssminifier.com/raw"
    "let l:minline = system(l:curl)

    call job_start(["/bin/bash", "-c", l:curl], {'close_cb': 'mincss#SetLines', 'out_io': 'buffer', 'out_name': 'linebuffer', 'out_msg': 0})
    "call setline(a:lnum1, l:minline)
endfunction

function mincss#SetLines(res)
    if(getbufline(bufnr('linebuffer'), 2)[0] != "")
        call deletebufline(bufnr('linebuffer'), 1)
    endif
    let l:buffer = getbufline(bufnr('linebuffer'), 1)
    call setline(s:lnum1, l:buffer)
endfunction

function mincss#UnMinifyCSS()
    %s/[{;}]/&\r/g|norm! =gg
    %s/}/\r}\r/g|norm! =gg
endfunction
