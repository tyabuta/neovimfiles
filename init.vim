
" -------------------------------------------------------------------
" dein
" -------------------------------------------------------------------
"{{{
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
execute 'set runtimepath^=' . s:dein_repo_dir

call dein#begin(s:dein_dir)

if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)

    " tomlファイルを変更した場合は、:call dein#clear_state でキャッシュをクリアする。
    let s:toml = '~/.config/nvim/rc/dein.toml'
    let s:lazy_toml = '~/.config/nvim/rc/dein_lazy.toml'
    call dein#load_toml(s:toml, {'lazy': 0})
    call dein#load_toml(s:lazy_toml, {'lazy': 1})

    call dein#end()
    call dein#save_state()
endif

if dein#check_install(['vimproc'])
    call dein#install(['vimproc'])
endif


if dein#check_install()
    call dein#install()
endif

" }}}


" -------------------------------------------------------------------
" 表示設定
" -------------------------------------------------------------------
" {{{

set number
"set termguicolors
colorscheme torte

" Popupメニューの表示カラー
highlight Pmenu ctermbg=238 gui=bold

filetype indent on
set tabstop=4
set shiftwidth=4
set expandtab

" Insertモード時に水平ラインを表示する
set nocursorline
autocmd InsertEnter,InsertLeave * set cursorline!

" }}}


" -------------------------------------------------------------------
" キーバインド
" -------------------------------------------------------------------
" {{{

" prefix-key for Keymapping
nnoremap [prefix] <Nop>
nmap <space> [prefix]
vmap <space> [prefix]

nmap [prefix]h :nohlsearch<CR>


" Shiftを押しながら移動キーで、3行分カーソル移動。
noremap <S-j> 3j
noremap <S-k> 3k

" Shiftを押しながら移動キーで、行頭、行末移動。
nnoremap <S-h> ^
nnoremap <S-l> $

" Ctrl-s で保存
nnoremap <silent> <C-s> :w<CR>

" 置換コマンドの補完
nnoremap [prefix]r :%s///gc<Left><Left><Left>
vnoremap [prefix]r :s///gc<Left><Left><Left>

" タブで補完を確定する。
inoremap <expr><TAB>   pumvisible() ? "\<Right>" : "\<TAB>"

" インサートモードのカーソル移動
" j,kはメニュー展開時は<C-n>,<C-p>に展開する
inoremap <expr><C-j> pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr><C-k> pumvisible() ? "\<C-p>" : "\<Up>"

inoremap <C-h> <Left>
inoremap <C-l> <Right>

" }}}

" -------------------------------------------------------------------
" その他
" -------------------------------------------------------------------
" {{{

noswapfile

" 保存しなくてもバッファ切り替えが出来る
set hidden


" }}}


" -------------------------------------------------------------------
" deoplete
" -------------------------------------------------------------------
"{{{
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/deoplete.nvim/
let g:deoplete#enable_at_startup = 1
"}}}


" -------------------------------------------------------------------
" caw.vim
" -------------------------------------------------------------------
"{{{

" コメントアウト
nmap [prefix]/ <Plug>(caw:i:toggle)
vmap [prefix]/ <Plug>(caw:i:toggle)

"}}}


" -------------------------------------------------------------------
" vim-easy-align
" -------------------------------------------------------------------
"{{{

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

"}}}

" -------------------------------------------------------------------
" vim-textobj-user
" -------------------------------------------------------------------
"  {{{

omap  a, <Plug>(textobj-parameter-a)
xmap  a, <Plug>(textobj-parameter-a)

omap  i, <Plug>(textobj-parameter-i)
xmap  i, <Plug>(textobj-parameter-i)



"  }}}

" -------------------------------------------------------------------
" vim-operator-user
" -------------------------------------------------------------------
" {{{

map r <Plug>(operator-replace)

" }}}




