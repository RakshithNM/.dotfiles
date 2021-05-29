set rtp+=/usr/local/opt/fzf
call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Yggdroot/indentLine'                                                      " indent line
Plug 'luochen1990/rainbow'                                                      " different level highlight
Plug 'RRethy/vim-illuminate'                                                    " automatically highlight other uses of the current word
Plug 'machakann/vim-highlightedyank'                                            " make the yanked region apparent
Plug 'gregsexton/MatchTag'                                                      " highlight matching tag
Plug 'pangloss/vim-javascript'                                                  " syntax highlighting
Plug 'haishanh/night-owl.vim'
Plug 'mattn/emmet-vim'
Plug 'preservim/nerdcommenter'
Plug 'mariappan/dragvisuals.vim'
Plug 'voldikss/vim-floaterm'
call plug#end()

" Customize the netrw window
let g:netrw_liststyle=3
let g:netrw_banner=0
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'

set nocompatible
set path+=**  " search down the sub folders
set number
set relativenumber
set nocursorline
set showcmd
set ruler
set cmdheight=2
set showmode
set ignorecase
set smartcase
set hlsearch
set incsearch
set showmatch
set noerrorbells
set novisualbell
set t_vb=
set tm=500
set nobackup
set nowb
set noswapfile
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set nofoldenable
set foldlevelstart=3
set foldmethod=indent
set foldnestmax=10
set wildmenu
set clipboard=unnamed
set autoindent
set copyindent
set updatetime=300
set hidden
set lazyredraw
set autoread
set gdefault
" set textwidth=80
" set colorcolumn=+1

" Make the keyboard faaaaaaast
set ttyfast
set timeout timeoutlen=1000 ttimeoutlen=50
"show whitespace and other unwanted characters
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
set list

" Show the number of search pattern matches
set shortmess-=S

" Autocomplete CSS classes etc with dashes also changes the 'w' small word
" motion to not stop at dashes, search under cursor also works
set iskeyword+=-

set t_co=16
if (has("termguicolors"))
  set termguicolors
endif
colorscheme night-owl
filetype on
filetype indent on
filetype plugin on

" Transparent BG
hi Normal guibg=NONE ctermbg=NONE
hi clear LineNr
hi clear SignColumn

autocmd BufWritePre * redraw!
" syntax synchronization - for somefiles that syntax highlighting doesnt work
autocmd BufEnter * :syntax sync fromstart

" treat ejs files as html
augroup filetype_html
  autocmd!
  autocmd bufread,bufnew *.ejs set filetype=html
augroup end

" Start at last place you were editing
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Key bindings for pop ups
nnoremap <silent> <C-p> :FZF<CR>
nnoremap <silent> <C-f> :Rg<CR>
nnoremap <silent> lg :FloatermNew --height=1.0 --width=1.0 --name=lazygit lazygit<CR>

" F7 to run current js file in the node env
nnoremap <F7> :w !node<CR>

" \<space> to turn off search highlight
nnoremap <leader><space> :nohls<CR>
" <F4> to highlight all trailing whitespace
nnoremap <F4> /\s\+$//e<CR>
" <F5> to remove all trailing whitespace
nnoremap <F5> :%s/\s\+$//e<CR>

" Move vertically by visual line, doesnot skip line broken into two
nnoremap j gj
nnoremap k gk

" Try to prevent bad habits like using the arrow keys for movement. This is
" not the only possible bad habit. For example, holding down the h/j/k/l keys
" for movement, rather than using more efficient movement commands, is also a
" bad habit. The former is enforceable through a .vimrc, while we don't know
" how to prevent the latter.
" Do this in normal mode...
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>

nnoremap <silent> <leader>= :vertical resize +50<CR>
nnoremap <silent> <leader>- :vertical resize -50<CR>

" Easy vsplit
nnoremap <silent> vv :vsp<CR>

" Open terminal
nnoremap <silent> vrt :vertical rightbelow terminal<CR>

" Use a macro to add double quotes around words
nmap sw bi"jkea"jk

inoremap jk <esc>
vnoremap jk <esc>

" ...and in insert mode
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>

" Automatic } closign flower brackets
autocmd FileType go inoremap { {<CR>}<ESC>ko
" Automatic ) closign brackets
inoremap ( ()<ESC>i

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Setting for rainbow plugin
let g:rainbow_active=1

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Mappings for dragvisuals plugin
vmap <expr> H DVB_Drag('left')
vmap <expr> L DVB_Drag('right')
vmap <expr> J DVB_Drag('down')
vmap <expr> K DVB_Drag('up')
vmap <expr> D DVB_Duplicate()
" Remove any introduced trailing whitespace after moving...
let g:DVB_TrimWS = 1

" Closing the floaterm popup(for example using q in lazygit) autocloses the popup
let g:floaterm_autoclose=1
