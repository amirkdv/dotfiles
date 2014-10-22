" Vim syntax file
" Language: codex
" By: Amir Kadivar

" basic syntax is yaml
runtime! syntax/yaml.vim

" Embedded pandoc markdown
runtime! syntax/yaml.vim
let b:current_syntax = ''
unlet b:current_syntax
syn include @markdown syntax/markdown.vim
let b:current_syntax = ''
unlet b:current_syntax
syn region pmdBlock start=/^\z\(\s\+\)::pmd\n/ skip=/^\s*$/ end=/^\z1\@!/ keepend containedin=yamlLiteralBlock contains=@markdown

hi link yamlKey     String
hi link yamlBlock   Delimiter
hi link yamlString  Normal
