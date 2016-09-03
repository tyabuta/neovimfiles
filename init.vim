
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

set number
"set termguicolors
colorscheme torte

" Popupメニューの表示カラー
highlight Pmenu ctermbg=238 gui=bold

filetype indent on
set tabstop=4
set shiftwidth=4
set expandtab


