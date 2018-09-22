let $ft = expand('%:e')

if $ft == "js"
    command! -buffer MinifyJS call minjs#Minify()
endif

if $ft == "css"
    command! -buffer MinifyCSS call mincss#Minify()
endif

if $ft == "js" || $ft == "css" || $ft == "html" || $ft == "php"
    "here will be the line based commands
endif
