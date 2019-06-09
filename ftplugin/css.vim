command! -buffer MinifyCSS call mincss#Minify()
command! -buffer UnMinifyCSS call mincss#UnMinifyCSS()
command! -range -bar Mincss call mincss#LineMinify(<line1>,<line2>)

