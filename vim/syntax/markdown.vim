" Vim syntax file
" Language:   Pandoc Markdown, Taken from markdown vim syntax of Ben Williams
"             See http://plasticboy.com/markdown-vim-mode/
" Maintainer: Amir Kadivar
"
" FIXME cleanup, remove unnecessary bits (I'm excluding raw html)

syn region pmdEmphasis matchgroup=pmdDelimiter start=/\z\(_\|\*\)/ end=/\z1/ keepend oneline
syn region pmdStrong matchgroup=pmdDelimiter start=/\z\(__\|\*\*\)/ end=/\z1/ keepend oneline


" Link definitions: [id]: URL (Optional Title)
syn region pmdLinkDef matchgroup=pmdDelimiter   start="^ \{,3}\zs\[" end="]:" oneline nextgroup=pmdLinkDefTarget skipwhite
syn region pmdLinkDefTarget start="<\?\zs\S" excludenl end="\ze[>[:space:]\n]"   contained nextgroup=pmdLinkTitle,pmdLinkDef skipwhite skipnl oneline
syn region pmdLinkTitle matchgroup=pmdDelimiter start=+"+     end=+"+  contained
syn region pmdLinkTitle matchgroup=pmdDelimiter start=+'+     end=+'+  contained
syn region pmdLinkTitle matchgroup=pmdDelimiter start=+(+     end=+)+  contained

"define Markdown groups
syn match  pmdLineContinue ".$" contained
syn match  pmdLineBreak    /  \+$/
syn region pmdBlockquote   start=/^\s*>/                   end=/$/ contains=pmdLineBreak,pmdLineContinue,@Spell
syn region pmdCode         start=/\(\([^\\]\|^\)\\\)\@<!`/ end=/\(\([^\\]\|^\)\\\)\@<!`/
syn region pmdCode         start=/\s*``[^`]*/              end=/[^`]*``\s*/
syn region pmdCode         start=/^```\s*[0-9A-Za-z_-]*\s*$/          end=/^```\s*$/
syn region pmdCode         start="<pre[^>]*>"              end="</pre>"
syn region pmdCode         start="<code[^>]*>"             end="</code>"
syn match  pmdCode         /^\s*\n\(\(\s\{8,}[^ ]\|\t\t\+[^\t]\).*\n\)\+/
syn match  pmdIndentCode   /^\s*\n\(\(\s\{4,}[^ ]\|\t\+[^\t]\).*\n\)\+/ contained
syn match  pmdListItem     "^\s*[-*+]\s\+"
syn match  pmdListItem     "^\s*\d\+\.\s\+"
syn region pmdNonListItemBlock start="\n\(\_^\_$\|\s\{4,}[^ ]\|\t+[^\t]\)\@!" end="^\(\s*\([-*+]\|\d\+\.\)\s\+\)\@=" contains=@pmdNonListItem
syn match  pmdRule         /^\s*\*\s\{0,1}\*\s\{0,1}\*$/
syn match  pmdRule         /^\s*-\s\{0,1}-\s\{0,1}-$/
syn match  pmdRule         /^\s*_\s\{0,1}_\s\{0,1}_$/
syn match  pmdRule         /^\s*-\{3,}$/
syn match  pmdRule         /^\s*\*\{3,5}$/

" [link](URL) | [link][id] | [link][]
syn match   pmdHyperlinkDef /\[[^\] \^][^\]]*\]\(([^)]\+)\|\[[^\]]*\]\)/ contains=pmdID,pmdURL,pmdLink
syn region  pmdID matchgroup=pmdDelimiter   start="\[^"    end="\]" contained
syn region  pmdURL matchgroup=pmdDelimiter  start="("     end=")"  contained
syn region  pmdLink matchgroup=pmdDelimiter start="\[[^\] \^]"rs=s+1 end="\]" contained

syn match  pmdInlineURL /\(file\|ftp\|http\|https\|mailto\):[-./[:alnum:]_~&@:#%?!=+,]\+/

" Headings
syn region pmdH1       start="^\s*#"                   end="\($\|#\+\)" contains=@Spell
syn region pmdH2       start="^\s*##"                  end="\($\|#\+\)" contains=@Spell
syn region pmdH3       start="^\s*###"                 end="\($\|#\+\)" contains=@Spell
syn region pmdH4       start="^\s*####"                end="\($\|#\+\)" contains=@Spell
syn region pmdH5       start="^\s*#####"               end="\($\|#\+\)" contains=@Spell
syn region pmdH6       start="^\s*######"              end="\($\|#\+\)" contains=@Spell
syn match  pmdH1       /^.\+\n=\+$/ contains=@Spell
syn match  pmdH2       /^.\+\n-\+$/ contains=@Spell

" Math stuff
syn region  pmdMath matchgroup=Delimiter start=/\$[^ ]/rs=s+1 skip=/\\\$/ end=/\$/re=e-1 contains=@pmdMathItems
syn match   pmdMathSymbol /\\[a-z]\+/ contained
syn match   pmdMathCtrl /[_\^{}]/ contained
syn cluster pmdMathItems contains=pmdMathSymbol,pmdMathCtrl
hi link pmdMath       String
hi link pmdMathCtrl   Comment
hi link pmdMathSymbol Keyword

syn cluster pmdNonListItem contains=pmdHyperlinkDef,pmdEmphasis,pmdStrong,pmdMath,pmdInlineURL,pmdLinkDef,pmdLineBreak,pmdBlockquote,pmdCode,pmdIndentCode,pmdListItem,pmdRule,pmdH1,pmdH2,pmdH3,pmdH4,pmdH5,pmdH6

"highlighting for Markdown groups
hi link pmdString         String
hi link pmdCode           String
hi link pmdIndentCode     String
hi link pmdBlockquote     Comment
hi link pmdLineContinue   Comment
hi link pmdListItem       Keyword
hi link pmdRule           Identifier
hi link pmdLineBreak      Todo
hi link pmdLink           String
hi link pmdInlineURL      pmdURL
hi link pmdID             Identifier
hi link pmdLinkDef        pmdID
hi link pmdLinkDefTarget  pmdURL
hi link pmdLinkTitle      pmdString
hi link pmdDelimiter      Delimiter
hi link pmdH1             Title
hi link pmdH2             pmdH1
hi link pmdH3             pmdH2
hi link pmdH4             pmdH3
hi link pmdH5             pmdH4
hi link pmdH6             pmdH5
hi link pmdHead           PreProc
hi link pmdTitle          Title
hi link pmdString         String
hi link pmdEmphasis       Title
hi link pmdStrong         Title
hi link pmdLink           String
hi link pmdURL            Comment

set fo=rnt
setlocal comments=b:*,b:+,b:-

let b:current_syntax = "markdown"
