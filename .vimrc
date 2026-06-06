set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'scrooloose/nerdtree'
"Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-misc'
"Plugin 'ronakg/quickr-cscope.vim'
"Plugin '
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'majutsushi/tagbar'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/syntastic'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'morhetz/gruvbox'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
" setup for vim
" highlight search
set hlsearch
" cursor line
"set cul
set incsearch
set number

" easy-tag
" tags를 비동기로 불러와준다. (필수) tag사이즈가 커지게 되면 vim이 블록되는 시간이 길어져서 답답하다
let g:easytags_async=1
" highlight를 켜면 좋지만 이것도 속도가 느려진다.
let g:easytags_auto_highlight = 0
" struct의 멤버변수들도 추적이 된다.
let g:easytags_include_members = 0
" 현재 프로젝트에서 쓰는 tags파일을 우선 로드하고 없을 경우 global tags를 로드한다.
"let g:easytags_dynamic_files = 1


"================== setup for NERDTree
map <C-n> :NERDTreeToggle
" show hidden file by typeing I
let NERDTreeShowHidden=1

"================== setup for tagbar
nmap <F8> :TagbarToggle

"================== setup for airline theme
set term=xterm-256color
set t_Co=256
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#fnamemod = ':t'
"let g:airline_theme='solarized'
let g:airline_theme='gruvbox'
"let g:airline_solarized_bg='dark'

" setup for buffer

" 이 옵션은 버퍼를 수정한 직후 버퍼를 감춰지도록 한다.
" 이 방법으로 버퍼를 사용하려면 거의 필수다.
set hidden
" 버퍼 새로 열기
" 원래 이 단축키로 바인딩해 두었던 :tabnew를 대체한다.
"nmap <leader>T :enew
" 다음 버퍼로 이동
"nmap <C-b> :bnext
map ,r :bnext<CR>
" 이전 버퍼로 이동
"nmap <leader>h :bprevious
"nmap <leader>h :bprevious
"nmap <C-v> :bprevious
map ,w :bprevious<CR>
" 현재 버퍼를 닫고 이전 버퍼로 이동
" 탭 닫기 단축키를 대체한다.

nmap ,q :bp <BAR> bd #
"nmap <leader>bq :bp <BAR> bd #
" 모든 버퍼와 각 버퍼 상태 출력
"nmap <leader>bl :ls

" setup for color scheme
syntax enable
set background=dark
"colorscheme solarized
"let g:solarized_termcolors=256
colorscheme gruvbox 

map ,n :set nu<CR>
map ,m :set nonu<CR>

"setup for ctrlp
"let g:ctrlp_custom_ignore = {
"  \ 'dir':  '\.git$\|public$\|log$\|tmp$\|vendor$',
"  \ 'file': '\v\.(exe|so|dll)$'
"  \ } 
"
"==================== tab ====================
set smarttab
set tabstop=4
set shiftwidth=4
set expandtab


"==================== linux utility book =============
"--단일 지정: set tags=./tags
"--복수 지정: :set tags=./tags,(콤마) 
set tags=./tags;/
"set tags+=./tags
"set tags=./tags;/
"set tags=/home/jsh/study/device_driver/rpi3_linux/linux/tags
";set tags? - tags 파일 위치 설정 확인.

if version >= 500
func! Sts()
	let st = expand("<cword>")
	exe "sts ".st
endfunc
nmap ,st :call Sts()<cr>

func! Tj()
	let st = expand("<cword>")
	exe "tj ".st
endfunc
nmap ,tj :call Tj()<cr>
endif

"========== 80 line draw =========
set colorcolumn=80
"set textwidth
"
"===================cscope==================
"cscope 검색유형
"- 0 (s) : C 심볼을 검색
"- 1 (g) : 정의
"- 2 (d) : 이 함수에 의해 호출되는 함수 검색
"- 3 (c) : 이 함수를 호출하는 함수 검색
"- 4 (t) : 텍스트 문자열 검색
"- 5 (e) : 확장 정규식 사용해서 검색
"- 7(f) : 파일 이름 검색
"- 8(i) : 이 파일을 include 하는 파일 검색
"
" 이:ts :tselect 전에 검색했던tj list 보여줌  
" " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
set cscopetag
" check cscope for definition of a symbol before checking ctags: set to 1
" if you want the reverse search order.
set csto=0
set cst
set nocsverb

" setup for cscope
function! LoadCscope()
let db = findfile("cscope.out", ".;")
if (!empty(db))
        let path = strpart(db, 0, match(db, "/cscope.out$"))
        set nocscopeverbose " suppress 'duplicate connection' error
        exe "cs add " . db . " " . path
        set cscopeverbose
        " else add the database pointed to by environment variable
        elseif $CSCOPE_DB != ""
                cs add $CSCOPE_DB
        endif
endfunction
au BufEnter /* call LoadCscope()

nmap ,s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap ,g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap ,c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap ,t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap ,e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap ,f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap ,i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap ,d :cs find d <C-R>=expand("<cword>")<CR><CR>

nmap ,ns :scs find s <C-R>=expand("<cword>")<CR><CR>
nmap ,ng :scs find g <C-R>=expand("<cword>")<CR><CR>
nmap ,nc :scs find c <C-R>=expand("<cword>")<CR><CR>
nmap ,nt :scs find t <C-R>=expand("<cword>")<CR><CR>
nmap ,ne :scs find e <C-R>=expand("<cword>")<CR><CR>
nmap ,nf :scs find f <C-R>=expand("<cfile>")<CR><CR>
nmap ,ni :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap ,nd :scs find d <C-R>=expand("<cword>")<CR><CR>

nmap ,vs :vert scs find s <C-R>=expand("<cword>")<CR><CR>
nmap ,vg :vert scs find g <C-R>=expand("<cword>")<CR><CR>
nmap ,vc :vert scs find c <C-R>=expand("<cword>")<CR><CR>
nmap ,vt :vert scs find t <C-R>=expand("<cword>")<CR><CR>
nmap ,ve :vert scs find e <C-R>=expand("<cword>")<CR><CR>
nmap ,vf :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
nmap ,vi :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap ,vd :vert scs find d <C-R>=expand("<cword>")<CR><CR>


"  "cscope find s
"  func! Css()
"  	let css = expand("<cword>")
"  	exe "cs find s ".css
"  	if getline(1) == " "
"  		exe "q!"
"  	endif
"  endfunc
"  nmap ,s :call Css()<cr>`
"  
"  func! Csns()
"  	let csns = expand("<cword>")
"  	new
"  	exe "cs find s ".csns
"  	if getline(1) == " "
"  		exe "q!"
"  	endif
"  endfunc
"  nmap ,ns :call Csns()<cr>`
"  
"  func! Csvs()
"  	let csvs = expand("<cword>")
"  	vsplit
"  	exe "cs find s ".csvs
"  	if getline(1) == " "
"  		exe "q!"
"  	endif
"  endfunc
"  nmap ,vs :call Csvs()<cr>`
"  
"  "cscope find c
"  func! Csc()
"  	let csc = expand("<cword>")
"  	exe "cs find c ".csc
"  	if getline(1) == " "
"  		exe "q!"
"  	endif
"  endfunc
"  nmap ,c :call Csc()<cr>`
"  
"  func! Csnc()
"  	let csnc = expand("<cword>")
"  	new
"  	exe "cs find c ".csnc
"  	if getline(1) == " "
"  		exe "q!"
"  	endif
"  endfunc
"  nmap ,nc :call Csnc()<cr>`
"  
"  func! Csvc()
"  	let csvc = expand("<cword>")
"  	vsplit
"  	exe "cs find c ".csvc
"  	if getline(1) == " "
"  		exe "q!"
"  	endif
"  endfunc
"  nmap ,vc :call Csvc()<cr>`
"  
"  "cscope fine d
"  func! Csd()
"  	let csd = expand("<cword>")
"  	exe "cs find d ".csd
"  	if getline(1) == " "
"  		exe "q!"
"  	endif
"  endfunc
"  nmap ,d :call Csd()<cr>`
"  
"  func! Csnd()
"  	let csnd = expand("<cword>")
"  	new
"  	exe "cs find d ".csnd
"  	if getline(1) == " "
"  		exe "q!"
"  	endif
"  endfunc
"  nmap ,nd :call Csnd()<cr>`
"  
"  func! Csvd()
"  	let csvd = expand("<cword>")
"  	vsplit
"  	exe "cs find d ".csvd
"  	if getline(1) == " "
"  		exe "q!"
"  	endif
"  endfunc
"  nmap ,vd :call Csvd()<cr>`
"  
"  "cscope find g
"  
"  nmap ,g :cs find g <C-R>=expand("<cword>")<CR><CR>
"  " func! Csg()
"  " 	let csg = expand("<cword>")
"  " 	exe "cs find g ".csg
"  " 	if getline(1) == " "
"  " 		exe "q!"
"  " 	endif
"  " endfunc
"  " nmap ,g :call Csg()<cr>`
"  
"  func! Csng()
"  	let csng = expand("<cword>")
"  	new
"  	exe "cs find g ".csng
"  	if getline(1) == " "
"  		exe "q!"
"  	endif
"  endfunc
"  nmap ,ng :call Csng()<cr>`
"  
"  func! Csvg()
"  	let csvg = expand("<cword>")
"  	vsplit
"  	exe "cs find g ".csvg
"  	if getline(1) == " "
"  		exe "q!"
"  	endif
"  endfunc
"  nmap ,vg :call Csvg()<cr>`
"  
"  
"  "cscope find c
"  
"  func! Csc()
"  	let csc = expand("<cword>")
"  	exe "cs find c ".csc
"  	if getline(1) == " "
"  		exe "q!"
"  	endif
"  endfunc
"  nmap ,c :call Csc()<cr>`
"  
"  func! Csnc()
"  	let csnc = expand("<cword>")
"  	new
"  	exe "cs find c ".csnc
"  	if getline(1) == " "
"  		exe "q!"
"  	endif
"  endfunc
"  nmap ,nc :call Csnc()<cr>`
"  
"  func! Csvc()
"  	let csvc = expand("<cword>")
"  	vsplit
"  	exe "cs find c ".csvc
"  	if getline(1) == " "
"  		exe "q!"
"  	endif
"  endfunc
"  nmap ,vc :call Csvc()<cr>`
"  
"  
"  "cscope find t
"  
"  func! Cst()
"  	let cst = expand("<cword>")
"  	exe "cs find t ".cst
"  	if getline(1) == " "
"  		exe "q!"
"  	endif
"  endfunc
"  nmap ,t :call Cst()<cr>`
"  
"  func! Csnt()
"  	let csnt = expand("<cword>")
"  	new
"  	exe "cs find t ".csnt
"  	if getline(1) == " "
"  		exe "q!"
"  	endif
"  endfunc
"  nmap ,nt :call Csnt()<cr>`
"  
"  func! Csvt()
"  	let csvt = expand("<cword>")
"  	vsplit
"  	exe "cs find t ".csvt
"  	if getline(1) == " "
"  		exe "q!"
"  	endif
"  endfunc
"  nmap ,vt :call Csvt()<cr>`
"  
"  
"  "cscope find e
"  
"  func! Cse()
"  	let cse = expand("<cword>")
"  	exe "cs find e ".cse
"  	if getline(1) == " "
"  		exe "q!"
"  	endif
"  endfunc
"  nmap ,e :call Cse()<cr>`
"  
"  func! Csne()
"  	let csne = expand("<cword>")
"  	new
"  	exe "cs find e ".csne
"  	if getline(1) == " "
"  		exe "q!"
"  	endif
"  endfunc
"  nmap ,ne :call Csne()<cr>`
"  
"  func! Csve()
"  	let csve = expand("<cword>")
"  	vsplit
"  	exe "cs find e ".csve
"  	if getline(1) == " "
"  		exe "q!"
"  	endif
"  endfunc
"  nmap ,ve :call Csve()<cr>`
"  
"  
"  "cscope find f
"  
"  func! Csf()
"  	let csf = expand("<cword>")
"  	exe "cs find f ".csf
"  	if getline(1) == " "
"  		exe "q!"
"  	endif
"  endfunc
"  nmap ,f :call Csf()<cr>`
"  
"  func! Csnf()
"  	let csnf = expand("<cword>")
"  	new
"  	exe "cs find f ".csnf
"  	if getline(1) == " "
"  		exe "q!"
"  	endif
"  endfunc
"  nmap ,nf :call Csnf()<cr>`
"  
"  func! Csvf()
"  	let csvf = expand("<cword>")
"  	vsplit
"  	exe "cs find f ".csvf
"  	if getline(1) == " "
"  		exe "q!"
"  	endif
"  endfunc
"  nmap ,vf :call Csvf()<cr>`
"  
"  
"  "cscope find i
"  
"  func! Csi()
"  	let csi = expand("<cword>")
"  	exe "cs find i ".csi
"  	if getline(1) == " "
"  		exe "q!"
"  	endif
"  endfunc
"  nmap ,i :call Csi()<cr>`
"  
"  func! Csni()
"  	let csni = expand("<cword>")
"  	new
"  	exe "cs find i ".csni
"  	if getline(1) == " "
"  		exe "q!"
"  	endif
"  endfunc
"  nmap ,ni :call Csni()<cr>`
"  
"  func! Csvi()
"  	let csvi = expand("<cword>")
"  	vsplit
"  	exe "cs find i ".csvi
"  	if getline(1) == " "
"  		exe "q!"
"  	endif
"  endfunc
"  nmap ,vi :call Csvi()<cr>`


"bash script for make cscope database when select file
"#!/bin/bash
"
"LNX="."
"
"echo "Finding relevant source files..."
"find $LNX                                                                \
"    -path "$LNX/arch/*" ! -path "$LNX/arch/x86*" -prune -o               \
"    -path "$LNX/include/asm-*" ! -path "$LNX/include/asm-generic*"       \
"                               ! -path "$LNX/include/asm-x86*" -prune -o \
"    -path "$LNX/tmp*" -prune -o                                          \
"    -path "$LNX/Documentation*" -prune -o                                \
"    -path "$LNX/scripts*" -prune -o                                      \
"    -name "*.[chxsS]" -print > $LNX/cscope.files
"
"echo "Building cscope database..."
"time cscope -q -k -b -i cscope.files
"
"exit 0
"https://courses.cs.washington.edu/courses/cse451/12sp/tutorials/tutorial_cscope.html
