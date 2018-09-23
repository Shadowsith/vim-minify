let $ft = expand('%:e')

if $ft == "js"
    command! -buffer MinifyJS call minjs#Minify()
endif

if $ft == "css"
    command! -buffer MinifyCSS call mincss#Minify()
endif

if $ft == "js" || $ft == "css" || $ft == "html" || $ft == "php"
    command! -range -bar Minjs call minjs#LineMinify(<line1>,<line2>)
    command! -range -bar Mincss call mincss#LineMinify(<line1>,<line2>)
endif
