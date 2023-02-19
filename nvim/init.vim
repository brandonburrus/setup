
if &compatible
  set nocompatible
endif

" ==== General Config ================================================================================= "

set encoding=utf-8                    " Use UTF-8 encoding in buffers
filetype plugin indent on

syntax on                             " Enable syntax highlighting
colorscheme neonchalk                 " Set colorscheme

set autoindent                        " Use the previous lines indentation when adding new lines
set expandtab                         " Use spaces instead of tabs
set smarttab                          " Insert the appropriate number of tabs when indenting
set tabstop=2                         " Use 2 spaces as the tab stop for buffers
set softtabstop=2                     " Count 2 spaces as a tab when editing indentation
set shiftwidth=2                      " Use 2 spaces be default for automatic indentation

set hlsearch                          " Highlight search matches
set incsearch                         " Show partial matches while entering a search
set smartcase                         " Smartly ignore case sensitivity when searching

set number                            " Enable line numbers
set numberwidth=4                     " Use 4 character columns for line numbers
set relativenumber                    " Enable relative line numbers

set splitbelow                        " Horizontal splits always open below the current buffer
set splitright                        " Vertical splits always open on the right of the current buffer

set undofile                          " Enable undo persistence via undo files
set undodir=~/.config/nvim/undodir    " Directory to use for persisting undo history
set undolevels=10000                  " Number of changes to remember that can be undone

set guicursor+=a:blinkon0             " Disable cursor blinking
set guioptions=                       " Reset to the default gui options
set nocursorline                      " Disable adding highlight group to the line the cursor is on
set laststatus=0                      " Disable the status line

set completeopt+=preview              " Show extra preview info in auto-complete menu
set wildmenu                          " Enable auto-complete menu

set autoread                          " Auto-detect file changes outside of vim
set nobackup                          " Disable backup file when overwriting an existing file
set nowrap                            " Disable line wrapping
set scrolloff=0                       " How many lines can the screen scroll beyond the last line in the buffer
set hidden                            " Allow buffers with unsaved changes to exist in the background
set modelines=1                       " Enable modelines on the last line of a buffer

set belloff=all                       " Turn off the notification sound for everything
set noerrorbells                      " Disable error bell for editor errors/warnings
set novisualbell                      " Disable visual (flashing) bell for notifications

set foldignore=                       " Turn off any fold ignoring
set foldlevelstart=99                 " Start auto-folding at the given indentation level
set foldmethod=indent                 " Use indentation to auto-create folds

set cmdheight=1                       " Use a single line for Ex commands
set shell=/bin/zsh                    " Use Zsh as the preferred shell
set shortmess=a                       " Always prefer shorter error msgs
set showcmd                           " Show the result of cmds in the cmd line
set exrc                              " Enable project-specific vimrc config file
set secure                            " Disable insecure commands in project-specific vimrc files

set noruler                           " Disable showing the current line/column the cursor is at
set noshowmode                        " Disable showing current mode
set signcolumn=yes                    " Always show the sign column (on the left)

set lazyredraw                        " Disable screen redrawing while executing macros, registers or other commands.
set linespace=2                       " Num of pixels to add between every line vertically
set modelines=0                       " Disable mode lines

set nospell                           " Disable vim spellchecker (use coc-spell-checker instead)
set sessionoptions-=blank             " Do no store empty windows in saved sessions
set updatetime=400                    " How often to store file changes in swap files (recovery/auto-save)

set fillchars=eob:\                   " Disable ~ characters in buffers
set fillchars+=vert:\                 " Special character to use to separate vertical splits
set termguicolors

" ==== Mappings ======================================================================================= "

noremap <SPACE> <nop>
let mapleader=" "

map <Bslash> <Plug>(easymotion-prefix)

map <silent> S <Plug>Sneak_S
map <silent> s <Plug>Sneak_s
map <silent> F <Plug>Sneak_F
map <silent> T <Plug>Sneak_T
map <silent> f <Plug>Sneak_f
map <silent> t <Plug>Sneak_t

map <silent> w <Plug>CamelCaseMotion_w
sunmap w
map <silent> b <Plug>CamelCaseMotion_b
sunmap b
map <silent> e <Plug>CamelCaseMotion_e
sunmap e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap ge

nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gi <Plug>(coc-implementation)
nnoremap <silent> gr <Plug>(joc-references)
nnoremap <silent> gy <Plug>(coc-type-definition)

nmap <silent> ga <Plug>(EasyAlign)
xmap <silent> ga <Plug>(EasyAlign)

function! ToggleNERDTree()
  NERDTreeToggle
  silent NERDTreeMirror
endfunction

nnoremap <silent> <leader>W  :bd<CR>
nnoremap <silent> <leader>bf :Telescope buffers<CR>
nnoremap <silent> <leader>cm :Telescope commands<CR>
nnoremap <silent> <leader>co :Telescope git_commits<CR>
nnoremap <silent> <leader>cp :SClose<CR>
nnoremap <silent> <leader>cr :CocRestart<CR>
nnoremap <silent> <leader>e :call ToggleNERDTree()<CR>
nnoremap <silent> <leader>qf <Plug>(coc-fix-current)
nnoremap <silent> <leader>cl <Plug>(coc-codelens-action)
nnoremap <silent> <leader>fl :Telescope find_files<CR>
nnoremap <silent> <leader>g0 :diffget //3<CR>
nnoremap <silent> <leader>g1 :diffget //2<CR>
nnoremap <silent> <leader>gb :G blame<CR>
nnoremap <silent> <leader>gc :G commit<CR>
nnoremap <silent> <leader>gp :G push<CR>
nnoremap <silent> <leader>gs :G status<CR>
nnoremap <silent> <leader>mk :Telescope marks<CR>
nnoremap <silent> <leader>mp :Telescope keymaps<CR>
nnoremap <silent> <leader>no :nohls<CR>
nnoremap <silent> <leader>pc :PlugClean<CR>
nnoremap <silent> <leader>pi :PlugInstall<CR>
nnoremap <silent> <leader>pu :PlugUpdate<CR>
nnoremap <silent> <leader>rN :set relativenumber!<CR>
nnoremap <silent> <leader>rc :CocAction refactor<CR>
nnoremap <silent> <leader>re <Plug>(coc-rename)
nnoremap <silent> <leader>rf :NERDTreeFind<CR>
nnoremap <silent> <leader>rl :so ~/.config/nvim/init.vim<CR>
nnoremap <silent> <leader>rn :set relativenumber<CR>
nnoremap <silent> <leader>s  :Telescope live_grep<CR>
nnoremap <silent> <leader>ut :UndotreeToggle<CR>
nnoremap <silent> <leader>w  :BD<CR>
noremap <silent> <leader>/ :Commentary<CR>
nnoremap <silent> <leader>, :bp<CR>
nnoremap <silent> <leader>. :bn<CR>
nnoremap <silent> <C-b> :Toggle<CR>
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

nnoremap = +
nnoremap + =

nnoremap ' `
nnoremap ` '

nnoremap <silent> ]e :call CocAction('diagnosticNext')<CR>
nnoremap <silent> [e :call CocAction('diagnosticPrevious')<CR>
nnoremap <silent> ]h :Gitsigns next_hunk
nnoremap <silent> [h :Gitsigns prev_hunk

nnoremap <silent> <Down> :resize +1<CR>
nnoremap <silent> <Left> :vertical resize -1<CR>
nnoremap <silent> <Right> :vertical resize +1<CR>
nnoremap <silent> <Up> :resize -1<CR>

nmap Q <nop>

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent> <expr><TAB>
  \ coc#pum#visible() ? coc#pum#next(1) :
  \ CheckBackspace() ? "\<Tab>" :
  \ coc#refresh()
inoremap <silent> <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent> <expr><CR> coc#pum#visible() ? coc#pum#confirm()
  \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nnoremap <silent> K :call ShowDocumentation()<CR>
nnoremap <silent> <leader>' :call SynGroup()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

function! SynGroup()
    let l:s = synID(line('.'), col('.'), 1)
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun

xmap <silent> if <Plug>(coc-funcobj-i)
omap <silent> if <Plug>(coc-funcobj-i)
xmap <silent> af <Plug>(coc-funcobj-a)
omap <silent> af <Plug>(coc-funcobj-a)
xmap <silent> ic <Plug>(coc-classobj-i)
omap <silent> ic <Plug>(coc-classobj-i)
xmap <silent> ac <Plug>(coc-classobj-a)
omap <silent> ac <Plug>(coc-classobj-a)

autocmd CursorHold * silent call CocActionAsync('highlight')

" UltiSnips
let g:UltiSnipsExpandTrigger       = "<C-s>"
let g:UltiSnipsJumpBackwardTrigger = "<C-k>"
let g:UltiSnipsJumpForwardTrigger  = "<C-j>"


" ==== Commands ======================================================================================= "

command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

function TrimWhitespace()
  if !&binary && &filetype != 'diff'
    normal mz
    %s/\s\+$//e
    normal `zmz
  endif
endfunction

" :Trim to trim trailing whitespace
command! -nargs=0 Trim :call TrimWhitespace()
command! -nargs=0 T :Trim

" Format the current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" ==== Plugins ======================================================================================== "

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin("~/.config/nvim/autoload")

Plug 'tommcdo/vim-exchange'                                    " Swap two text chunks
Plug 'SirVer/ultisnips'                                        " Snippet manager
Plug 'junegunn/vim-easy-align'                                 " Text alignment action
Plug 'lukelbd/vim-toggle'                                      " Make boolean-like words toggleable
Plug 'matze/vim-move'                                          " Move lines up and down
Plug 'qpkorr/vim-bufkill'                                      " Better buffer closing
Plug 'tpope/vim-commentary'                                    " Better commenting
Plug 'tpope/vim-repeat'                                        " Make more things dot repeatable

Plug 'christoomey/vim-sort-motion'                             " Sort lines but as a motion
Plug 'bkad/camelcasemotion'                                    " Word-wise motions respect camelCase
Plug 'easymotion/vim-easymotion'                               " Better search as a motion
Plug 'tpope/vim-surround'                                      " Surrounding pairwise characters as a motion
Plug 'jiangmiao/auto-pairs'                                    " Auto-close pairwise characters
Plug 'justinmk/vim-sneak'                                      " Rebind s to two-letter jump

Plug 'glts/vim-textobj-comment'                                " Comments as a text obj
Plug 'kana/vim-textobj-entire'                                 " Entire buffer as a text obj
Plug 'kana/vim-textobj-line'                                   " Lines as text objs
Plug 'kana/vim-textobj-user'                                   " Core plugin for enabling custom text objs
Plug 'sgur/vim-textobj-parameter'                              " Parameters as text objs

Plug 'fatih/vim-go'                                            " Better Go development
Plug 'sheerun/vim-polyglot'                                    " Automatically add lang-specific plugins async

Plug 'junegunn/vim-slash'                                      " Better search
Plug 'haya14busa/incsearch.vim'                                " Better incremental search

Plug 'junegunn/goyo.vim'                                       " Zen mode
Plug 'mbbill/undotree'                                         " Visual tree for undo history
Plug 'mhinz/vim-startify'                                      " Better start screen
Plug 'tpope/vim-fugitive'                                      " Git integration
Plug 'tpope/vim-obsession'                                     " Auto session management
Plug 'tpope/vim-rhubarb'                                       " GitHub integration for fugitive

Plug 'vim-scripts/loremipsum'                                  " Generate lorem ipsum text
Plug 'lewis6991/gitsigns.nvim'                                 " Add git signs to side gutter

Plug 'preservim/nerdtree'
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'

Plug 'nvim-lua/plenary.nvim'                                   " Required dependency for other plugins
Plug 'kyazdani42/nvim-web-devicons'                            " Add icons supported by other plugins
" Plug 'kyazdani42/nvim-tree.lua'                                " File explorer
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }              " Display the currently open files at the top
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }       " Quickly move and file files
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}    " Enable smart syntax highlighting
Plug 'neoclide/coc.nvim', {'branch': 'release'}                " Smart completion similar to Intellisense
" Plug 'puremourning/vimspector'                                 " Debugger tool
 
call plug#end()


" ==== Plugin Configs ================================================================================= "

" Startify

let g:startify_change_to_dir       = 1
let g:startify_change_to_vcs_root  = 1
let g:startify_files_number        = 10
let g:startify_session_autoload    = 1
let g:startify_session_persistence = 1
let g:startify_session_sort        = 1
let g:startify_custom_header       = 'startify#pad(startify#fortune#boxed())'

let g:startify_lists = [
      \ { 'type': 'sessions',   'header': ['   Projects'] },
      \ { 'type': 'files',      'header': ['   Recently opened'] },
      \ { 'type': 'bookmarks',  'header': ['   Bookmarks'] },
      \ { 'type': 'commands',   'header': ['   Commands'] },
      \ ]

let g:startify_skiplist = ['COMMIT_EDITMSG']

" Go

let g:go_highlight_build_constraints     = 1
let g:go_highlight_diagnostic_warnings   = 0
let g:go_highlight_extra_types           = 1
let g:go_highlight_fields                = 1
let g:go_highlight_format_strings        = 1
let g:go_highlight_function_calls        = 1
let g:go_highlight_function_parameters   = 1
let g:go_highlight_functions             = 1
let g:go_highlight_generate_tags         = 1
let g:go_highlight_methods               = 1
let g:go_highlight_operators             = 1
let g:go_highlight_string_spellcheck     = 0
let g:go_highlight_structs               = 1
let g:go_highlight_types                 = 1
let g:go_highlight_variable_declarations = 1
let g:go_auto_sameids                    = 0

" Nerd Tree

let g:NERDTreeDirArrowCollapsible = ''
let g:NERDTreeDirArrowExpandable  = ''
let g:NERDTreeIgnore              = ['node_modules']
let g:NERDTreeWinPos              = 'right'
let g:NERDTreeMinimalUI           = 1
let g:NERDTreeWinSize             = 42
let g:NERDTreeMinimalMenu         = 1
let g:NERDAutoDeleteBuffer        = 1
let g:NERDTreeMapCustomOpen       = 'o'

" Nerd Tree Colors

if !exists('g:NERDTreeExtensionHighlightColor')
  let g:NERDTreeExtensionHighlightColor = {}
endif

let g:NERDTreeExtensionHighlightColor['Caddyfile']    = '0096FF'
let g:NERDTreeExtensionHighlightColor['Dockerfile']   = '0DB7ED'
let g:NERDTreeExtensionHighlightColor['Makefile']     = '0D7C7B'
let g:NERDTreeExtensionHighlightColor['css']          = '2965F1'
let g:NERDTreeExtensionHighlightColor['c']            = '656565'
let g:NERDTreeExtensionHighlightColor['cpp']          = '656565'
let g:NERDTreeExtensionHighlightColor['go']           = '29BEB0'
let g:NERDTreeExtensionHighlightColor['go']           = '29BEB0'
let g:NERDTreeExtensionHighlightColor['gql']          = 'E10098'
let g:NERDTreeExtensionHighlightColor['graphql']      = 'E10098'
let g:NERDTreeExtensionHighlightColor['html']         = 'E44D26'
let g:NERDTreeExtensionHighlightColor['java']         = 'f89820'
let g:NERDTreeExtensionHighlightColor['jpg']          = '00A98F'
let g:NERDTreeExtensionHighlightColor['js']           = 'F7DF1E'
let g:NERDTreeExtensionHighlightColor['json']         = '5382A1'
let g:NERDTreeExtensionHighlightColor['jsx']          = '61DBFB'
let g:NERDTreeExtensionHighlightColor['kt']           = 'F6891F'
let g:NERDTreeExtensionHighlightColor['lua']          = '000080'
let g:NERDTreeExtensionHighlightColor['md']           = '037EF3'
let g:NERDTreeExtensionHighlightColor['mod']          = '29BEB0'
let g:NERDTreeExtensionHighlightColor['pem']          = '5382A1'
let g:NERDTreeExtensionHighlightColor['png']          = '00A98F'
let g:NERDTreeExtensionHighlightColor['ppk']          = '5382A1'
let g:NERDTreeExtensionHighlightColor['properties']   = '5382A1'
let g:NERDTreeExtensionHighlightColor['proto']        = '379C9C'
let g:NERDTreeExtensionHighlightColor['pub']          = '5382A1'
let g:NERDTreeExtensionHighlightColor['py']           = '3EB049'
let g:NERDTreeExtensionHighlightColor['rb']           = 'CC0000'
let g:NERDTreeExtensionHighlightColor['rs']           = 'FE5000'
let g:NERDTreeExtensionHighlightColor['sass']         = 'CD6799'
let g:NERDTreeExtensionHighlightColor['scala']        = 'DE3423'
let g:NERDTreeExtensionHighlightColor['scss']         = 'CD6799'
let g:NERDTreeExtensionHighlightColor['sh']           = '9F9FA3'
let g:NERDTreeExtensionHighlightColor['sql']          = '1793D1'
let g:NERDTreeExtensionHighlightColor['sum']          = '29BEB0'
let g:NERDTreeExtensionHighlightColor['swift']        = 'F05138'
let g:NERDTreeExtensionHighlightColor['tf']           = '844FBA'
let g:NERDTreeExtensionHighlightColor['tmpl']         = '29BEB0'
let g:NERDTreeExtensionHighlightColor['ts']           = '007ACC'
let g:NERDTreeExtensionHighlightColor['tsx']          = '007ACC'
let g:NERDTreeExtensionHighlightColor['txt']          = 'FFE873'
let g:NERDTreeExtensionHighlightColor['vim']          = '019833'
let g:NERDTreeExtensionHighlightColor['vue']          = '41B883'
let g:NERDTreeExtensionHighlightColor['yaml']         = '5382A1'

let g:WebDevIconsDefaultFileSymbolColor               = 'CCCCCC'

" Dev Icons

if !exists('g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols')
  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
endif

if !exists('g:WebDevIconsUnicodeDecorateFileNodesExactSymbols')
  let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols = {}
endif

let g:webdevicons_enable                                                = 1
let g:webdevicons_enable_airline_statusline                             = 1
let g:webdevicons_enable_airline_tabline                                = 1
let g:webdevicons_enable_nerdtree                                       = 1
let g:webdevicons_enable_startify                                       = 1

let g:webdevicons_conceal_nerdtree_brackets                             = 1

let g:WebDevIconsOS                                                     = 'Darwin'
let g:WebDevIconsNerdTreeAfterGlyphPadding                              = ' '

let g:DevIconsEnableFolderExtensionPatternMatching                      = 0
let g:DevIconsEnableFolderPatternMatching                               = 1
let g:DevIconsEnableFoldersOpenClose                                    = 1
let g:WebDevIconsEnableFoldersOpenClose                                 = 1
let g:WebDevIconsUnicodeDecorateFolderNodes                             = 1
let g:WebDevIconsUnicodeDecorateFolderNodesExactMatches                 = 1

let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['BUILD']      = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['Caddyfile']  = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['Dockerfile'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['Makefile']   = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['WORKSPACE']  = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['c']          = 'ﭰ'
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['class']      = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['cpp']        = 'ﭱ'
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['css']        = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['csv']        = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['go']         = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['gql']        = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['graphql']    = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['html']       = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['java']       = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['jsx']        = 'ﰆ'
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['kt']         = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['md']         = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['mod']        = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['pdf']        = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['pem']        = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['ppk']        = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['properties'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['proto']      = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['pub']        = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['rb']         = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['rs']         = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['rss']        = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['sass']       = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['scss']       = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['sum']        = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['test.js']    = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['test.jsx']   = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['test.ts']    = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['test.tsx']   = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['tf']         = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['tmpl']       = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['tsx']        = 'ﰆ'
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['xml']        = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['zip']        = ''

let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol                  = ''
let g:DevIconsDefaultFolderOpenSymbol                                   = ''
let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol                = ''

" CoC
let g:coc_global_extensions = [
      \ "coc-calc",
      \ "coc-clangd",
      \ "coc-css",
      \ "coc-docker",
      \ "coc-docthis",
      \ "coc-emmet",
      \ "coc-flutter",
      \ "coc-go",
      \ "coc-html",
      \ "coc-jest",
      \ "coc-json",
      \ "coc-protobuf",
      \ "coc-pyright",
      \ "coc-rust-analyzer",
      \ "coc-sh",
      \ "coc-spell-checker",
      \ "coc-sql",
      \ "coc-tailwindcss",
      \ "coc-toml",
      \ "coc-tsserver",
      \ "coc-yaml",
      \ "coc-yank"
      \ ]

if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

" Move
let g:move_key_modifier = 'C'

" Disable the color-column
setlocal colorcolumn=


" ==== Neovim Configs ================================================================================= "

lua <<EOF

  require'telescope'.setup{}
  require'gitsigns'.setup{}

  local bg = '#201D26'
  local defaultObj = {
    fg = 'white',
    bg = bg
  }
  require'bufferline'.setup{
    highlights = {
      fill = {
        fg = 'white',
        bg = '#1b1820'
      },
      background = {
        fg = 'white',
        bg = bg
      },
      buffer_visible = {
        fg = 'white',
        bg = bg,
        italic = false
      },
      buffer_selected = {
        fg = 'white',
        bg = bg,
        italic = false
      },
      tab = defaultObj,
      numbers = defaultObj,
      numbers_selected = defaultObj,
      diagnostic = defaultObj,
      diagnostic_visible = defaultObj,
      diagnostic_selected = defaultObj,
      hint = defaultObj,
      hint_visible = defaultObj,
      hint_selected = defaultObj,
      hint_diagnostic = defaultObj,
      hint_diagnostic_visible = defaultObj,
      hint_diagnostic_selected = defaultObj,
      info = defaultObj,
      info_visible = defaultObj,
      info_selected = defaultObj,
      info_diagnostic = defaultObj,
      info_diagnostic_visible = defaultObj,
      info_diagnostic_selected = defaultObj,
      warning = defaultObj,
      warning_visible = defaultObj,
      warning_selected = defaultObj,
      warning_diagnostic = defaultObj,
      warning_diagnostic_visible = defaultObj,
      warning_diagnostic_selected = defaultObj,
      error = defaultObj,
      error_visible = defaultObj,
      error_selected = defaultObj,
      error_diagnostic = defaultObj,
      error_diagnostic_visible = defaultObj,
      error_diagnostic_selected = defaultObj,
      modified = defaultObj,
      modified_visible = defaultObj,
      modified_selected = defaultObj,
      duplicate_selected = defaultObj,
      duplicate_visible = defaultObj,
      duplicate = defaultObj,
      separator_selected = {
        fg = bg,
        bg = bg
      },
      separator_visible = {
        fg = bg,
        bg = bg
      },
      separator = {
        fg = bg,
        bg = bg
      },
      indicator_selected = {
        fg = '#02a7ff',
        bg = bg
      },
      pick_selected = {
        fg = bg,
        bg = bg,
        italic = false
      },
      pick_visible = {
        fg = bg,
        bg = bg,
        italic = false
      },
      pick = {
        fg = bg,
        bg = bg,
        italic = false
      },
      offset_separator = defaultObj
    },
    options = {
      buffer_close_icon = '',
      close_icon = '',
      diagnostics = 'coc',
      show_buffer_close_icons = false,
      show_close_icon = false,
      show_tab_indicators = false,
    }
  }

  -- require'nvim-treesitter.configs'.setup{
    -- ensure_installed = {"go", "python", "typescript", "tsx"},
    -- -- sync_install = false,
    -- auto_install = true,
    -- highlight = {
      -- enable = true,
    -- }
  -- }

EOF
