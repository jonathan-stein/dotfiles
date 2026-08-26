
" --------------------------------------------------
" Plugins
" --------------------------------------------------
call plug#begin()

Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'prabirshrestha/vim-lsp'

call plug#end()

" --------------------------------------------------
" LSP
" --------------------------------------------------

if executable('clangd')
    augroup lsp_clangd
        autocmd!
        autocmd User lsp_setup call lsp#register_server({
            \ 'name': 'clangd',
            \ 'cmd': {server_info->['clangd', '--background-index']},
            \ 'allowlist': ['c', 'cpp', 'objc', 'objcpp'],
            \ })
    augroup END
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal signcolumn=yes

    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> K <plug>(lsp-hover)
    nmap <buffer> <leader>rn <plug>(lsp-rename)

    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
endfunction

augroup lsp_buffer_config
    autocmd!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" Filetypes
filetype plugin indent on

" Syntax highlighting
syntax on

" Line numbers
set number
set relativenumber

" Search
set ignorecase
set smartcase
set hlsearch
set incsearch

