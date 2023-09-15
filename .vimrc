syntax on
filetype on
filetype plugin on
filetype indent on
set splitright
set noerrorbells
set cindent
set autoread
set hidden
set nu
set smartindent
set noswapfile
set nowrap
set background=dark
set cursorline
set tabstop=4
set shiftwidth=4
set expandtab
set termguicolors
set encoding=utf8
set nolist
silent! call plug#begin()
Plug 'preservim/nerdtree'
Plug 'preservim/tagbar'
Plug 'voldikss/vim-floaterm'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'PhilRunninger/nerdtree-buffer-ops'
Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons'
Plug 'jiangmiao/auto-pairs'
Plug 'ycm-core/YouCompleteMe'
Plug 'rhysd/vim-clang-format'
Plug 'davidhalter/jedi-vim'
Plug 'rhysd/vim-clang-format'
Plug 'ianding1/leetcode.vim'
Plug 'tomasiser/vim-code-dark' 
Plug 'azabiong/vim-highlighter'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf'
Plug 'frenzyexists/aquarium-vim', { 'branch': 'develop' }
Plug 'matze/vim-move'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'kassio/neoterm'
Plug 'preservim/nerdcommenter'
Plug 'itchyny/lightline.vim'
Plug 'kamykn/spelunker.vim'
Plug 'lervag/vimtex'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'lunacookies/vim-colors-xcode'
Plug 'ErichDonGubler/vim-sublime-monokai'
Plug 'sainnhe/gruvbox-material'
Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/edge'
Plug 'karoliskoncevicius/sacredforest-vim'
Plug 'sainnhe/everforest'
Plug 'phanviet/vim-monokai-pro'
Plug 'tpope/vim-fugitive'
Plug 'Mofiqul/vscode.nvim'
Plug 'psf/black', { 'branch': 'stable' }
call plug#end()

colorscheme gruvbox

" Let clangd fully control code completionlet g:ycm_clangd_uses_ycmd_caching = 0
" Use installed clangd, not YCM-bundled clangd which doesn't get updates.
let g:ycm_clangd_binary_path = exepath("clangd")
let g:ycm_clangd_args = ['-log=verbose', '-pretty']
let g:floaterm_keymap_toggle = '<Leader>,'
let mapleader="\<Space>"
set completeopt-=preview
let g:jedi#environment_path = "/usr/bin/python3.10"

" let g:clang_format#code_style = "Microsoft"
let g:clang_format#style_options="~/.clang-format"
" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
autocmd FileType py vnoremap<buffer><Leader>cf :Black<CR>
" if you install vim-operator-user
autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>
autocmd FileType c ClangFormatAutoEnable

" Leetcode Setting
let g:leetcode_browser = "firefox"
let g:leetcode_solution_filetype = 'cpp'

let HiSet   = 'f<CR>'
let HiErase = 'f<BS>'
let HiClear = 'f<C-L>'
let HiFind  = 'f<Tab>'

let g:session_autosave_periodic=1
let g:session_autosave = 'no'

" configuration for nerd tree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
let g:NERDTreeDirArrowExpandable = '->'
let g:NERDTreeDirArrowCollapsible = '...'
" let NERDTreeMapOpenInTab='<ENTER>'
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" For vim-devicons
set encoding=UTF-8


nnoremap <silent> <Leader>F :Files<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>/ :BLines<CR>
nnoremap <silent> <Leader>' :Marks<CR>
nnoremap <silent> <Leader>g :Commits<CR>
nnoremap <silent> <Leader>H :Helptags<CR>
nnoremap <silent> <Leader>hh :History<CR>
nnoremap <silent> <Leader>col :Colors<CR>
nnoremap <silent> <Leader>vspl :vsplit<CR>
nnoremap <silent> <Leader>spl  :split<Cr>
nmap <F3> :TagbarToggle<CR>

nnoremap J :m .+1<CR>==
nnoremap K :m .-2<CR>==
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv:w

set fillchars=vert:\│,eob:.
" On = 1 | Off = 0 (default)
let g:aqua_transparency = 1


set nocompatible
filetype off

let &runtimepath.=',~/.vim/bundle/neoterm'

filetype plugin on
nnoremap <silent> <Leader>tt :T pwd<CR>

let g:session_autload = 'no'

" close all buffers except current one
command! BufCurOnly execute '%bdelete|edit#|bdelete#'

" Close all buffers but current
nnoremap <C-B>c :BufCurOnly<CR>


" for lightline
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

let g:floaterm_wintype='split'
let g:floaterm_position='bottom'
set nospell
" Enable spelunker.vim. (default: 1)
" 1: enable
" 0: disable
let g:enable_spelunker_vim = 1

" Enable spelunker.vim on readonly files or buffer. (default: 0)
" 1: enable
" 0: disable
let g:enable_spelunker_vim_on_readonly = 0

" Check spelling for words longer than set characters. (default: 4)
let g:spelunker_target_min_char_len = 4

" Max amount of word suggestions. (default: 15)
let g:spelunker_max_suggest_words = 15

" Max amount of highlighted words in buffer. (default: 100)
let g:spelunker_max_hi_words_each_buf = 100

" Spellcheck type: (default: 1)
" 1: File is checked for spelling mistakes when opening and saving. This
" may take a bit of time on large files.
" 2: Spellcheck displayed words in buffer. Fast and dynamic. The waiting time
" depends on the setting of CursorHold `set updatetime=1000`.
let g:spelunker_check_type = 1

" Highlight type: (default: 1)
" 1: Highlight all types (SpellBad, SpellCap, SpellRare, SpellLocal).
" 2: Highlight only SpellBad.
" FYI: https://vim-jp.org/vimdoc-en/spell.html#spell-quickstart
let g:spelunker_highlight_type = 1

" Option to disable word checking.
" Disable URI checking. (default: 0)
let g:spelunker_disable_uri_checking = 1

" Disable email-like words checking. (default: 0)
let g:spelunker_disable_email_checking = 1

" Disable account name checking, e.g. @foobar, foobar@. (default: 0)
" NOTE: Spell checking is also disabled for JAVA annotations.
let g:spelunker_disable_account_name_checking = 1

" Disable acronym checking. (default: 0)
let g:spelunker_disable_acronym_checking = 1

" Disable checking words in backtick/backquote. (default: 0)
let g:spelunker_disable_backquoted_checking = 1

" Disable default autogroup. (default: 0)
let g:spelunker_disable_auto_group = 1

" Create own custom autogroup to enable spelunker.vim for specific filetypes.
augroup spelunker
  autocmd!
  " Setting for g:spelunker_check_type = 1:
  autocmd BufWinEnter,BufWritePost *.vim,*.js,*.jsx,*.json,*.md call spelunker#check()

  " Setting for g:spelunker_check_type = 2:
  autocmd CursorHold *.vim,*.js,*.jsx,*.json,*.md call spelunker#check_displayed_words()
augroup END

" Override highlight group name of incorrectly spelled words. (default:
" 'SpelunkerSpellBad')
let g:spelunker_spell_bad_group = 'SpelunkerSpellBad'

" Override highlight group name of complex or compound words. (default:
" 'SpelunkerComplexOrCompoundWord')
let g:spelunker_complex_or_compound_word_group = 'SpelunkerComplexOrCompoundWord'

" Override highlight setting.
highlight SpelunkerSpellBad cterm=underline ctermfg=247 gui=underline guifg=#9e9e9e
highlight SpelunkerComplexOrCompoundWord cterm=underline ctermfg=NONE gui=underline guifg=NONE


command! Formatpyfile execute "!autopep8 --in-place --aggressive --aggressive %"
nnoremap <Leader>py :Formatpyfile<CR>

let g:session_autoload='no'


let g:ycm_enable_semantic_highlighting=1
nnoremap <Leader>SD :YcmShowDetailedDiagnostic <CR>
nnoremap <F1>  :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_enable_inlay_hints=1
let g:ycm_echo_current_diagnostic = 'virtual-text'
let g:ycm_error_symbol = 'E'
let g:ycm_warning_symbol = 'W'
nmap <leader>P <plug>(YCMHover)
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_echo_current_diagnostic = 1
" let g:ycm_update_diagnostics_in_insert_mode=0
let g:ycm_enable_diagnostic_highlighting = 1
let g:ycm_show_diagnostics_ui = 1
" nmap <F2> <Plug>(YCMFindSymbolInWorkspace)
nmap <F2> :YcmCompleter FixIt <CR>
nmap <F3> :YcmCompleter GetDoc <CR>

" vimtex settings
" This is necessary for VimTeX to load properly. The "indent" is optional.
" Note that most plugin managers will do this automatically.
filetype plugin indent on

" This enables Vim's and neovim's syntax-related features. Without this, some
" VimTeX features will not work (see ":help vimtex-requirements" for more
" info).


" Viewer options: One may configure the viewer either by specifying a built-in
" viewer method:
let g:vimtex_view_method = 'zathura'

" Or with a generic interface:
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'

" VimTeX uses latexmk as the default compiler backend. If you use it, which is
" strongly recommended, you probably don't need to configure anything. If you
" want another compiler backend, you can change it as follows. The list of
" supported backends and further explanation is provided in the documentation,
" see ":help vimtex-compiler".
let g:vimtex_compiler_method = 'latexrun'

" Most VimTeX mappings rely on localleader and this can be changed with the
" following line. The default is usually fine and is the symbol "\".
let maplocalleader = '\' 
" nmap <Leader>q= "!zathura -<C-r>=expand('%:r')<cr>.pdf &<cr>"
let g:lightline = {'colorscheme': 'everforest'}
set noshowmode

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
nnoremap UU gUaw
set t_Co=256
set t_ut=
colorscheme codedark

" If you don't like many colors and prefer the conservative style of the standard Visual Studio
let g:codedark_conservative=1
" Activates italicized comments (make sure your terminal supports italics)
let g:codedark_italics=1
" Make the background transparent
" let g:codedark_transparent=1
" If you have vim-airline, you can also enable the provided theme

