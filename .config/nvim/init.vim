call plug#begin('~/.vim/plugged')
    Plug 'davidhalter/jedi-vim'
    Plug 'ncm2/ncm2'
    Plug 'roxma/nvim-yarp'
    Plug 'ncm2/ncm2-bufword'
    Plug 'ncm2/ncm2-path'
    Plug 'ncm2/ncm2-jedi'
    " Plug 'habamax/vim-sendtoterm'
    Plug 'dense-analysis/ale'
    Plug 'Chiel92/vim-autoformat'
    Plug 'jpalardy/vim-slime'
    Plug 'morhetz/gruvbox'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
call plug#end()

" let g:python3_host_prog="$HOME/anaconda3/bin/python3.7"
let g:python3_host_prog="/bin/python3.8"

" ::::::::::::::::::::::::::::::::::::::::::::::::::::::
" Slime Configurations
" ::::::::::::::::::::::::::::::::::::::::::::::::::::::
let g:slime_target="tmux"
let g:slime_default_config={"socket_name": get(split($TMUX, ","), 0), "target_pane": ":.2"}
"# let g:slime_default_config={"socket_name": get(split($TMUX, ","), 0), "target_pane": ":.1"}
" let g:slime_default_config = {"socket_name": "default", "target_pane": "{right-of}"}
let g:slime_paste_file="$HOME/.slime_paste"
let g:slime_dont_ask_default=1
let g:slime_python_ipython = 1
nmap <C-i> <Plug>SlimeLineSend
nmap <C-q> <Plug>SlimeParagraphSend
xmap <C-i> <Plug>SlimeRegionSend

" ::::::::::::::::::::::::::::::::::::::::::::::::::::::
" Airline Configurations
" ::::::::::::::::::::::::::::::::::::::::::::::::::::::
let g:airline_theme='gruvbox'
let g:airline#extensions#tabline#enabled = 1

" ::::::::::::::::::::::::::::::::::::::::::::::::::::::
" Jedi-Vim Configurations
" ::::::::::::::::::::::::::::::::::::::::::::::::::::::
let g:jedi#completions_command = "<C-l>"
let g:jedi#goto_stubs_command = ""
" let g:jedi#use_splits_not_buffers = "right"
let g:jedi#use_splits_not_buffers = "bottom"
let g:jedi#auto_initialization = 1
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#popup_on_dot = 0
let g:jedi#completions_command = ""
let g:jedi#show_call_signatures = "1"
let g:jedi#show_call_signatures_delay = 0
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#show_call_signatures_modes = 'i'
let g:jedi#enable_speed_debugging=0

" ::::::::::::::::::::::::::::::::::::::::::::::::::::::
" ncm2 Configurations
" ::::::::::::::::::::::::::::::::::::::::::::::::::::::
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
set shortmess+=c
let ncm2#popup_delay = 5
let ncm2#complete_length = [[1, 1]]
let ncm2#total_popup_limit = 25
let g:ncm2#matcher = 'substrfuzzy'
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
let g:ncm2_jedi#python_version = 3

" ::::::::::::::::::::::::::::::::::::::::::::::::::::::
" Ale Configurations
" ::::::::::::::::::::::::::::::::::::::::::::::::::::::
" let g:ale_linters = {'python': ['flake8', 'pylint']}
let g:ale_linters = {'python': ['flake8'], 'tex': ['']}
"let g:ale_linters_explicit = 1
"let g:airline#extensions#ale#enabled = 1
"let g:ale_echo_msg_error_str = 'E'
"let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_save = 1
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0
let g:ale_sign_column_always = 1

" :::::::::::::::::::::::::::::::::::::::::::::::::::::::
" Vim Autoformat
" ::::::::::::::::::::::::::::::::::::::::::::::::::::::
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0
let g:formatters_vue = ['autopep8']
let g:run_all_formatters_vue = 1

" :::::::::::::::::::::::::::::::::::::::::::::::::::::::
" My NVIM/VIM configurations
" ::::::::::::::::::::::::::::::::::::::::::::::::::::::
set bg=dark
set runtimepath+=~/.config/nvim/
source ~/.config/nvim/maps.vim
colorscheme gruv
" Next two lines allow for opacity to be different
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE
nnoremap <leader>au :Autoformat<Enter>
" autocmd FileType text nnoremap <leader>q :!git add % && git commit % -m "Added Entry" -q && git push -q & <Enter><Enter>:wq<Enter>
" autocmd ExitPre *.txt :!git add % && git commit % -m "Added Entry" -q && git push -q &
" autocmd ExitPre *.gpg :!git add % && git commit % -m "Added Entry" -q && git push -q &
autocmd FileType text let b:ncm2_look_enabled = 1
