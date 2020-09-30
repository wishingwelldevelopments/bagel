syntax enable
colorscheme gruvbox

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf'
Plug 'simnalamburt/vim-mundo'
Plug 'elzr/vim-json'
Plug 'pechorin/any-jump.vim'
Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-sleuth'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'leafoftree/vim-vue-plugin'
Plug 'easymotion/vim-easymotion'
Plug 'preservim/nerdtree'
Plug 'mihai-craita/vim-blade'
Plug 'junegunn/fzf.vim'
Plug 'SirVer/ultisnips'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'airblade/vim-gitgutter'
call plug#end()

let mapleader = ";"
let g:loaded_python_provider=0
let g:loaded_ruby_provider = 0
let g:vim_json_syntax_conceal = 0
let g:gruvbox_contrast_dark='hard'
let g:fzf_buffers_jump = 1
let NERDTreeQuitOnOpen=1
let g:gruvbox_invert_selection='0'
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
let g:fzf_layout = { 'down': '~40%' }
let $FZF_DEFAULT_COMMAND = 'ag --hidden -g ""'
let $FZF_DEFAULT_OPTS='--layout=reverse'
let g:fzf_layout = { 'window': 'call FloatingFZF()' }

set number relativenumber
set cursorline
set ignorecase
set ttimeoutlen=0
set nowrap
set hidden
set bg=dark
set spell spelllang=en_us
set nofixeol
set undofile
set undodir=$HOME/.vim/undo
let g:mundo_width = 60
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smartindent
set smartcase

filetype plugin indent on

nnoremap <leader>m :Files<CR>
nmap <leader>p <Plug>(easymotion-bd-f)
nnoremap <leader>T :set invnumber invrelativenumber <bar> :GitGutterToggle<CR>
nnoremap <leader>t :MundoToggle<CR>
nnoremap <leader>f :Lines<CR>
nnoremap <leader>F :Rg<CR>
nnoremap <leader>j :AnyJump<CR>
nnoremap <leader>q :bd<CR>
nnoremap <leader>n :Buffers<CR>
nnoremap <leader>z :NERDTreeToggle<CR>
nnoremap <leader>g :GitGutterPreviewHunk<CR>

vnoremap < <gv
vnoremap > >gv

filetype plugin indent on

function! FloatingFZF()
    let buf = nvim_create_buf(v:false, v:true)
    call setbufvar(buf, '&signcolumn', 'no')

    let height = &lines - 3
    let width = float2nr(&columns - (&columns * 2 / 10))
    let col = float2nr((&columns - width) / 2)

    let opts = {
                \ 'relative': 'editor',
                \ 'row': 1,
                \ 'col': col,
                \ 'width': width,
                \ 'height': height
                \ }

    call nvim_open_win(buf, v:true, opts)
endfunction

autocmd BufNewFile,BufRead *.blade.php set ft=html
autocmd BufNewFile,BufRead *.vue set ft=html
runtime macros/matchit.vim

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
command! Fixwhitespace %s/\s\+$//e
