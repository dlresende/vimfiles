let b:ale_completion_enabled = 1

let b:ale_linters = {
\ 'java': [ 'eclipselsp' ],
\}

let b:ale_java_eclipselsp_path = '~/.vim/vendor/eclipse.jdt.ls'
" let g:ale_java_pmd_options = 'pmd -R category/java/bestpractices.xml' " pmd installed via brew has a different api: `pmd pmd -R...`
