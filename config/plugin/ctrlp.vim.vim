" Check :help ctrlp-options for other options.

" Set its local working directory:
" 'c' - the directory of the current file.
" 'a' - the directory of the current file, unless it is a subdirectory of the cwd
" 'r' - the nearest ancestor of the current file that contains one of these directories or files: .git .hg .svn .bzr _darcs
" 'w' - modifier to "r": start search from the cwd instead of the current file's directory
" 0 or '' (empty string) - disable this feature.
let g:ctrlp_working_path_mode = 'ra'

" In addition to .git .hg .svn .bzr _darcs
let g:ctrlp_root_markers = ['pom.xml', '.p4ignore']

" Exclude files and directories
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|class)$',
  \ 'link': '',
  \ }

" Use a custom file listing command
let g:ctrlp_user_command = 'find %s -type f'

" Ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
