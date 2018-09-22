# Vim-minify

A small vim plugin to minify your javascript and css code directly and fast in vim.

## Features
* Minifies whole javascript and css files
* functions occurs only in JavaScript, CSS, HTML and PHP files
* complete and line based minifying
* secure (no thridparty web service or software needed)

## Usage

In javascript or css files: (implemented)
* <code>:MinifyJS</code> minifies your javascript code
* <code>:MinifyCSS</code> minifies your css code

In html or php files: (comming soon)
* <code>1,5minjs</code> minifies embedded javascript code
* <code>1,5mincss</code> minifies embedded css code

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
