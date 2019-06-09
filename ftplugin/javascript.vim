command! -buffer MinifyJS call minjs#Minify()
command! -buffer UnMinifyJS call minjs#UnMinify()
command! -range -bar Minjs call minjs#LineMinify(<line1>,<line2>)
