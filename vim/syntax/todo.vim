" Vim syntax file
" Language: todo
" By: Amir Kadivar
" Usage example:
" [ ] This is a new item
"     [ ] a subitem; some *basic* rst is supported
" [_] item in progress
"     [x] closed subitem (fixed), demonstrating usage of ``ls``::
"           # example code block
"           ls -al /var/share/
"     [_] an in progress item, when finished use the following::
"           tdx
"         in normal mode while the cursor is anywhere within the
"         contents of this item and it will be marked as done ([x]).
" [?] sometimes it's not a task, but a question, or an idea.

if exists("b:current_syntax")
  finish
endif

" rstBasics:
syn region  rstLiteralBlock   start='::\n\z\(\s\+\)' skip='^$' end='^\z1\@!' contained extend
syn region  rstEmphasis       start=/\*[^*]/    end=/\*/    contained
syn region  rstStrongEmphasis start=/\*\*[^*]/  end=/\*\*/  contained
syn region  rstInlineLiteral  start=/``/        end=/``/    contains=rstURL contained
syn match   rstBulletedList   /^\s*\([+-]\|\*\)\s/          contained
syn match   rstEnumeratedList /^\s*[a-zA-Z0-9]\.\s/         contained
syn match   rstURL /\(file\|ftp\|http\|https\|mailto\):[-./[:alnum:]_~@:#%?!=+,]\+/ contained
syn cluster rstBasics contains=rstEmphasis,rstStrongEmphasis,rstInlineLiteral,rstURL,rstBulletedList,rstEnumeratedList,rstLiteralBlock
hi rstURL            ctermfg=081
hi rstEmphasis       ctermfg=223 ctermbg=none cterm=none
hi rstStrongEmphasis ctermfg=217
hi link     rstBulletedList   Keyword
hi link     rstEnumeratedList Keyword
hi link     rstTitle          MatchParen
hi link     rstLiteralBlock   String

" [ ] new
" [_] in progress/pending
" [x] done/wont-fix/postponed
" [?] idea/question
syntax region   todoItemDone        start=/^\s*\[x\]/  skip=/^$/ end=/^\s*\[\(x\|?\|_\|\ \)\]/re=s-3,he=s-3,me=s-3
syntax region   todoItemQuestion    start=/^\s*\[?\]/  skip=/^$/ end=/^\s*\[\(x\|?\|_\|\ \)\]/re=s-3,he=s-3,me=s-3 contains=@rstBasics
syntax region   todoItemInProgress  start=/^\s*\[_\]/ skip=/^$/  end=/^\s*\[\(x\|?\|_\|\ \)\]/re=s-3,he=s-3,me=s-3 contains=@rstBasics
syntax region   todoItemNew         start=/^\s*\[\ \]/ skip=/^$/ end=/^\s*\[\(x\|?\|_\|\ \)\]/re=s-3,he=s-3,me=s-3 contains=@rstBasics
syntax match    magicLine           /^#\s*vi:.*:\s*$/

hi todoItemDone       ctermfg=065
hi todoItemQuestion   ctermfg=212
hi todoItemInProgress ctermfg=112
hi todoItemNew        ctermfg=183
hi magicLine          ctermfg=245

" toggle state of items, in visual mode apply to selection, in normal mode apply
" to current item.
"
" use <bar> instead of | to keep vim mapping happy
" wrap command between ma j and `a
nnoremap <buffer> tdx ma j :silent!?^\s*\[.\]?s/^\(\s*\)\[.\]/\1[x]/  <bar> nohlsearch<cr> `a
vnoremap <buffer> tdx :s/^\(\s*\)\[.\]/\1[x]/ <bar> nohlsearch<cr>

nnoremap <buffer> td ma j :silent!?^\s*\[.\]?s/^\(\s*\)\[.\]/\1[ ]/  <bar> nohlsearch<cr> `a
vnoremap <buffer> td :s/^\(\s*\)\[.\]/\1[ ]/  <bar> nohlsearch<cr>

nnoremap <buffer> td_ ma j :silent!?^\s*\[.\]?s/^\(\s*\)\[.\]/\1[_]/  <bar> nohlsearch<cr> `a
vnoremap <buffer> td_ :s/^\(\s*\)\[.\]/\1[_]/  <bar> nohlsearch<cr>

nnoremap <buffer> td? ma j :silent!?^\s*\[.\]?s/^\(\s*\)\[.\]/\1[?]/  <bar> nohlsearch<cr> `a
vnoremap <buffer> td? :s/^\(\s*\)\[.\]/\1[?]/  <bar> nohlsearch<cr>
