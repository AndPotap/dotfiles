call plug#begin('~/.vim/plugged')
    Plug 'davidhalter/jedi-vim'
    Plug 'ncm2/ncm2'
    Plug 'ncm2/ncm2-bufword'
    Plug 'ncm2/ncm2-path'
    Plug 'ncm2/ncm2-jedi'
    Plug 'roxma/nvim-yarp'
    Plug 'dense-analysis/ale'
    Plug 'vim-autoformat/vim-autoformat'
    Plug 'jpalardy/vim-slime'
    Plug 'morhetz/gruvbox'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
call plug#end()

let g:python3_host_prog=expand("$NVIMPY")

" ::::::::::::::::::::::::::::::::::::::::::::::::::::::
" Slime
" ::::::::::::::::::::::::::::::::::::::::::::::::::::::
let g:slime_target="tmux"
" let g:slime_default_config={"socket_name": get(split($TMUX, ","), 0), "target_pane": ":.2"}
let g:slime_default_config={"socket_name": "default", "target_pane": "{last}"}
let g:slime_paste_file="$HOME/.slime_paste"
let g:slime_dont_ask_default=1
let g:slime_python_ipython = 1
nmap <C-i> <Plug>SlimeLineSend
nmap <C-q> <Plug>SlimeParagraphSend
xmap <C-i> <Plug>SlimeRegionSend

" ::::::::::::::::::::::::::::::::::::::::::::::::::::::
" Airline
" ::::::::::::::::::::::::::::::::::::::::::::::::::::::
let g:airline_theme='gruvbox'
let g:airline#extensions#tabline#enabled = 1

" ::::::::::::::::::::::::::::::::::::::::::::::::::::::
" Jedi-Vim
" ::::::::::::::::::::::::::::::::::::::::::::::::::::::
" Uses: Function signatures, go to def, rename
"     Jedi reads the function signatures from its python version
" Defaults: https://github.com/davidhalter/jedi-vim/blob/master/autoload/jedi.vim
"     Almost a complete list of defaults above.
" let g:jedi#environment_path = '/usr/bin/python3'
"     Might need to enable in case I'm using other python3
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#rename_command = "<leader>r"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#completions_enabled = 0
let g:jedi#auto_initialization = 1
let g:jedi#auto_vim_configuration = 0
let g:jedi#show_call_signatures = 1
let g:jedi#show_call_signatures_delay = 0
let g:jedi#show_call_signatures_modes = 'i'
let g:jedi#goto_stubs_command = ""
let g:jedi#use_splits_not_buffers = "bottom"
let g:jedi#smart_auto_mappings = 0
let g:jedi#popup_on_dot = 0
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#enable_speed_debugging=0

" ::::::::::::::::::::::::::::::::::::::::::::::::::::::
" ncm2
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
autocmd FileType text let b:ncm2_look_enabled = 1

" ::::::::::::::::::::::::::::::::::::::::::::::::::::::
" Ale
" ::::::::::::::::::::::::::::::::::::::::::::::::::::::
" let g:ale_linters = {'python': ['flake8', 'pylint']}
let g:ale_linters = {'python': ['flake8'], 'tex': ['']}
"let g:ale_linters_explicit = 1
"let g:airline#extensions#ale#enabled = 1
"let g:ale_echo_msg_error_str = 'E'
"let g:ale_echo_msg_warning_str = 'W'
let g:ale_python_flake8_options = '--max-line-length=99'
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
let g:autoformat_remove_trailing_spaces = 1
" let g:formatters_vue = ['autopep8', 'flake8']
let g:formatters_vue = ['yapf']
let g:run_all_formatters_vue = 1
let g:formatter_yapf_style = 'pep8'
nnoremap <leader>au :Autoformat<Enter>

" :::::::::::::::::::::::::::::::::::::::::::::::::::::::
" My NVIM/VIM
" ::::::::::::::::::::::::::::::::::::::::::::::::::::::
set bg=dark
set runtimepath+=~/.config/nvim/
source ~/.config/nvim/maps.vim
colorscheme gruv
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE
