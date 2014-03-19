" Vim syntax file
" Language: todo
" By: Amir Kadivar
" Requires: syntax/rest.vim in runtimepath

" include reStructuredText syntax file and use its elements as @rst group
" syn-include will mark all syntax items from included file as 'contained'
if exists("b:current_syntax")
  finish
endif
" rstBasics:
syn region  rstLiteralBlock   start='::\_s*\n\ze\z\(\a\+\)' skip='^$' end='^\z1\@!$' contained extend
syn region  rstEmphasis       start=/\*[^*]/    end=/\*/    contained
syn region  rstStrongEmphasis start=/\*\*[^*]/  end=/\*\*/  contained
syn region  rstInlineLiteral  start=/``/        end=/``/    contains=rstURL contained
syn match   rstBulletedList   /^\s*\([+-]\|\*\)\s/          contained
syn match   rstEnumeratedList /^\s*[a-zA-Z0-9]\.\s/         contained
syn match   rstURL /\(file\|ftp\|http\|https\|mailto\):[-./[:alnum:]_~@:#%?!=+]\+/ contained
syn cluster rstBasics contains=rstEmphasis,rstStrongEmphasis,rstInlineLiteral,rstURL,rstBulletedList,rstEnumeratedList,rstLiteralBlock
highlight   rstURL            ctermfg=081
highlight   rstEmphasis       ctermfg=223 ctermbg=none cterm=none
highlight   rstStrongEmphasis ctermfg=217
hi link     rstBulletedList   Keyword
hi link     rstEnumeratedList Keyword
hi link     rstTitle          MatchParen


" [.] new/postponed
" [_] in progress/pending
" [x] done/wont-fix
" [?] idea/question
syntax region   todoItemDone        start=/^\s*\[x\]/  skip=/^$/ end=/^\s*\[/re=s-1,he=s-1,me=s-1 " contains=@rstBasics
syntax region   todoItemQuestion    start=/^\s*\[?\]/  skip=/^$/ end=/^\s*\[/re=s-1,he=s-1,me=s-1  contains=@rstBasics
syntax region   todoItemInProgress  start=/^\s*\[_\]/ skip=/^$/ end=/^\s*\[/re=s-1,he=s-1,me=s-1  contains=@rstBasics
syntax region   todoItemNew         start=/^\s*\[\.\]/ skip=/^$/ end=/^\s*\[/re=s-1,he=s-1,me=s-1 contains=@rstBasics
syntax match    magicLine           /^#\s*vi:.*:\s*$/

hi todoItemDone        ctermfg=065
hi todoItemQuestion    ctermfg=212
hi todoItemInProgress  ctermfg=112
hi magicLine           ctermfg=245

" toggle state of items, in visual mode apply to selection, in normal mode apply
" to current item.
"
" use <bar> instead of | to keep vim mapping happy
" wrap command between ma j and `a
nnoremap <buffer> tdx ma j :silent!?^\s*\[.\]?s/^\(\s*\)\[.\]/\1[x]/  <bar> nohlsearch<cr> `a
vnoremap <buffer> tdx :s/^\(\s*\)\[.\]/\1[x]/ <bar> nohlsearch<cr>

nnoremap <buffer> td. ma j :silent!?^\s*\[.\]?s/^\(\s*\)\[.\]/\1[.]/  <bar> nohlsearch<cr> `a
vnoremap <buffer> td. :s/^\(\s*\)\[.\]/\1[.]/  <bar> nohlsearch<cr>

nnoremap <buffer> td_ ma j :silent!?^\s*\[.\]?s/^\(\s*\)\[.\]/\1[_]/  <bar> nohlsearch<cr> `a
vnoremap <buffer> td_ :s/^\(\s*\)\[.\]/\1[_]/  <bar> nohlsearch<cr>

nnoremap <buffer> td? ma j :silent!?^\s*\[.\]?s/^\(\s*\)\[.\]/\1[?]/  <bar> nohlsearch<cr> `a
vnoremap <buffer> td? :s/^\(\s*\)\[.\]/\1[?]/  <bar> nohlsearch<cr>
