set nocompatible	" Use Vim defaults (much better!)
syntax on
set bs=2		" allow backspacing over everything in insert mode
"set ai			" always set autoindenting on
"set backup		" keep a backup file
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
			" than 50 lines of registers
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time

let g:C_AuthorName      = 'Alexander Samoilov'
let g:C_AuthorRef       = 'Mr.'
let g:C_Email           = 'alexander.samoilov@gmail.com'
let g:C_Company         = ''

set tabstop    =4
set shiftwidth =4
set expandtab
set cindent
set hlsearch
hi Search guibg=LightBlue

au BufNewFile,BufRead [Mm]akefile*
  \ set tabstop    =8 |
  \ set shiftwidth =8 |
  \ set noexpandtab   |
  \ set nocindent

"
"-------------------------------------------------------------------
" taglist.vim : toggle the taglist window
" taglist.vim : define the title texts for make
" taglist.vim : define the title texts for qmake
"-------------------------------------------------------------------
 noremap <silent> <F11>  <Esc><Esc>:Tlist<CR>
inoremap <silent> <F11>  <Esc><Esc>:Tlist<CR>

let tlist_make_settings  = 'make;m:makros;t:targets'
let tlist_qmake_settings = 'qmake;t:SystemVariables'

if has("autocmd")
  " ----------  qmake : set filetype for *.pro  ----------
  autocmd BufNewFile,BufRead *.pro  set filetype=qmake
endif " has("autocmd")

" Fortran support
"au BufRead,BufNewFile *.f let b:fortran_fixed_source=0
"au BufRead,BufNewFile *.f90 let b:fortran_fixed_source=0

filetype plugin on

let s:extfname = expand("%:e")

if s:extfname ==? "scala"
  set tabstop    =2
  set shiftwidth =2
endif

if s:extfname ==? "f90" || s:extfname ==? "F"
    let fortran_free_source=1
    unlet! fortran_fixed_source
    let fortran_more_precise=1
else
    let fortran_fixed_source=1
    unlet! fortran_free_source
endif

" enables menubar
set guioptions+=m

call pathogen#infect()
call pathogen#helptags()

" look for tags in current and upper levels of hierarchy 
set tags=tags;/
