"""
""" .vimrc file for troth account
"""
""" $Id: .vimrc,v 1.6 2001/12/10 21:14:48 troth Exp $
"""

filetype plugin indent on

set nocompatible	" Use Vim defaults (much better!)
set bs=2		" allow backspacing over everything in insert mode
set noai		" always set autoindenting on
"set backup		" keep a backup file
"set viminfo='20,\"50	" read/write a .viminfo file, don't store more
			" than 50 lines of registers
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time

"set expandtab           " insert spaces instead of tabs

"Map C-n to tabnext and C-p ro tabprevious.
"" These aren't needed - C-PageUp/C-PageDown work the same.
"nnoremap <silent> <C-n> :tabnext<CR>
"nnoremap <silent> <C-p> :tabprevious<CR>
set tabpagemax=15

" Alt-right/left to navigate forward/backward in the tags stack
map <M-Left> <C-T>
map <M-Right> <C-]>

" Highlight extra white space at end of line.
highlight WhiteSpaceEOL ctermbg=darkgreen guibg=lightgreen
match WhiteSpaceEOL /\s\+$/
autocmd WinEnter * match WhiteSpaceEOL /\s\+$/

" Only do this part when compiled with support for autocommands
if has("autocmd")
  " In text files, always limit the width of text to 78 characters
  autocmd BufRead *.txt set tw=78
  " When editing a file, always jump to the last cursor position
  "autocmd BufReadPost * if line("'\"") | exe "'\"" | endif
endif

"" Stop SuperTab from hijacking the tab key.
let g:SuperTabMappingForward = '<c-space>'
let g:SuperTabMappingBackward = '<s-c-space>'
"let g:SuperTabMappingTabLiteral = '<c-tab>'

if has("python")
  "autocmd FileType python setlocal omnifunc=pysmell#Complete
  autocmd FileType python set omnifunc=pythoncomplete#Complete
endif

" Add additional tags files here.
set tags=tags;/
set tags+=~/.vim/tags/cpp
"set tags+=~/.vim/tags/gl
"set tags+=~/.vim/tags/sdl
"set tags+=~/.vim/tags/qt4

" Omni CPP Complete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

" Don't use Ex mode, use Q for formatting
map Q gq

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  let rgb_file = "/usr/X11/lib/X11/rgb.txt"
  syntax on
  highlight Normal guibg=#c4c4c4
  set hlsearch
endif

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

 augroup gzip
  " Remove all gzip autocommands
  au!

  " Enable editing of gzipped files
  "	  read:	set binary mode before reading the file
  "		uncompress text in buffer after reading
  "	 write:	compress file after writing
  "	append:	uncompress file, append, compress file
  autocmd BufReadPre,FileReadPre	*.gz set bin
  autocmd BufReadPost,FileReadPost	*.gz let ch_save = &ch|set ch=2
  autocmd BufReadPost,FileReadPost	*.gz '[,']!gunzip
  autocmd BufReadPost,FileReadPost	*.gz set nobin
  autocmd BufReadPost,FileReadPost	*.gz let &ch = ch_save|unlet ch_save
  autocmd BufReadPost,FileReadPost	*.gz execute ":doautocmd BufReadPost " . expand("%:r")

  autocmd BufWritePost,FileWritePost	*.gz !mv <afile> <afile>:r
  autocmd BufWritePost,FileWritePost	*.gz !gzip <afile>:r

  autocmd FileAppendPre			*.gz !gunzip <afile>
  autocmd FileAppendPre			*.gz !mv <afile>:r <afile>
  autocmd FileAppendPost		*.gz !mv <afile> <afile>:r
  autocmd FileAppendPost		*.gz !gzip <afile>:r
 augroup END
endif
if &term=="xterm"
     set t_Co=8
     set t_Sb=^[4%dm
     set t_Sf=^[3%dm
endif

" some extra commands for HTML editing
nmap ,mh wbgueyei<<ESC>ea></<ESC>pa><ESC>bba
nmap ,h1 _i<h1><ESC>A</h1><ESC>
nmap ,h2 _i<h2><ESC>A</h2><ESC>
nmap ,h3 _i<h3><ESC>A</h3><ESC>
nmap ,h4 _i<h4><ESC>A</h4><ESC>
nmap ,h5 _i<h5><ESC>A</h5><ESC>
nmap ,h6 _i<h6><ESC>A</h6><ESC>
nmap ,hb wbi<b><ESC>ea</b><ESC>bb
nmap ,he wbi<em><ESC>ea</em><ESC>bb
nmap ,hi wbi<i><ESC>ea</i><ESC>bb
nmap ,hu wbi<u><ESC>ea</i><ESC>bb
nmap ,hs wbi<strong><ESC>ea</strong><ESC>bb
nmap ,ht wbi<tt><ESC>ea</tt><ESC>bb
nmap ,hx wbF<df>f<df>

if version >= 500
	" Tabs are evil. Everyone uses a different tabstop.
	" This will force expanding of tabs into appropriate number of spaces.
	set expandtab

	" define a function for cycling the tabstops from 2 -> 4 -> 8 -> 2
	set ts=4 sw=4
	"function Toggle_Tab_Width()
	"	if &ts == 2
	"		set ts=4 sw=4
	"	elseif &ts == 4
	"		set ts=8 sw=8
	"	else
	"		set ts=2 sw=2
	"	endif
	"endfunction

	" call the funciton via the ex style command ':TG<ret>'
	"command TG call Toggle_Tab_Width()

	" set up Function-Key-1 to run the function. <F1> normally
	" invokes help, but you can still get to that vi :help.
	" unmap <F4>
	" map <F4> :TG<cr>

	" Allow this to work in insert mode too.
	" unmap! <F4>
	" map! <F4> <esc>:TG<cr>li

	" turn off a search highlight
	"unmap <F5>
	map <F5> :nohl<cr>

	"unmap! <F5>
	map! <F5> <esc>:nohl<cr>li

	"	    NR-16   NR-8    COLOR NAME ~ *cterm-colors*
	"	    0	    0	    Black
	"	    1	    4	    DarkBlue
	"	    2       2	    DarkGreen
	"	    3       6	    DarkCyan
	"	    4       1	    DarkRed
	"	    5       5	    DarkMagenta
	"	    6       3	    Brown
	"	    7       7	    LightGray, LightGrey, Gray, Grey
	"	    8	    0*	    DarkGray, DarkGrey
	"	    9	    4*	    Blue, LightBlue
	"	    10	    2*	    Green, LightGreen
	"	    11	    6*	    Cyan, LightCyan
	"	    12	    1*	    Red, LightRed
	"	    13	    5*	    Magenta, LightMagenta
	"	    14	    3*	    Yellow
	"	    15	    7*	    White
	"
	"	The number under "NR-16" is used for 16-color terminals ('t_Co'
	"	greater than or equal to 16).  The number under "NR-8" is used for
	"	8-color terminals ('t_Co' less than 16).  The '*' indicates that the
	"	bold attribute is set for ctermfg.  In many 8-color terminals (e.g.,
	"	"linux"), this causes the bright colors to appear.  This doesn't work
	"	for background colors!  Without the '*' the bold attribute is removed.
	"	If you want to set the bold attribute in a different way, put a
	"	"cterm=" argument AFTER the "ctermfg=" or "ctermbg=" argument.  Or use
	"	a number instead of a color name.

	"hi SpecialKey     term=bold  ctermfg=4
	"hi NonText        term=bold  cterm=bold  ctermfg=4
	"hi Directory      term=bold  ctermfg=4
	"hi ErrorMsg       term=standout  cterm=bold  ctermfg=7  ctermbg=1
	"hi IncSearch      term=reverse  cterm=reverse
	"hi Search         term=reverse  ctermbg=3
	"hi MoreMsg        ctermfg=2
	"hi ModeMsg        term=bold  cterm=bold
	"hi LineNr         term=underline  ctermfg=3
	"hi Question       term=standout  ctermfg=2
	"hi StatusLine     term=bold,reverse  cterm=bold,reverse
	"hi StatusLineNC   term=reverse  cterm=reverse
	"hi Title          term=bold  ctermfg=5
	"hi Visual         term=reverse  cterm=reverse
	"hi VisualNOS      term=bold,underline  cterm=bold,underline
	"hi WarningMsg     term=standout  ctermfg=1
	"hi WildMenu       term=standout  ctermfg=0  ctermbg=3
	hi Comment        term=NONE  ctermfg=DarkGreen gui=NONE guifg=DarkGreen
	hi Constant       term=NONE ctermfg=DarkRed gui=NONE guifg=DarkRed
	"hi Special        ctermfg=5
	"hi Identifier     term=underline  ctermfg=6
	hi Identifier     ctermfg=Cyan
	hi Statement      ctermfg=Yellow
	"hi PreProc        ctermfg=5
	hi Type           ctermfg=Green
	"hi Ignore         cterm=bold  ctermfg=7
	"hi Error          term=reverse  cterm=bold  ctermfg=7  ctermbg=1
	"hi Todo           term=standout  ctermfg=0  ctermbg=3
	"hi String         links to Constant
    "hi String         cterm=NONE ctermfg=DarkRed gui=NONE guifg=DarkRed
	"hi Character      links to Constant
	"hi Number         links to Constant
	"hi Boolean        links to Constant
	"hi Float          links to Number
	"hi Function       links to Identifier
	"hi Conditional    links to Statement
	"hi Repeat         links to Statement
	"hi Label          links to Statement
	"hi Operator       links to Statement
	"hi Keyword        links to Statement
	"hi Exception      links to Statement
	"hi Include        links to PreProc
	"hi Define         links to PreProc
	"hi Macro          links to PreProc
	"hi PreCondit      links to PreProc
	"hi StorageClass   links to Type
	"hi Structure      links to Type
	"hi Typedef        links to Type
	"hi Tag            links to Special
	"hi SpecialChar    links to Special
	"hi Delimiter      links to Special
	"hi SpecialComment links to Special
	"hi Debug          links to Special

endif
