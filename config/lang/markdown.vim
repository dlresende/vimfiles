" vim-markdown {{{
	let g:vim_markdown_no_default_key_mappings   = 1 " disable default key mappings
	let g:vim_markdown_folding_disabled          = 1 " disable the folding configuration
	let g:vim_markdown_folding_level             = 1 " Folding level is a number between 1 and 6
	let g:vim_markdown_folding_style_pythonic    = 0 " fold in a style like python-mode
	let g:vim_markdown_override_foldtext         = 1 " prevent foldtext from being set add
	let g:vim_markdown_toc_autofit               = 1 " Allow for the TOC window to auto-fit when it's possible for it to shrink
	let g:vim_markdown_conceal                   = 0 " disable conceal regardless of conceallevel setting
  let g:vim_markdown_folding_disabled          = 1 " disable folding
  let g:vim_markdown_edit_url_in               = 'current' " how to open new files ('tab', 'vsplit', 'hsplit', 'current')
  let g:vim_markdown_auto_insert_bullets       = 0 " Do not automatically insert bulletpoints
  let g:vim_markdown_new_list_item_indent      = 0 " set the new list item indent
  let g:vim_markdown_auto_extension_ext        = 'md' " Change default file extension
  let g:vim_markdown_autowrite                 = 0 " Auto-write when following link
  let g:vim_markdown_no_extensions_in_markdown = 0 " Do not require .md extensions for Markdown links
	let g:vim_markdown_follow_anchor             = 0 " allows the ge command to follow named anchors in links of the form file#anchor or just #anchor
	let g:vim_markdown_fenced_languages          = ['c++ = cpp', 'viml = vim', 'bash = sh', 'ini = dosini'] " use filetype name as fenced code block languages for syntax highlighting
	let g:vim_markdown_emphasis_multiline        = 0 " restrict text emphasis to a single line
" }}}

augroup vimfiles_markdown
  autocmd!
augroup END
