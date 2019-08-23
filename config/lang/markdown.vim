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

" markdown-preview.nvim {{{
  " set to 1, the nvim will open the preview window once enter the markdown buffer
  " default: 0
  let g:mkdp_auto_start = 0

  " set to 1, the nvim will auto close current preview window when change
  " from markdown buffer to another buffer
  " default: 1
  let g:mkdp_auto_close = 1

  " set to 1, the vim will just refresh markdown when save the buffer or
  " leave from insert mode, default 0 is auto refresh markdown as you edit or
  " move the cursor
  " default: 0
  let g:mkdp_refresh_slow = 0

  " set to 1, the MarkdownPreview command can be use for all files,
  " by default it just can be use in markdown file
  " default: 0
  let g:mkdp_command_for_global = 1

  " set to 1, preview server available to others in your network
  " by default, the server only listens on localhost (127.0.0.1)
  " default: 0
  let g:mkdp_open_to_the_world = 0

  " use custom IP to open preview page
  " useful when you work in remote vim and preview on local browser
  " more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
  " default empty
  let g:mkdp_open_ip = ''

  " specify browser to open preview page
  " default: ''
  let g:mkdp_browser = ''

  " set to 1, echo preview page url in command line when open preview page
  " default is 0
  let g:mkdp_echo_preview_url = 0

  " a custom vim function name to open preview page
  " this function will receive url as param
  " default is empty
  let g:mkdp_browserfunc = ''

  " options for markdown render
  " mkit: markdown-it options for render
  " katex: katex options for math
  " uml: markdown-it-plantuml options
  " maid: mermaid options
  " disable_sync_scroll: if disable sync scroll, default 0
  " sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
  "   middle: mean the cursor position alway show at the middle of the preview page
  "   top: mean the vim top viewport alway show at the top of the preview page
  "   relative: mean the cursor position alway show at the relative positon of the preview page
  let g:mkdp_preview_options = {
      \ 'mkit': {},
      \ 'katex': {},
      \ 'uml': {},
      \ 'maid': {},
      \ 'disable_sync_scroll': 0,
      \ 'sync_scroll_type': 'middle'
      \ }

  " use a custom markdown style must be absolute path
  let g:mkdp_markdown_css = ''

  " use a custom highlight style must absolute path
  let g:mkdp_highlight_css = ''

  " use a custom port to start server or random for empty
  let g:mkdp_port = ''
" }}}

augroup vimfiles_markdown
  autocmd!
augroup END
