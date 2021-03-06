set clipboard=unnamed
"文字コードをUFT-8に設定
set fenc=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd
"履歴件数を変更
set history=200
"マウス操作を許可
set mouse=a

" 見た目系
colorscheme hybrid
hi CursorLine ctermbg=23
" 行番号を表示
set number
" 現在の行を強調表示
set cursorline
" 現在の行を強調表示（縦）
" set cursorcolumn
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" ビープ音を可視化
set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" シンタックスハイライトの有効化
syntax enable

" Tab系
" 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2

" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" %%<TAB>でディレクトリパス入力
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" ノーマルモードに戻った時に自動的に英語入力に切り替える
if executable('im-select')
  autocmd InsertLeave * :call system('im-select com.apple.keylayout.ABC')
  autocmd CmdlineLeave * :call system('im-select com.apple.keylayout.ABC')
endif

"フォーカスしていない時の背景色(23を好きな値・色に変更)
let g:InactiveBackGround = 'ctermbg=239'

"Neovim内でフォーカスしていないペインの背景色設定
execute ('hi NormalNC '.g:InactiveBackGround)
execute ('hi NontextNC '.g:InactiveBackGround)
execute ('hi SpecialkeyNC '.g:InactiveBackGround)
execute ('hi EndOfBufferNC '.g:InactiveBackGround)

"Neovim自体からフォーカスを外したりした際の切替設定
"(フォーカスした時の設定はcolorschemeに合わせて変更）
augroup ChangeBackGround
autocmd!
" フォーカスした時(colorscheme準拠に切替)
autocmd FocusGained * hi Normal ctermbg=234 " :hi Normalで取得した値
autocmd FocusGained * hi NonText ctermbg=234 " :hi NonTextで取得した値
autocmd FocusGained * hi SpecialKey ctermbg=234 " :hi SpecialKeyで取得した値
autocmd FocusGained * hi EndOfBuffer ctermbg=none " EndOfBufferの設定は恐らくclearなのでnoneを入れる
" フォーカスを外した時（フォーカスしていない時の背景色に切替)
autocmd FocusLost * execute('hi Normal '.g:InactiveBackGround)
autocmd FocusLost * execute('hi NonText '.g:InactiveBackGround)
autocmd FocusLost * execute('hi SpecialKey '.g:InactiveBackGround)
autocmd FocusLost * execute('hi EndOfBuffer '.g:InactiveBackGround)
augroup end

" Term:
command! -nargs=* T split | wincmd j | resize 20 | terminal <args>
autocmd TermOpen * startinsert

" Functions:
function PlugStr (url)
  let str = substitute(a:url,'https://github.com/','','g')
  return "Plug '".str."'"
endfunction

