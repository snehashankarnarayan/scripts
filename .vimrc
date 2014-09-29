" Use Vim defaults (much better!)
set nocompatible
syn on

augroup vimrc_autocmds
    autocmd!
    " highlight characters past column 120
    autocmd FileType python highlight Excess ctermbg=DarkGrey
    autocmd FileType python match Excess /\%120v.*/
    autocmd FileType python set nowrap
    augroup END

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
Bundle 'davidhalter/jedi-vim'

" The bundles you install will be listed here
Bundle 'scrooloose/nerdtree'
map <F2> :NERDTreeToggle<CR>

filetype plugin indent on

highlight DiffAdd cterm=bold ctermbg=green guibg=greenhighlight 
highlight DiffText term=bold cterm=bold ctermbg=Yellow gui=bold guibg=Yellow
"
"highlight DiffAdd ctermbg=black ctermfg=DarkGreen
"highlight DiffChange ctermbg=black ctermfg=DarkGreen
"highlight DiffText ctermbg=black ctermfg=DarkGreen cterm=underline
"highlight DiffDelete ctermbg=red ctermfg=white

" Also switch on highlighting the last used search pattern.
set hlsearch
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
" always set autoindenting on
set ai

color evening 

" allow backspacing over everything in insert mode
set bs=2

" show the cursor position all the time
set ruler
set nu
set ic

" show (partial) commands //Added by ripu
set showcmd


set viminfo='20,\"50    " read/write a .viminfo file, don't store more
                        " than 50 lines of registers
set history=100          " keep 50 lines of command line history

if has("autocmd")
	augroup cprog
		" Remove all cprog autocommands
		au!
		
		" When starting to edit a file:
		"   For C and C++ files set formatting of comments and set C-indenting on.
		"   For other files switch it off.
		"   Don't change the order, it's important that the line with * comes first.
		autocmd FileType *      set formatoptions=tcql nocindent comments&
		autocmd FileType c,cpp  set formatoptions=croql cindent comments=sr:/*,mb:*,el:*/,://
	augroup END
endif

if has("autocmd")
	" In text files, always limit the width of text to 90 characters
	autocmd BufRead *.txt set tw=90
	" When editing a file, always jump to the last cursor position
	autocmd BufReadPost *
	\ if line("'\"") > 0 && line ("'\"") <= line("$") |
	\   exe "normal g'\"" |
	\ endif
endif

"set smartindent
"set cindent
"set autoindent

"autocmd FileType *.cpp set tabstop=4
"au BufEnter *.cpp set tabstop=4

"map <ESC>[8~ <End>
"map <ESC>[7~ <Home>
"imap <ESC>[8~ <End>                                                         
"imap <ESC>[7~ <Home>

"set diffopt+=iwhite
"set expandtab
"set tabstop=2
"set shiftwidth=2
"set cinkeys=0{,0},:,0#,!,!^F

" Use <leader>l to toggle display of whitespace
nmap <leader>l :set list!<CR>
" automatically change window's cwd to file's dir
set autochdir

" I'm prefer spaces to tabs
set tabstop=4
set shiftwidth=4
set expandtab

" more subtle popup colors 
if has ('gui_running')
        highlight Pmenu guibg=#cccccc gui=bold    
    endif
