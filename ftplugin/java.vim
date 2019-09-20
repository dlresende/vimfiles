let g:ale_linters = {
\ 'java': [ 'javac', 'checkstyle', 'pmd'],
\}
let g:ale_java_pmd_options = 'pmd -R category/java/bestpractices.xml' " pmd installed via brew has a different api: `pmd pmd -R...`
