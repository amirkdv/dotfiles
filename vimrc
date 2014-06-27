filetype plugin on
scriptencoding utf-8
set encoding=utf-8
let mapleader=";"
"----------------------------------------------------------------------
" Colors, Highilights, and General Look
"----------------------------------------------------------------------
" Use the following chart for picking 256 colors
" http://upload.wikimedia.org/wikipedia/en/1/15/Xterm_256color_chart.svg
set t_Co=256            " Enable 256 color
colorscheme molokai     " has hi Normal ctermbg=234; for equivalent
                        " terminal background use #1c1c1c
                        " cf. https://gist.github.com/MicahElliott/719710
set background=dark     " is only required for molokai in terminal
set t_md=               " get rid of bold font altogether!
highlight ColumnColor   ctermbg=234
highlight CursorLine    cterm=NONE  ctermbg=234
highlight CursorColumn  cterm=NONE  ctermbg=233
highlight StatusLine    ctermbg=94  ctermfg=232
highlight LineNr        ctermfg=94  ctermbg=233 " line number column color
highlight Visual        ctermbg=239
highlight TODO          ctermbg=226 ctermfg=233
highlight DEBUG         ctermbg=047 ctermfg=233
set number
set textwidth=80
set colorcolumn=81      " needed by highlight ColumnColor
set laststatus=2        " always show status line
set statusline=%m%.40F\ %y\ -
set cursorline          " highlight the current line
set showmatch           " highlight matching braces
set modeline            " respect # vi: [command] :
set modelines=2
autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|XXX\|BUG\|HACK\)')
autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\)')
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
noremap   <C-l> :tabm +1 <cr>
noremap   <C-h> :tabm -1 <cr>
nnoremap  <tab>   gt
nnoremap  <s-tab> gT
nnoremap  <C-t>   :tabe<cr>
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
noremap <leader>y "+y
noremap <leader>p "+p
" Paste when clipboard forwarding is not working:
command Rc r ! cat -
" Map \d and \p to blackhole register d and p
noremap <leader>d "_d
" Write as root if file opened as readonly
command F %!sudo tee > /dev/null %
" print the highlight rule that applies to current word
command C echo synIDattr(synID(line("."), col("."), 1), "name")
