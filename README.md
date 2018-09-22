# vim-minify

A small vim plugin to minify your javascript and css code directly and fast in vim.

## Features
* Minifying complete css or javascript files or line-based minifying
* functions occurs only in JavaScript, CSS, HTML and PHP files
* secure (no thridparty web service or software needed)

## Usage
In javascript or css files: (implemented)
* <code>:MinifyJS</code> minifies your javascript code
* <code>:MinifyCSS</code> minifies your css code

In html or php files: (comming soon)
* <code>:1,5minjs</code> minifies embedded javascript code (line 1 to 5)
* <code>:1,5mincss</code> minifies embedded css code (line 1 to 5)

## Installation
E.g. install plugin with vim-plug:
* In .vimrc: <code>Plug 'Shadowsith/vim-minify'</code>
* Open vim and execute <code>:PlugInstall</code>

Or put it in your .vim/bundle folder if you are using pathogen or vundle

## Knowing Issues
Unfortunally the minifier makes on this developmenti state no difference between
strings and code in javascript files. Please be careful if you have keywords,
which are used to minifying the code. For such code use the line based minifier and
minify the rest by your own.

## Examples

### Javascript
<img src="https://shadowsith.de/github/vim-minify/vim_js_minify.gif">

### CSS
<img src="https://shadowsith.de/github/vim-minify/vim_css_minify.gif">


## See also
* [XML-fast.vim](https://github.com/joeky888/XML-fast.vim), vim-xml-minifier
