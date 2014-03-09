" Vim syntax file, rst 'after'
" Language: reStructuredText Documentation Format
" By: Amir Kadivar

syn region rstStrongEmphasis start=/\*\*[^*]/ end=/\*\*/
syn region rstInlineLiteral start=/``/ end=/``/ contains=rstURL
syn region rstSubstitutionReference start=/|\w/ end=/\w|/ skip=/\\|/
syn match rstBulletedList /^\s*\([+-]\|\*\)\s/
syn match rstEnumeratedList /^\s*[a-zA-Z0-9]\.\s/
syn match rstURL /\(file\|ftp\|http\|https\|mailto\):[-./[:alnum:]_~@:#%?!=+]\+/
syntax match    magicLine         /^#\s*vim\?:.*:\s*$/
highlight rstURL            ctermfg=081
highlight rstEmphasis       ctermfg=223 ctermbg=none cterm=none
highlight rstStrongEmphasis ctermfg=217
hi link rstInlineLiteral Title
hi link rstBulletedList Keyword
hi link rstEnumeratedList Keyword
hi link rstTitle MatchParen
highlight magicLine           ctermfg=245

" embed todo syntax for embedded blocks, hack follows:
let b:current_syntax = ''
unlet b:current_syntax
syntax include @todo syntax/todo.vim
let b:current_syntax = ''
unlet b:current_syntax
" rst's definition of literal blocks stops at new line, instead use a line with '..'
syntax region todoEmbedded matchgroup=Snip start=/^.. code:: todo\s*\n/ end=/^..$/ contains=@todo keepend

let b:current_syntax = 'rst'

" all item markers: [x], [ ], and [?] are defined as list leaders, which in
" conjuction with fo=nt ensures proper indentation
" note: all special characters have to be escaped, e.g. '\|' becomes '\\\|'
set formatlistpat=^\\s*\\(\\\*\\\ \\\|\\d\\+\\.\\\ \\\|\\[\\(x\\\|?\\\|_\\\|\\.\\\|\\s\\)\\]\\\|\\.\\.\\)\\s*
set fo=nt
