# vim-minify

A small vim plugin to (un)minify your javascript and css code directly and fast in vim and neovim.

This plugin uses the API from [javascript-minifier.com](https://javascript-minifier.com)
and [cssminifier.com](https://cssminifier.com/) by [Andrew Chilton](https://chilts.org/).

## Features
* Support for noevim
* Minifying complete css or javascript files or line-based minifying
* writes a file.min.extension file in the directory of the file (e.g. site.min.js in
  folder where site.js is)
* functions occurs only in JavaScript, CSS, HTML and PHP files
* uses well-working minifier API

## Requriements
* curl
* internet connection

## Usage
### In JavaScript files
* <code>:MinifyJS</code> minifies your javascript code to filename.min.js
* <code>:UnMinifyJS</code> reformat to be human readable 

### In CSS files
* <code>:MinifyCSS</code> minifies your css code to filename.min.css
* <code>:UnMinifyCSS</code> reformat to be human readable

### In JavaScript, CSS, HTML and PHP files
* <code>:1,5Minjs</code> minifies (embedded) javascript code (line 1 to 5)
* <code>:1,5Mincss</code> minifies (embedded) css code (line 1 to 5)

## Installation
E.g. install plugin with vim-plug:
* In .vimrc: <code>Plug 'Shadowsith/vim-minify'</code>
* Open vim and execute <code>:PlugInstall</code>

Or put it in your .vim/bundle folder if you are using pathogen or vundle

## Examples

### Javascript
<img src="https://shadowsith.de/github/vim-minify/vim_js_minify.gif">

### CSS
<img src="https://shadowsith.de/github/vim-minify/vim_css_minify.gif">


## See also
* [XML-fast.vim](https://github.com/joeky888/XML-fast.vim), vim-xml-minifier
