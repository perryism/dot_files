set nocompatible              " be iMproved, required
set noswapfile
filetype off                  " required

if has("autocmd")
	" Remove trailing white space upon save
	autocmd BufWritePre *.go,*.yaml,*.py,*.js,*.coffee,*.erb,*.rb,*.rake,*.yml,*.md,*.css,*.es6,*.ts :call <SID>StripTrailingWhitespaces()
	autocmd BufNewFile,BufRead *.es6 setfiletype javascript
	autocmd BufNewFile,BufRead *.ts setfiletype javascript
end

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
filetype plugin indent on    " required
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-rails'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-fugitive'

""Plugin 'leafgarland/typescript-vim'
"All of your Plugins must be added before the following line
call vundle#end()            " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 0
let g:instant_markdown_open_to_the_world = 1
let g:instant_markdown_allow_unsafe_content = 1
let g:instant_markdown_allow_external_content = 0
let g:instant_markdown_mathjax = 1
let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
let g:instant_markdown_autoscroll = 0
let g:instant_markdown_port = 8888
let g:instant_markdown_python = 1



syntax on
set number
set mouse=a

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
map <C-n> :NERDTreeToggle<CR>

nnoremap ; :
nnoremap <silent> t :CtrlP<CR>

let g:rspec_runner = "os_x_iterm2"
let g:rspec_command = "spring rspec {spec}"

if exists("g:ctrlp_user_command")
  unlet g:ctrlp_user_command
endif
set wildignore+=*\\vendor\\**


set wildignore+=*/tmp/*,*.log,*.png,*.jpg
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

augroup filetype_haml
  autocmd!
  autocmd FileType haml setlocal        tabstop=2 softtabstop=2 shiftwidth=2 expandtab " foldmethod=indent
augroup END

augroup filetype_html
  autocmd!
  autocmd FileType html setlocal        tabstop=2 softtabstop=2 shiftwidth=2 expandtab
augroup END

augroup filetype_css
  autocmd!
  autocmd FileType css setlocal         tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  autocmd FileType css set omnifunc=csscomplete#CompleteCSS
augroup END

augroup filetype_python
  autocmd!
  autocmd FileType python setlocal      tabstop=4 softtabstop=4 shiftwidth=4 expandtab noexpandtab
augroup END

autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab
au BufEnter *.py set ai sw=4 ts=4 sta et fo=croql

au BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab autoindent fileformat=unix 

augroup filtype_ruby
  autocmd!
  autocmd FileType ruby setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab foldmethod=syntax foldlevel=99
augroup END

augroup filetype_yaml
  autocmd!
  autocmd FileType yaml setlocal        tabstop=2 softtabstop=2 shiftwidth=2 expandtab 
augroup END

augroup filetype_gitcommit
  autocmd!
  autocmd FileType gitcommit setlocal        tabstop=2 softtabstop=2 shiftwidth=2 expandtab spell textwidth=72
augroup END

augroup filetype_text
  autocmd!
  autocmd FileType text setlocal        tabstop=2 softtabstop=2 shiftwidth=2 expandtab spell
augroup END

augroup filetype_go
  autocmd!
  autocmd FileType go setlocal        tabstop=2 softtabstop=2 shiftwidth=2 expandtab spell
augroup END
"augroup filetype_typescript
"  autocmd!
"  autocmd FileType text setlocal        tabstop=2 softtabstop=2 shiftwidth=2 expandtab spell
"augroup END

augroup filetype_markdown
  autocmd!
  autocmd FileType markdown setlocal        tabstop=2 softtabstop=2 shiftwidth=2 expandtab spell
augroup END

augroup filetype_markdown
  autocmd!
  autocmd FileType markdown setlocal        tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab
augroup END

augroup filetype_json
  autocmd!
  autocmd FileType json setlocal        tabstop=2 softtabstop=2 shiftwidth=2 expandtab 
augroup END

" Remove trailing white spaces
function! <SID>StripTrailingWhitespaces()
		" Preparation: save last search, and cursor position.
		let _s=@/
		let l = line(".")
		let c = col(".")
		" Do the business:
		%s/\s\+$//e
		" Clean up: restore previous search history, and cursor position
		let @/=_s
		call cursor(l, c)
endfunction


augroup filetype_javascript
  autocmd!
  autocmd FileType javascript setlocal  tabstop=2 softtabstop=2 shiftwidth=2 expandtab
augroup END



iabbrev ture true

" Treat j and k as up and down on long lines in wrap mode.
nnoremap j gj
nnoremap k gk

source ~/.monokai.vim
let g:typescript_indent_disable = 1
