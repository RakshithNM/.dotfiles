set rtp+=/usr/local/opt/fzf
call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Yggdroot/indentLine'
Plug 'luochen1990/rainbow'
Plug 'RRethy/vim-illuminate'
Plug 'machakann/vim-highlightedyank'
Plug 'gregsexton/MatchTag'
Plug 'jonsmithers/vim-html-template-literals'
Plug 'pangloss/vim-javascript'
Plug 'mattn/emmet-vim'
Plug 'preservim/nerdcommenter'
Plug 'mariappan/dragvisuals.vim'
Plug 'voldikss/vim-floaterm'
Plug 'zivyangll/git-blame.vim'
Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-surround'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'unblevable/quick-scope'
Plug 'dyng/ctrlsf.vim'
Plug 'mhinz/vim-startify'
call plug#end()

" Customize the netrw window
let g:netrw_liststyle=3
let g:netrw_banner=0
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'

set nocompatible                                                                                   " vim improved
set path+=**                                                                                       " search down the sub folders
set number                                                                                         " show numbers
set relativenumber                                                                                 " show relativenumber
set nocursorcolumn                                                                                 " speed up syntax highlight
set nocursorline                                                                                   " no show of cursorline - for performance
set showcmd                                                                                        " show the command being typed
set ruler                                                                                          " show the line and column number
set cmdheight=2                                                                                    " number of lines used for command-line
set ignorecase                                                                                     " ignore case of normal letters
set nosmartcase                                                                                    " matches case insensively when ignorecase is on
set hlsearch                                                                                       " highlight all matches when there is search
set incsearch                                                                                      " highlight the match as typed
set showmatch                                                                                      " when bracket inserted, briefly jump to the match
set noerrorbells                                                                                   " no beeps
set visualbell t_vb=                                                                               " no visual bells
set tm=500
set nobackup                                                                                       " no backup before overwriting a file
set nowb                                                                                           " no backup before overwriting a file
set noswapfile                                                                                     " dont use swap file
set expandtab                                                                                      " use spaces to insert tab
set shiftwidth=2                                                                                   " number of spaces to use for each step of autoindent
set tabstop=2                                                                                      " number of spaces tab counts for in a file
set autoindent                                                                                     " copy indent from current line when starting a new one
set softtabstop=2                                                                                  " number of spaces tab counts for while inserting
set nofoldenable                                                                                   " no folding
set wildmenu                                                                                       " tab completion in command line mode
set clipboard=unnamed                                                                              " copy to system clipboard
set copyindent                                                                                     " copy the indent of existing lines to autoindent new line
set updatetime=300                                                                                 " default is 4000ms - leads to delays
set hidden                                                                                         " buffer hidden when abandoned
set lazyredraw                                                                                     " no redraw when execution commands
set autoread                                                                                       " autoread files that has been changed outside vim
set gdefault                                                                                       " g is default on in subsitite command
set ttyfast                                                                                        " make vim fast
set timeout timeoutlen=1000 ttimeoutlen=50                                                         " time for the mapped keycode to complete
" exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
" set list                                                                                           " show whitespace and other unwanted characters
set nrformats=                                                                                     " treat numerals as decimals not the default octal
set shortmess-=S                                                                                   " show the number of search matches
set iskeyword+=-                                                                                   " autocomplete CSS classes etc with dashes also changes the 'w' small word motion to not stop at dashes, search under cursor also works
set t_co=16                                                                                        " number of terminal colors
if (has("termguicolors"))
  set termguicolors                                                                                " use highlight-guifg and highlight-guibg attribute in terminal
endif

filetype on                                                                                        " filetype detection
filetype indent on                                                                                 " filetype indent on
filetype plugin on                                                                                 " filetype plugin on

" Transparent BG
hi Normal guibg=NONE ctermbg=NONE
hi clear LineNr
hi clear SignColumn
" Change color of the visual selection
hi Visual guifg=NONE guibg=#0f00f0 gui=NONE
" Set floaterm window's background to transparent
hi Floaterm guibg=NONE ctermbg=NONE
hi FloatermBorder guibg=NONE guifg=cyan
" Change color of the coc popup
hi CocHintFloat ctermfg=Red  guifg=#ff0000 ctermbg=Black
hi Pmenu ctermbg=Black guifg=#00ffff guibg=Black
hi PmenuSel guifg=Black guibg=#00ffff

if has("autocmd")
  augroup redraw_syntax
    autocmd!
    autocmd BufWritePre * redraw!
    " syntax synchronization - for somefiles that syntax highlighting doesnt work
    autocmd BufEnter * :syntax sync fromstart
  augroup end
endif

" treat ejs files as html
if has("autocmd")
  augroup filetype_html
    autocmd!
    autocmd bufread,bufnew *.ejs set filetype=html
  augroup end
endif

if has("autocmd")
  augroup save_location
    autocmd!
    " Start at last place you were editing
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  augroup end
endif

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  silent! %s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfun

if has("autocmd")
  augroup clean_spaces
    autocmd!
    autocmd BufWritePre *.txt,*.js,*.ts,*.md,*.sh,*.go,*.ejs,*.scss,*.cpp,*.h :call CleanExtraSpaces()
  augroup end
endif

if has("autocmd")
  augroup tab_customisation
    autocmd FileType cpp set tabstop=4 shiftwidth=4 softtabstop=0 noexpandtab
    autocmd FileType go set tabstop=4 shiftwidth=4 softtabstop=0 noexpandtab
  augroup end
endif

" Better ripgrep
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

" RG command to open ripgrep
command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" Key bindings for pop ups
nnoremap <silent> <C-p> :FZF<CR>
nnoremap <silent> <C-f> :RG<CR>
nnoremap <silent> lg :FloatermNew --height=1.0 --width=0.99 --name=lazygit lazygit<CR>
nnoremap <silent> term :FloatermNew --wintype=popup --height=1.0 --width=0.99 --name=terminal<CR>

" F7 to run current js file in the node env
nnoremap <F7> :w !node<CR>
" F8 to run current go file
nnoremap <F8> :w !go run %<CR>
" \<space> to turn off search highlight
nnoremap <leader><space> :nohls<CR>
" <F4> to highlight all trailing whitespace
nnoremap <F4> /\s\+$//e<CR>
" <F5> to remove all trailing whitespace
nnoremap <F5> :%s/\s\+$//e<CR>

" Move vertically by visual line, doesnot skip line broken into two
nnoremap j gj
nnoremap k gk

" Make Y behave like all other capital letters
nnoremap Y y$

" Center and open and folds when doing incsearch
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Undo breakpoints
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap <space> <space><c-g>u

" Visual select word under cursor
nnoremap <space> viw

" Try to prevent bad habits like using the arrow keys for movement. This is
" for movement, rather than using more efficient movement commands, is also a
" bad habit. The former is enforceable through a .vimrc, while we don't know
" how to prevent the latter.
" Do this in normal mode...
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>

" mappings for resizing
nnoremap <silent> <leader>= :vertical resize +50<CR>
nnoremap <silent> <leader>- :vertical resize -50<CR>

" Easy vsplit
nnoremap <silent> vv :vsp<CR>

" Select all
nnoremap <leader>a ggVG"

" Open terminal
nnoremap <silent> vrt :vertical rightbelow terminal<CR>

" Leader L to automatically put word under cursor in a console.log
nnoremap <Leader>L "ayiwoconsole.log({<C-R>a});<Esc>

" git blame in command line
nnoremap <Leader>gb :<C-u>call gitblame#echo()<CR>

" surround word under cursor with double/single quotes
:nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
:nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel

" Open CtrlSF prompt
nnoremap <C-S> <Plug>CtrlSFPrompt

" Move focus to CtrlSF prompt on start searching
let g:ctrlsf_auto_focus = {
    \ "at": "start"
    \ }

" Tab and Shift-Tab to indent and de-indent
nmap >> <Nop>
nmap << <Nop>
vmap >> <Nop>
vmap << <Nop>
nnoremap <Tab>   >>
nnoremap <S-Tab> <<
vnoremap <Tab>   >><Esc>gv
vnoremap <S-Tab> <<<Esc>gv

" Prevent bad habits of using arrow keys
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>
inoremap ;; <ESC>A;<ESC>

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

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" GoTo code navigation.
nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gy <Plug>(coc-type-definition)
nnoremap <silent> gi <Plug>(coc-implementation)
nnoremap <silent> gr <Plug>(coc-references)

" Do not show the q: window
map q: :q

" Setting for rainbow plugin
let g:rainbow_active=1

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Mappings for dragvisuals plugin
vnoremap <expr> H DVB_Drag('left')
vnoremap <expr> L DVB_Drag('right')
vnoremap <expr> J DVB_Drag('down')
vnoremap <expr> K DVB_Drag('up')
vnoremap <expr> D DVB_Duplicate()
" Remove any introduced trailing whitespace after moving...
let g:DVB_TrimWS = 1

" Closing the floaterm popup(for example using q in lazygit) autocloses the popup
let g:floaterm_autoclose=1

" Mark trailing spaces as errors
match ErrorMsg '\s\+$'

let g:vimwiki_url_maxsave=0

" Change in the parameters from anywhere in the line
onoremap in( :<c-u>normal! f(vi(<cr>

let g:javascript_plugin_flow = 1
