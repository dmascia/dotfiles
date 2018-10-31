" Plugins
call plug#begin('~/.local/share/nvim/plugged')
Plug 'digitaltoad/vim-pug'
Plug 'easymotion/vim-easymotion'
Plug 'flazz/vim-colorschemes'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'kana/vim-textobj-user'
Plug 'kshenoy/vim-signature'
Plug 'lilydjwg/colorizer'
Plug 'majutsushi/tagbar'
Plug 'mfukar/robotframework-vim'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-vinegar'
Plug 'sheerun/vim-polyglot'
Plug 'sjl/gundo.vim'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tyewang/vimux-jest-test'
Plug 'w0rp/ale'
Plug 'wincent/ferret'
Plug 'wincent/loupe'

" markdown {{{
  Plug 'tpope/vim-markdown', {'on_ft': 'markdown'}
  Plug 'dhruvasagar/vim-table-mode'
  Plug 'nelstrom/vim-markdown-folding', {'on_ft': 'markdown'}
  Plug 'rhysd/vim-grammarous'
  Plug 'junegunn/goyo.vim'
  Plug 'euclio/vim-markdown-composer', {'build': 'cargo build --release'}
" }}}

" completion {{{
  Plug 'Shougo/deoplete.nvim'
  Plug 'tweekmonster/deoplete-clang2'
  Plug 'artur-shaik/vim-javacomplete2'
  Plug 'Shougo/neco-vim'
  Plug 'Shougo/neoinclude.vim'
  Plug 'ujihisa/neco-look'
  Plug 'zchee/deoplete-jedi'
  Plug 'zchee/deoplete-go', {'build': 'make'}
  Plug 'Shougo/echodoc.vim'
" }}}

" denite {{{
  Plug 'Shougo/denite.nvim'
  Plug 'nixprime/cpsm', {'build': 'PY3=ON ./install.sh'}
  Plug 'Shougo/neomru.vim'
  Plug 'chemzqm/denite-extra'
  Plug 'pocari/vim-denite-gists'
" }}}

" code style {{{
  Plug 'neomake/neomake'
  Plug 'sbdchd/neoformat'
  Plug 'editorconfig/editorconfig-vim'
" }}}

" git {{{{
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
  Plug 'jreybert/vimagit', {'on_cmd': ['Magit', 'MagitOnly']}
  Plug 'sgeb/vim-diff-fold'
  Plug 'airblade/vim-gitgutter'
  Plug 'junegunn/gv.vim'
  Plug 'lambdalisue/gina.vim'
" }}}}

" javascript {{{
  Plug 'othree/yajs.vim'
  Plug 'mxw/vim-jsx'
  Plug 'heavenshell/vim-jsdoc'
  Plug 'elzr/vim-json'
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'Quramy/vison'
" }}}

" html {{{
  Plug 'othree/html5.vim'
  Plug 'mattn/emmet-vim'
  Plug 'valloric/MatchTagAlways', {'on_ft': 'html'}
  Plug 'posva/vim-vue'
  Plug 'skwp/vim-html-escape'
" }}}

" css {{{
  Plug 'hail2u/vim-css3-syntax'
  Plug 'ap/vim-css-color'
" }}}

" go {{{
  Plug 'fatih/vim-go'
" }}}
"
call plug#end()            " required

" Syntax
filetype plugin indent on
syntax enable
set background=dark
set termguicolors
colorscheme Monokai
set nu rnu
set guicursor=
set laststatus=2
set spell


set t_Co=256
if &term =~ '256color'
  set t_ut=
endif


" Setters
set nocompatible
if has('gui_running')
  set guifont=IBM\ Plex\ Mono\ 14
endif
set dir=~/.tmp
set expandtab
set wildmenu
set guioptions-=T guioptions-=m
set laststatus=0 cmdheight=2 ruler ignorecase hlsearch magic noeb t_vb= tm=500
set regexpengine=1
set shiftwidth=2 tabstop=2 softtabstop=2 smartindent
set mouse=a
set so=7
set swapfile
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,*.png,*.jpg
set showtabline=1
set lbr

set list                              " show whitespace
set listchars=nbsp:⦸                  " CIRCLED REVERSE SOLIDUS (U+29B8, UTF-8: E2 A6 B8)
set listchars+=tab:▷┅                 " WHITE RIGHT-POINTING TRIANGLE (U+25B7, UTF-8: E2 96 B7)
" + BOX DRAWINGS HEAVY TRIPLE DASH HORIZONTAL (U+2505, UTF-8: E2 94 85)
set listchars+=extends:»              " RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00BB, UTF-8: C2 BB)
set listchars+=precedes:«             " LEFT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00AB, UTF-8: C2 AB)
set listchars+=trail:•                " BULLET (U+2022, UTF-8: E2 80 A2)

"folding stuff
set fillchars=vert:┃
set fillchars+=fold:
" set foldmethod=indent "indent method
set foldmethod=manual "indent method
set foldlevelstart=99 "start unfolded

set synmaxcol=800                     " Don't try to highlight lines longer than 800 characters.


" lets
let mapleader=" "
let g:jsx_ext_required = 0

" Autocommands
autocmd BufNewFile,BufReadPost Procfile set filetype=ruby

" Maps
nmap <c-\> :NERDTreeToggle<cr>
nmap <m-\> :Tagbar<cr>

" nnore <Leader><Leader> :Commands<cr>
nnore <C-p> :Files<space>.<cr>
nnore <Leader>pf :Files<cr>
nnore <Leader>pb :Buffers<cr>
nnore <Leader>pl :Lines<cr>
nnore <Leader>pt :Tags<cr>
nnore <Leader>pc :Commands<cr>
nnore <Leader>pa :Ag<space>


" Tab tweaks
nnore <Leader>tH :tabfirst<cr>
nnore <Leader>tL :tablast<cr>
nnore <Leader>td :tabclose<cr>
nnore <Leader>tD :tabclose!<cr>
nnore <Leader>th :tabp<cr>
nnore <Leader>tl :tabn<cr>
nnore <Leader>tr :tabc<cr>
nnore <Leader>tt :tabe<cr>

" Vim
nnore <Leader>Tc :call<space>CleanTemps()<cr>

" view maps
nnore <Leader>vm :mkview<cr>
nnore <Leader>vl :loadv<cr>

" buffers
nnoremap <Leader>bd :bdel<cr>
nnoremap <Leader>bl :buffers<cr>

" Configuration bindings
nnore <Leader>Cr :so~/.config/nvim/init.vim<cr>
nnore <Leader>Ce :e<space>~/.config/nvim/init.vim<cr>

" cpanel
nnore <Leader>cc :cclose<cr>

" Fugitive Bindings
nnore <Leader>gs :Gstatus<cr>
nnore <Leader>gp :Gpush<cr>
nnore <Leader>gf :Gpull<cr>
nnore <Leader>gc :Commits<cr>

" window
nnoremap <Leader>wd <C-w>c
nnoremap <Leader>Wd :close!<cr>
nnoremap <Leader>wh <C-w>h
nnoremap <Leader>wj <C-w>j
nnoremap <Leader>wk <C-w>k
nnoremap <Leader>wl <C-w>l
nnoremap <Leader>ws <C-w>s
nnoremap <Leader>wv <C-w>v
nnoremap <Leader>ww <C-w>z
nnoremap <Leader>w= <C-w>=

nnore <Leader>Tb :Tagbar<cr>

" Lista
nnoremap <Leader>/ :Lines<cr>

" Quiting/Restarting
inoremap fd <C-[>
nnoremap <Leader>qq :q<cr>
nnoremap <Leader>qQ :qall<cr>
nnoremap ,m :Neomake<cr>

nnore [s :call <SID>SynStack()<CR>

" set cursorline

" Folding
nore z[ va[zf
nore z{ va{zf
nore z( va(zf

" functions
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

function! g:CleanTemps()
  execute "!" . "rm -rf ~/.tmp/*.swp"
endfunction


let vimDir = '$HOME/.vim'
if has('persistent_undo')
  let myUndoDir = expand(vimDir . '/undodir')
  call system('mkdir ' . myUndoDir)
  let &undodir = myUndoDir
  set undofile
end

noremap <Leader>rl :w<Bar>execute 'silent !tmux send-keys -t bottom C-r'<Bar>redraw!<C-M>

function! ShowSpaces(...)
  let @/='\v(\s+$)|( +\ze\t)'
  let oldhlsearch=&hlsearch
  if !a:0
    let &hlsearch=!&hlsearch
  else
    let &hlsearch=a:1
  end
  return oldhlsearch
endfunction

function! TrimSpaces() range
  let oldhlsearch=ShowSpaces(1)
  execute a:firstline.",".a:lastline."substitute ///ge"
  let &hlsearch=oldhlsearch
endfunction

command -bar -nargs=? ShowSpaces call ShowSpaces(<args>)
command -bar -nargs=0 -range=% TrimSpaces <line1>,<line2>call TrimSpaces()
nnoremap <F8>     :ShowSpaces 1<CR>
nnoremap <C-F8>   m`:TrimSpaces<CR>``
vnoremap <C-F8>   :TrimSpaces<CR>

let g:slime_target = "tmux"

let $FZF_DEFAULT_COMMAND="ag -g ''"

au BufWrite <buffer> call TrimSpaces()

" Code formatting -----------------------------------------------------------{{{

" ,f to format code, requires formatters: read the docs
"
  noremap <silent> <leader>f :Neoformat<CR>
  let g:standard_prettier_settings = {
              \ 'exe': 'prettier',
              \ 'args': ['--stdin', '--stdin-filepath', '%:p', '--single-quote'],
              \ 'stdin': 1,
              \ }
  let g:neoformat_vue_prettier = {
              \ 'exe': 'vue-formatter',
              \ 'stdin': 1,
        \}
              " \ 'args': ['--stdin', '--stdin-filepath', '%:p', '--single-quote'],
    let g:neoformat_zsh_shfmt = {
              \ 'exe': 'shfmt',
              \ 'args': ['-i ' . shiftwidth()],
              \ 'stdin': 1,
              \ }
  let g:neoformat_enabled_zsh = ['shfmt']

" }}}
"
" Git -----------------------------------------------------------------------{{{

  set signcolumn=yes
  let g:conflict_marker_enable_mappings = 0
  let g:gitgutter_sign_added = '│'
  let g:gitgutter_sign_modified = '│'
  let g:gitgutter_sign_removed = '│'
  let g:gitgutter_sign_removed_first_line = '│'
  let g:gitgutter_sign_modified_removed = '│'
  let g:gina#command#blame#formatter#format="%in (%au) %ti"
  call gina#custom#command#option(
      \ '/\%(branch\|changes\|grep\|log\|status\)',
      \ '--opener', 'edit'
      \)

	call gina#custom#command#option(
	      \ 'log', '--group', 'log-viewer'
	      \)
" }}}
"
"
" Deoplete ------------------------------------------------------------------{{{

" enable deoplete
  set runtimepath+=/Users/davemascia/.local/share/nvim/plugged/deoplete.nvim/
  let g:deoplete#enable_at_startup = 1
  let g:deoplete#auto_complete_delay = 0
  let g:echodoc_enable_at_startup=1
  set splitbelow
  set completeopt+=menuone,noinsert,noselect
  set completeopt-=preview
  " autocmd CompleteDone * pclose

  function! Multiple_cursors_before()
    let b:deoplete_disable_auto_complete=2
  endfunction
  function! Multiple_cursors_after()
    let b:deoplete_disable_auto_complete=0
  endfunction
  let g:deoplete#file#enable_buffer_path=1
  call deoplete#custom#source('buffer', 'mark', 'ℬ')
  call deoplete#custom#source('tern', 'mark', '')
  call deoplete#custom#source('omni', 'mark', '⌾')
  call deoplete#custom#source('file', 'mark', '')
  call deoplete#custom#source('jedi', 'mark', '')
  call deoplete#custom#source('neosnippet', 'mark', '')
  call deoplete#custom#source('LanguageClient', 'mark', '')
  call deoplete#custom#source('typescript',  'rank', 630)
  "call deoplete#custom#source('_', 'matchers', ['matcher_cpsm'])
  " call deoplete#custom#source('_', 'sorters', [])
  let g:deoplete#omni_patterns = {
        \ 'html': '',
        \ 'css': '',
        \ 'scss': ''
        \}
  function! Preview_func()
    if &pvw
      setlocal nonumber norelativenumber
     endif
  endfunction
  autocmd WinEnter * call Preview_func()
  let g:deoplete#ignore_sources = {'_': ['around', 'buffer' ]}

"}}}

" Linting -------------------------------------------------------------------{{{

  call neomake#configure#automake({
  \ 'BufWritePost': {'delay': 0},
  \ 'BufWinEnter': {},
  \ 'TextChanged': {},
  \ 'InsertLeave': { },
  \ }, 1000)
  " call neomake#configure#automake({
  " \ 'BufWritePost': {},
  " \ }, 0)

  let g:ale_sign_error = '•'
  let g:ale_sign_warning = '•'
  let g:airline#extensions#ale#error_symbol='• '
  let g:airline#extensions#ale#warning_symbol='•  '
  let g:airline#extensions#neomake#error_symbol='• '
  let g:airline#extensions#neomake#warning_symbol='•  '

  " let g:neomake_typescript_tsc_tempfile_enabled = 0
  " let g:neomake_typescript_tslint_tempfile_enabled = 0
  let g:neomake_warning_sign = {'text': '•'}
  let g:neomake_error_sign = {'text': '•'}
  let g:neomake_info_sign = {'text': '•'}
  let g:neomake_message_sign = {'text': '•'}

  hi link ALEError SpellBad
  hi link ALEWarning SpellBad
  " Write this in your vimrc file
  let g:ale_lint_on_text_changed = 'never'
  let g:ale_lint_on_enter = 0
  " let g:neomake_verbose = 3
"}}}

" MarkDown ------------------------------------------------------------------{{{

  noremap <leader>TM :TableModeToggle<CR>
  let g:table_mode_corner="|"
  let g:markdown_fold_override_foldtext = 0
  let g:neomake_markdown_proselint_maker = {
      \ 'errorformat': '%W%f:%l:%c: %m',
      \ 'postprocess': function('neomake#postprocess#generic_length'),
      \}
  let g:neomake_markdown_enabled_makers = ['alex', 'proselint']
  let g:markdown_syntax_conceal = 0

  let g:neoformat_markdown_prettier = g:standard_prettier_settings
  let g:neoformat_enabled_markdown = ['prettier']

"}}}

" MultiCursor ---------------------------------------------------------------{{{

  let g:multi_cursor_exit_from_visual_mode=0
  let g:multi_cursor_exit_from_insert_mode=0
"}}}

" Javascript ----------------------------------------------------------------{{{

  " let $NVIM_NODE_LOG_FILE='nvim-node.log'
  " let $NVIM_NODE_LOG_LEVEL='warn'
  " let $NVIM_NODE_HOST_DEBUG=1

  " autocmd FileType typescript.tsx setlocal commentstring=
  " call tcomment#type#Define('typescriptreact', '{/* %s */}')
  " call tcomment#type#Define('typescript.tsx_block',       '{/* %s */}')
  " call tcomment#type#Define('typescript.tsx_inline',      '{/* %s */}')
  let g:neoformat_javascript_prettier = g:standard_prettier_settings
  let g:neoformat_enabled_javascript = ['prettier']
  autocmd FileType vue syntax sync fromstart

  let g:jsx_ext_required = 0
  let g:neomake_javascript_enabled_makers = []
  let g:jsx_ext_required = 1
  let g:jsdoc_allow_input_prompt = 1
  let g:jsdoc_input_description = 1
  let g:jsdoc_return=0
  let g:jsdoc_return_type=0

  let g:tern#command = ['tern']
  let g:tern#arguments = ['--persistent']
  let g:tern_map_keys=1

  autocmd FileType typescript,typescriptreact setl omnifunc=TSOmnicFunc
  " let g:neomake_typescript_enabled_makers = ['tslint']
  let g:nvim_typescript#max_completion_detail=50
  let g:nvim_typescript#completion_mark=''
  let g:nvim_typescript#javascript_support=1
  let g:nvim_typescript#expand_snippet=0
  " let g:nvim_typescript#vue_support=1
  let g:nvim_typescript#diagnosticsEnable=1
  map <silent> <leader>gd :TSDoc <cr>
  map <silent> <leader>gt :TSType <cr>
  map <silent> <leader>gtd :TSTypeDef <cr>
  map <silent> <leader>@ :Denite -buffer-name=TSDocumentSymbol TSDocumentSymbol <cr>
  map <silent> <leader># :Denite -buffer-name=TSWorkspaceSymbol TSWorkspaceSymbol <cr>
  map <silent> <leader>ti :TSImport <cr>
  nnoremap <m-Enter> :TSGetCodeFix<CR>

  let g:neomake_typescript_enabled_makers = []
  let g:neomake_vue_enabled_makers = []
  let g:neoformat_typescript_prettier = g:standard_prettier_settings
  let g:neoformat_enabled_typescript = ['prettier']
  let g:neoformat_typescriptreact_prettier = g:standard_prettier_settings
  let g:neoformat_enabled_typescriptreact = ['prettier']
  " let g:neomake_typescript_enabled_makers = ['nvim_ts']
  let g:nvim_typescript#kind_symbols = {
      \ 'keyword': 'keyword',
      \ 'class': '',
      \ 'interface': '',
      \ 'script': 'script',
      \ 'module': '',
      \ 'local class': 'local class',
      \ 'type': '',
      \ 'enum': '',
      \ 'enum member': '',
      \ 'alias': '',
      \ 'type parameter': 'type param',
      \ 'primitive type': 'primitive type',
      \ 'var': '',
      \ 'local var': '',
      \ 'property': '',
      \ 'let': '',
      \ 'const': '',
      \ 'label': 'label',
      \ 'parameter': 'param',
      \ 'index': 'index',
      \ 'function': '',
      \ 'local function': 'local function',
      \ 'method': '',
      \ 'getter': '',
      \ 'setter': '',
      \ 'call': 'call',
      \ 'constructor': '',
      \}




  let g:neoformat_json_prettier = g:standard_prettier_settings
  let g:neoformat_enabled_json = ['prettier']
  let g:vim_json_syntax_conceal = 0

" }}}
"
" Go ------------------------------------------------------------------------{{{

  let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'

"}}}

" CSS -----------------------------------------------------------------------{{{

  let g:neoformat_scss_prettier = g:standard_prettier_settings
  let g:neoformat_enabled_scss = ['prettier']
  let g:neomake_scss_enabled_makers = ['sasslint']

"}}}

"let g:tern#command = ["tern"]
"let g:tern#arguments = ["--persistent"]
"let g:ale_fixers = {}
"let g:ale_fixers['javascript'] = ['prettier']
"let g:ale_fix_on_save = 1
