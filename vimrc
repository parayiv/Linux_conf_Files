"Added By parayiv in order to not use up/Down KEYS
"=================================================
"Unmap the ArroW KEYS
"no <down> <Nop>
"no <left> <Nop>
"no <right> <Nop>
"no <up> <Nop>
"
"ino <down> <Nop>
"ino <left> <Nop>
"ino <right> <Nop>
"ino <up> <Nop>

"=================================================
set nocompatible "must be the first Line"
let g:EasyMotion_leader_key = '\'

syntax on
set wildmenu
set hlsearch
set incsearch
set ai
set ts=4
set scrolloff=5
set mouse=a
set nowrap		" nowrap to not wrap long lines 

set textwidth=80
set cindent
se nu			" set number to add nymber in vim
set winminheight=0      " Allow windows to get fully squashed

colorscheme desert

""Make VIM do normal bash like completion for file name
set wildmode=longest,list,full
set wildmenu


"
" Switch between windows, maximizing the current window
"
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_ 

:let g:closetag_html_style=1

"
" AutoComplete HTML Tags 
"
"
"" Autoclose Tags
"""""
:let g:autoclose_on=1

""""""""""""""""""""""""""""""""""""""""""""""""""""
"''''''''Added by parayiv for Auto(omnicppComplete)
""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
	exe "menu Foo.Bar :" . a:str
	emenu Foo.Bar
	unmenu Foo
endfunction
		    
function! VisualSelection(direction) range
	let l:saved_reg = @"
	execute "normal! vgvy"

	let l:pattern = escape(@", '\\/.*$^~[]'")
	let l:pattern = substitute(l:pattern, "\n$","", "")

	if a:direction == 'b'
		execute "normal ?" . l:pattern . "^M"
	elseif a:direction == 'gv'
		call CmdLine("vimgrep " . '/' .	 l:pattern. '/' . '**/*.')
	 elseif	a:direction == 'replace'
		 call CmdLine("%s" . '/'. l:pattern .'/')
	 elseif a:direction == 'f'
		execute "normal/" . l:pattern . "^M"
	 endif
	 
let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

"" Added by parayiv
"""""""""""""""""""""
" Restore cursor Position to last editing after closing editor
au BufWinLeave * mkview
au BufWinEnter * silent loadview


filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
