set backupcopy=yes " so docker mounting of single files doesn't break

filetype plugin on
syntax on
scriptencoding utf-8
set encoding=utf-8
set guifont=Inconsolata\ 13
let mapleader=";"
"----------------------------------------------------------------------
" Colors, Highilights, and General Look
"----------------------------------------------------------------------
" Use the following chart for picking 256 colors
" http://upload.wikimedia.org/wikipedia/en/1/15/Xterm_256color_chart.svg
" FIXME the above is defunct, find another one on wikipedia or use this: https://jonasjacek.github.io/colors/
set t_Co=256            " Enable 256 color
" colorscheme molokai     " has hi Normal ctermbg=234; for equivalent
                        " terminal background use #1c1c1c
                        " cf. https://gist.github.com/MicahElliott/719710
" set background=dark     " is only required for molokai in terminal
" Colorscheme set lower down now

set t_md=               " get rid of bold font altogether!
set cursorline

highlight ColorColumn ctermbg=234
highlight CursorLine    cterm=NONE  ctermbg=234
highlight StatusLine    ctermbg=194 ctermfg=233
highlight LineNr        ctermfg=194 ctermbg=233 " line number column color
highlight Visual        ctermbg=234
highlight TODO          ctermbg=226 ctermfg=233
highlight DEBUG         ctermbg=047 ctermfg=233

highlight TabLine     ctermfg=194 ctermbg=234 cterm=none
highlight TabLineSel  ctermfg=234 ctermbg=192 cterm=none
highlight TabLineFill ctermfg=234 ctermbg=234 cterm=none

set foldcolumn=2
highlight! link FoldColumn Normal
set showtabline=2 " Always show the tabline even if there's only one

set number
set textwidth=80
set colorcolumn=81      " needed by highlight ColumnColor
set laststatus=2        " always show status line
set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V%)
set showmatch           " highlight matching braces
set modeline            " respect # vi: [command] :
set modelines=2
autocmd Syntax * call matchadd('Todo',  '\W\zs\(NOTE\|TODO\|FIXME\|XXX\|BUG\|HACK\)')

colorscheme PaperColor
" set background=light
set background=dark
" clean up (duplicated and overriden above)
highlight TODO          ctermbg=230 ctermfg=241
"----------------------------------------------------------------------
" Navigation
"----------------------------------------------------------------------
" nicer up/down navigation in wrapped lines
map j gj
map k gk
set scrolloff=10        " keep the cursor 10 lines away from the edges
" nicer pageup/down
noremap   <C-j>   10j
noremap   <C-k>   10k
" nicer tab navigation
noremap   <C-s-PageDown> :tabm +1 <cr>
noremap   <C-s-PageUp> :tabm -1 <cr>
nnoremap  <tab>   gt
nnoremap  <s-tab> gT
" use <leader> instead of Ctrl for splits
noremap   <leader>v     <C-w>v
noremap   <leader>s     <C-w>s
map       <leader>j     <C-w>j
map       <leader>k     <C-w>k
map       <leader>h     <C-w>h
map       <leader>l     <C-w>l
"----------------------------------------------------------------------
" Search
"----------------------------------------------------------------------
set hlsearch
set incsearch  " show results as I type
set ignorecase
set smartcase
noremap <leader><leader> :nohlsearch<cr>
"----------------------------------------------------------------------
" Indentation and Whitespaces
"----------------------------------------------------------------------
set autoindent
set formatoptions=cq
set smartindent
set shiftwidth=2
set softtabstop=2
set tabstop=2
" Make it autocmd on InsertLeave so to get rid of flashing dots
set listchars=tab:›\ ,trail:·,eol:¬
set list
au WinLeave,InsertEnter * :set listchars-=trail:·
au WinEnter,InsertLeave * :set listchars+=trail:·
" wrap /\s\+%$// in ma `a, otherwise current line won't be the same
" normal mode commands are executed in commands via :norm
" NOTE comment out the following in interactive git hunk edit; removing trailing
" spaces corrupts git patches.
autocmd BufWritePre * :norm ma
autocmd BufWritePre * :%s/\s\+$//e
autocmd BufWritePost * :norm `a
" Disable vim-markdown folding
let g:vim_markdown_folding_disabled=1
set expandtab
"----------------------------------------------------------------------
" Text Handling
"----------------------------------------------------------------------
" yank/paste to/from clipboard
" NOTE this needs +clipboard which doesn't come with default vim (install vim-gtk)
noremap <leader>y "+y
noremap <leader>p "+p
" Paste when clipboard forwarding is not working:
command Rc r ! cat -
" Map \d and \p to blackhole register d and p
noremap <leader>d "_d
" Write as root if file opened as readonly
command F %!sudo tee > /dev/null %
" Show syntax highlighting groups for word under cursor
" taken from: http://stackoverflow.com/a/7893500
command C echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')

" when commenting out add a space after comment symbol
let NERDSpaceDelims=1
