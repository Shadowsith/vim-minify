function minjs#Done(file)
    echo s:min_file . " written!"
endfunction


function minjs#Minify()
    let s:min_file = expand('%:r') . '.min.' . expand('%:e') 
    silent! %s/\/\/.*//g
    silent! %s/\n//g
    silent! %s/\r//g
    silent! %s/'/"/g

    let l:line = getline('.')
    let l:curl = "curl -X POST --data-urlencode input='" . l:line .
                \"' https://javascript-minifier.com/raw > " . s:min_file
    call job_start(["/bin/bash", "-c", l:curl],
                \{'close_cb': 'minjs#Done', 'out_io': 'null'})
    undo
endfunction

function minjs#LineMinify(lnum1, lnum2)
    let l:subs = []
    call add(l:subs, a:lnum1 . ',' . a:lnum2 . 's/\/\/.*//g')
    call add(l:subs, a:lnum1 . ',' . a:lnum2 . 's/\n//g')
    call add(l:subs, a:lnum1 . ',' . a:lnum2 . 's/\r//g')
    call add(l:subs, a:lnum1 . ',' . a:lnum2 . "s/'/\"/g")
    for l:cmd in l:subs
        silent! execute l:cmd
    endfor

    let l:line = getline(a:lnum1) 
    let s:lnum1 = a:lnum1
    let l:curl = "curl -s -X POST --data-urlencode 'input=" . l:line .
                \"' https://javascript-minifier.com/raw"
    call job_start(["/bin/bash", "-c", l:curl],
                \{'close_cb': 'minjs#SetLines', 'out_io': 'buffer', 
                \'out_name': 'minjs_buffer', 'out_msg': 0})
endfunction

function minjs#SetLines(res)
    let l:buffer = getbufline(bufnr('minjs_buffer'), 1)[0]
    call deletebufline(bufnr('minjs_buffer'), 1)
    call setline(s:lnum1, l:buffer)
endfunction

function minjs#UnMinify()
    silent! %s/{\ze[^\r\n]/{\r/g
    silent! %s/){/) {/g
    silent! %s/};\?\ze[^\r\n]/\0\r/g
    silent! %s/;\ze[^\r\n]/;\r/g
    silent! normal ggVG=
endfunction
