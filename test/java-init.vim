set nocompatible
set noswapfile
set nobackup
set nowritebackup
let g:coc_config_home = $VIMFILES_ROOT
let g:coc_data_home = $JAVA_TEST_DIR . '/coc'
execute 'set runtimepath^=' . fnameescape($VIMFILES_PLUGIN_DIR . '/coc.nvim')
execute 'set runtimepath+=' . fnameescape($VIMFILES_PLUGIN_DIR . '/coc-java')
filetype plugin indent on
