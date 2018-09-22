function minjs#Minify()
    silent! %s/\n//g
    silent! %s/\r//g

    let keywords = [';',',',':','{','}','(',')','[',']','=','+','-','\*','\/','<',
                \'>','<=','>=']
    let l:line = getline('.')

    for k in keywords 
        let before = '\s*' . k
        let l:line = substitute(l:line, before, k, 'g')
        let after = k . '\s*' 
        let l:line = substitute(l:line, after, k, 'g')
    endfor
    call setline('.',l:line)
endfunction
