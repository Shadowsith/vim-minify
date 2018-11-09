let $ft = expand('%:e')

if $ft == "js"
    command! -buffer MinifyJS call minjs#Minify()
    command! -buffer UnMinifyJS call minjs#UnMinify()
    command! -range -bar Minjs call minjs#LineMinify(<line1>,<line2>)
endif

if $ft == "css"
    command! -buffer MinifyCSS call mincss#Minify()
    command! -buffer UnMinifyCSS call mincss#UnMinifyCSS()
    command! -range -bar Mincss call mincss#LineMinify(<line1>,<line2>)
endif

if $ft == "html" || $ft == "php"
    command! -range -bar Minjs call minjs#LineMinify(<line1>,<line2>)
    command! -range -bar Mincss call mincss#LineMinify(<line1>,<line2>)
endif
