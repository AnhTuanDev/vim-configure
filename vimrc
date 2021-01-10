"eee-- vim ------
"call pathogen#infect()
"syntax enable
syntax on
filetype plugin indent on


set encoding=UTF-8

set laststatus=2

"set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ 11

let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1


"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

let g:one_allow_italics = 1
"colorscheme nord
colorscheme one
set background=dark
let g:airline_theme='one'

" On pressing tab, insert 2 spaces
set expandtab

let mapleader = " "
" show existing tab with 2 spaces width
set tabstop=4
set softtabstop=4
" when indenting with '>', use 2 spaces width
set shiftwidth=4

" set default no wrap
set nowrap
" set default number
set number

"TextEdit có thể không thành công nếu ẩn không được đặt.
set hidden

"Cung cấp thêm không gian để hiển thị tin nhắn.
set cmdheight=2

"delays and poor user experience.
set updatetime=300

" Dart-vim-plugin config.
"let g:dart_style_guide = 2
let g:dart_format_on_save = 1


" _____Set map key ______
" _______________________
let mapleader=" "

nmap <leader>nu :set number! <CR>

nmap <leader>wr :set wrap! <CR>

nmap <leader>fth :set filetype=html <CR>
nmap <leader>ftp :set filetype=php <CR>
nmap <leader>ftj :set filetype=javascript<CR>

"move current line to up
nmap <leader>mk :m . -2<CR> ==
"move current line to down
nmap <leader>mj :m . 1<CR> ==

"move current tab to 1
noremap <A-Left>  :-tabmove<cr>
"move current tab back 1
noremap <A-Right> :+tabmove<cr>

"______ netrw _______
"let g:netrw_liststyle = 3
"Loại bỏ các biểu ngữ
let g:netrw_banner = 0
"let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+,\(^\|\s\s\)ntuser\.\S\+'
autocmd FileType netrw set nolist

"---- FZF config ----
set rtp+=~/.fzf
nmap <leader>bb :Buffers <CR>
nmap <leader>ff :Files <CR>
nmap <leader>hh :History <CR>
nmap <leader>hc :History: <CR>
nmap <leader>hs :History/ <CR>
nmap <leader>tb :tabe 
nmap <leader>ft :Filetypes <CR>
nmap <leader>li :Lines <CR> 
nmap <leader>bli :BLines <CR> 
nmap <leader>tg :Tags 
nmap <leader>ag :Ag 


let g:fzf_layout = { 'window': { 'width': 1, 'height': 0.4, 'yoffset': 1, 'border': 'horizontal' } }

" Empty value to disable preview window altogether
"let g:fzf_preview_window = ''
" Always enable preview window on the right with 60% width
let g:fzf_preview_window = 'right:50%'

"--------Plugin-------
"Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_solarized_bg='dark'
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
"custom top tabline
let g:airline#extensions#tabline#enabled = 1           " enable airline tabline                                                           
let g:airline#extensions#tabline#show_close_button = 0 " remove 'X' at the end of the tabline                                            
let g:airline#extensions#tabline#tabs_label = ''       " can put text here like BUFFERS to denote buffers (I clear it so nothing is shown)
let g:airline#extensions#tabline#buffers_label = ''    " can put text here like TABS to denote tabs (I clear it so nothing is shown)      
let g:airline#extensions#tabline#fnamemod = ':t'       " disable file paths in the tab                                                    
"let g:airline#extensions#tabline#show_tab_count = 0    " dont show tab numbers on the right                                                           
let g:airline#extensions#tabline#show_buffers = 0      " dont show buffers in the tabline                                                 
let g:airline#extensions#tabline#tab_min_count = 2     " minimum of 2 tabs needed to display the tabline                                  
let g:airline#extensions#tabline#show_splits = 0       " disables the buffer name that displays on the right of the tabline               
let g:airline#extensions#tabline#show_tab_nr = 0       " disable tab numbers                                                              
let g:airline#extensions#tabline#show_tab_type = 0     " disables the weird ornage arrow on the tabline

"____identation____
nmap <leader>id :IndentLinesToggle<CR>
"let g:indentLine_setColors = 0
"let g:indentLine_color_term = 239
"let g:indentLine_bgcolor_term = 'dark' 
let g:indentLine_char = '┊'

"emit auto tag html
"let g:user_emmet_leader_key='<C-z>'

"Lightline
let g:lightline = {
      \ 'colorscheme': 'one',
      \ }
"translate-shell
"let g:trans_bin = 
"

"NERDTree.
nmap <C-n> :NERDTreeToggle <CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") && v:this_session == "" | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeWinSize=20
"let g:Tlist_WinWidth=20
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

let g:NERDTreeGitStatusUseNerdFonts = 1 

"Vim vue
"
let g:vue_pre_processors = 'detect_on_enter'
