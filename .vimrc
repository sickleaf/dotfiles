set number
syntax enable
let g:solarized_italic=0
let g:molokai_original=1
set clipboard=unnamed,autoselect
set visualbell t_vb=
inoremap <C-k> <ESC>
"2017-03-29 insert Current Date
"https://maku77.github.io/vim/insert-date.html
imap <silent> <C-C><C-D> <C-R>=strftime("%Y-%m-%d")<CR>
nmap <silent> <C-C><C-D> <ESC>i<C-R>=strftime("%Y-%m-%d")<CR><ESC>
"2017-03-29 disable folding `You're not alone.`
"http://stackoverflow.com/questions/5017009/confusion-about-vim-folding-how-to-disable
set nofoldenable
" 日本語変換
" 「日本語入力固定モード」の動作モード
let IM_CtrlMode = 4
" 「日本語入力固定モード」切替キー
inoremap <silent> <C-Space> <C-^><C-r>=IMState('FixMode')<CR>
" The prefix key. 
let g:unite_enable_start_insert=0
" unite.vim keymap " https://github.com/alwei/dotfiles/blob/3760650625663f3b08f24bc75762ec843ca7e112/.vimrc 
" Unite settings
nnoremap [unite]    <Nop>
nmap     <Space> [unite]
nnoremap <silent> [unite]c   :<C-u>UniteWithCurrentDir -buffer-name=files buffer file_mru bookmark file<CR><ESC>
nnoremap <silent> [unite]f   :<C-u>Unite file_mru<CR><ESC>
nnoremap <silent> [unite]b   :<C-u>Unite buffer<CR><ESC>
nnoremap <silent> [unite]l   :<C-u>Unite file<CR><ESC>
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
  " 単語単位からパス単位で削除するように変更
  imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
endfunction
"" Use vimfiler instead of default filer.
"let g:vimfiler_as_default_explorer = 0
"" Open filer
"noremap <C-V><C-F> :VimFiler -split -simple -winwidth=30 -no-quit<ENTER>
"" Don't let <CR> enter the directory but let it open the directory
"autocmd FileType vimfiler nmap <buffer> <CR> <Plug>(vimfiler_expand_or_edit)
"" Automatically open vimfiler on start
""autocmd VimEnter * VimFilerExplorer
"" If no files are specified, open vimfiler
""autocmd VimEnter * if !argc() | VimFiler | endif
" indentLine
"let g:indentLine_color_term = 111
"let g:indentLine_color_gui = '#708090'
"let g:indentLine_char = '|'
" start up vimfiler
"
"autocmd VimEnter * VimFiler -split -simple -winwidth=20 -no-quit
"autocmd FileType vimfiler nmap <buffer> <CR> <Plug>(vimfiler_expand_or_edit)
:command! RC :source $MYVIMRC
:command! CD :cd %:h
:command! DEF :colorscheme default

"20161128 change destination of backup and swap file
set noundofile
set backup
set backupdir=~/.vim/backup
set swapfile
set directory=~/.vim/backup

"20161219 colorscheme,scrolloff,cursorline
set scrolloff=10
set cursorline

"2017-03-29 for markdown - pandoc
au BufRead,BufNewFile *.md set filetype=markdown
" コマンドラインモードでTABキーによるファイル名補完を有効にする
set wildmenu wildmode=list:longest,full
 " Note: Skip initialization for vim-tiny or vim-small.
 if 0 | endif
 if has('vim_starting')
   if &compatible
     set nocompatible               " Be iMproved
   endif
   " Required:
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif
 " Required:
 call neobundle#begin(expand('~/.vim/bundle/'))

"2017-04-04 neocomplcache setting
set completeopt=menuone
for k in split("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_",'\zs')
   exec "imap " . k . " " . k . "<C-N><C-P>"
endfor
imap <expr> <TAB> pumvisible() ? "\<Down>" : "\<Tab>"

"2017-04-04 snippet setting

"2017-12-29 colorscheme molokai
set background=dark
"colorscheme molokai

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <Ctrl+Space>     <Plug>(neosnippet_expand_or_jump)
smap <Ctrl+Space>     <Plug>(neosnippet_expand_or_jump)
xmap <Ctrl+Space>     <Plug>(neosnippet_expand_target)
" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <C-j>     <Plug>(neosnippet_expand_or_jump)
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
"set snippet file dir
let g:neosnippet#snippets_directory='~/.vim/bundle/neosnippet-snippets/snippets/,~/.vim/snippets'
 " Let NeoBundle manage NeoBundle
 " Required:
 NeoBundleFetch 'Shougo/neobundle.vim'
 NeoBundle 'Shougo/unite.vim'
 NeoBundle 'Shougo/neomru.vim'
 NeoBundle 'Shougo/neocomplcache'
 NeoBundle 'Shougo/neosnippet'
 NeoBundle 'Shougo/neosnippet-snippets'
 NeoBundle 'altercation/vim-colors-solarized'
" NeoBundle 'tomasr/molokai'
 NeoBundle 'fuenor/im_control.vim'
 NeoBundle 'Shougo/vimfiler.git'
" NeoBundle 'aharisu/vim_goshrepl'
 NeoBundle 'Yggdroot/indentLine'
 "20160826  markdown
 "https://www.key-p.com/blog/staff/archives/9032
  NeoBundle 'plasticboy/vim-markdown'
  NeoBundle 'kannokanno/previm'
  NeoBundle 'tyru/open-browser.vim'
  NeoBundle 'dhruvasagar/vim-table-mode'
" 20160510 for markdown
" NeoBundle 'https://github.com/plasticboy/vim-markdown' 
" NeoBundle 'https://github.com/kannokanno/previm' 
" NeoBundle 'https://github.com/tyry/open-browser' 
" 20161212 for parajump
 NeoBundle 'deris/parajump'
 NeoBundleLazy 'vim-jp/cpp-vim', {
            \ 'autoload' : {'filetypes' : 'cpp'}
            \ }
 " My Bundles here:
 " Refer to |:NeoBundle-examples|.
 " Note: You don't set neobundle setting in .gvimrc!
 call neobundle#end()
 " Required:
 filetype plugin indent on
 " If there are uninstalled bundles found on startup,
 " this will conveniently prompt you to install them.
 NeoBundleCheck
