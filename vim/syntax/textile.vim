"
"   You will have to restart vim for this to take effect.  In any case
"   it is a good idea to read ":he new-filetype" so that you know what
"   is going on, and why the above lines work.
"
"   Written originally by Dominic Mitchell, Jan 2006.
"   happygiraffe.net
"
"   Modified by Aaron Bieber, May 2007.
"   blog.aaronbieber.com
"
"   Modified by Tim Harper, July 2008.
"   tim.theenchanter.com
"   Modified by Amir Kadivar, January 2014.
"
" @(#) $Id$

if version < 600
    syntax clear
elseif exists("b:current_syntax")
    finish
endif

" Textile commands like "h1" are case sensitive, AFAIK.
syn case match

" Textile syntax: <http://textism.com/tools/textile/>

" Inline elements.
syn match txtEmphasis    /_[^_]\+_/
syn match txtBold        /\*[^*]\+\*/
syn match txtCite        /??.\+??/
syn match txtDeleted     /-[^-]\+-/
syn match txtInserted    /+[^+]\++/
syn match txtSuper       /\^[^^]\+\^/
syn match txtSub         /\~[^~]\+\~/
syn match txtSpan        /%[^%]\+%/
syn match txtFootnoteRef /\[[0-9]\+]/
syn match txtCode        /@[^@]\+@/

" Block elements.
syn match txtHeader      /^h1\(([^)]*)\|{[^}]*}\|\[[^]]*\]\|[<>=()]\)*\. .\+/
syn match txtHeader2     /^h2\(([^)]*)\|{[^}]*}\|\[[^]]*\]\|[<>=()]\)*\. .\+/
syn match txtHeader3     /^h3\(([^)]*)\|{[^}]*}\|\[[^]]*\]\|[<>=()]\)*\. .\+/
syn match txtHeader4     /^h[4-6]\(([^)]*)\|{[^}]*}\|\[[^]]*\]\|[<>=()]\)*\..\+/
syn match txtFootnoteDef /^fn[0-9]\+\(([^)]*)\|{[^}]*}\|\[[^]]*\]\|[<>=()]\)*\./
syn match txtListBullet  /\v^\*+ /
syn match txtListBullet2  /\v^(\*\*)+ /
syn match txtListNumber  /\v^#+ /
syn match txtListNumber2  /\v^(##)+ /
syn match txtListNumber3  /\v^(###)+ /

syn region txtCodeblock start="^bc\(([^)]*)\|{[^}]*}\|\[[^]]*\]\|[<>=()]\)*\. " end="^$"
syn region txtPreBlock start="<pre>" end="</pre>"
syn region txtBlockquote start="^bq\(([^)]*)\|{[^}]*}\|\[[^]]*\]\|[<>=()]\)*\. " end="^$"
syn region txtParagraph start="^bq\(([^)]*)\|{[^}]*}\|\[[^]]*\]\|[<>=()]\)*\. " end="^$"


hi link txtHeader Title
hi link txtHeader2 Question
hi link txtHeader3 Statement
hi link txtBlockquote Boolean
hi link txtPreBlock Boolean
hi link txtListBullet function
hi link txtListBullet2 function
hi link txtListNumber keyword
hi link txtListNumber2 function
hi link txtListNumber3 keyword
hi link txtEmphasis special
hi link txtBold matchparen
hi link txtCode character
hi link txtHeader comment
hi link txtHeader2 exception
hi link txtHeader3 comment
hi link txtHeader4 exception
hi link txtBold special
