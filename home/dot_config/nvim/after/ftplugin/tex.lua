-- Setup LaTeX compilation
vim.o.conceallevel=1
vim.g.vimtex_quickfix_mode=0
vim.g.tex_conceal='abdmg'

-- Make VimTeX compiler use a build directory
vim.cmd [[ 
let g:vimtex_compiler_latexmk = {
        \ 'callback' : 1,
        \ 'continuous' : 1,
        \ 'executable' : 'latexmk',
        \ 'hooks' : [],
        \ 'options' : [
        \   '-verbose',
        \   '-file-line-error',
        \   '-synctex=1',
        \   '-interaction=nonstopmode',
        \ ],
        \}
]]

