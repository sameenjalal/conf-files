"Notes {
    " This is the personal vimrc for Sameen Jalal
    " It is a dynamic vimrc that fits my own idiosyncrasies
    "
    " You can reach me at <pokemon.trainer@rutgers.edu>
" }

" Statusline {
    " Always hide the statusline
    set laststatus=2

    " Format the statusline
    " set statusline=\ %F%m%r%h\ %w\ Line:\ %l/%L:%c
    set statusline=\ %F%m%r%h\ %w
" }

" Key Mappings {
    "The default leader is '\', but many people prefer ',' as it's in a standard location
    let mapleader = ','

    " Stupid shift key fixes
    cmap W w
    cmap WQ wq
    cmap wQ wq
    cmap wQ wq
    cmap Q q
    cmap Tabe tabe

    "Tab Configuration {
        map tn :tabnew<cr>
        map te :tabedit
        map tc :tabclose<cr>
        map tm :tabmove
    "}

    " Shortcuts
    " Change Working Directory to that of the current file
    cmap cwd lcd %:p:h
    cmap cd. lcd %:p:h

	" Split Window Management {
		map - <C-W>-
		map + <C-W>+
		map = <C-W>=
	" }

    " For when you forget to sudo.. Really Write the file.
    cmap w!! w !sudo tee % >/dev/null

    " Snobby way to press Escape: press jj
    imap jj <Esc>
" }

" Vim UI {
    set tabpagemax=15       " only show 15 tabs
    set showmode            " display the current mode

    " Color schemes: {
        colorscheme jellybeans  " Set the colorscheme
        " colorscheme desert      " Set the colorscheme
        " colorscheme inkpot      " Set the colorscheme
        " colorscheme lettuce     " Set the colorscheme
        " colorscheme rdark       " Set the colorscheme
        " colorscheme sorcerer    " Set the colorscheme
        " colorscheme wombat      " Set the colorscheme
        " colorscheme zenburn     " Set the colorscheme
    " }

    set cursorline                  " highlight current line
    hi cursorline guibg=#333333     " highlight bg color of current line
    hi CursorColumn guibg=#333333   " highlight cursor
    let &t_Co=256

    if has('cmdline_info')
        set ruler                                           " show the ruler
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)  " a ruler on steroids
    endif

    if has('statusline')
        set laststatus=2

        " Broken down into easily includeable segments
        set statusline=%<%f\                        " Filename
        set statusline+=%w%h%m%r                    " Options
        " set statusline+=\ [%{&ff}/%Y]             " filetype
        set statusline+=\ [%{getcwd()}]             " current dir
        set statusline+=\ [A=\%03.3b/H=\%02.2B]     " ASCII / Hexadecimal value of char
        set statusline+=%=%-14.(%l,%c%V%)\ %p%%     " Right aligned file nav info
    endif

    set nu                          " Line numbers on
    set showmatch                   " show matching brackets/parenthesis
    set incsearch                   " find as you type search
    set hlsearch                    " highlight search terms
    set ignorecase                  " case insensitive search
    set wildmenu                    " show list instead of just completing
    set wildmode=list:longest,full  " comand <Tab> completion, list matches, then longest common part, then all.
    set whichwrap=b,s,h,l,<,>,[,]   " backspace and cursor keys wrap to

    " Fold settings {
        " set foldmethod=indent       " fold based on indent
        " set foldmethod=syntax       " fold based on syntax
        " set foldnestmax=1             " deepest fold is 10 levels
        " set nofoldenable              " dont fold by default
        " set foldenable              " auto fold code
        " set foldlevel=1             " preference

        function ToggleFold()
           if foldlevel('.') == 0
              " No fold exists at the current line,
              " so create a fold based on indentation
 
              let l_min = line('.')   " the current line number
              let l_max = line('$')   " the last line number
              let i_min = indent('.') " the indentation of the current line
              let l = l_min + 1

              " Search downward for the last line whose indentation > i_min
              while l <= l_max
                 " if this line is not blank ...
                 if strlen(getline(l)) > 0 && getline(l) !~ '^\s*$'
                    if indent(l) <= i_min
                       " we've gone too far
                       let l = l - 1    " backtrack one line
                       break
                    endif
                 endif
                 let l = l + 1
              endwhile
 
              " Clamp l to the last line
              if l > l_max
                 let l = l_max
              endif

              " Backtrack to the last non-blank line
              while l > l_min
                 if strlen(getline(l)) > 0 && getline(l) !~ '^\s*$'
                    break
                 endif
                 let l = l - 1
              endwhile

              "execute "normal i" . l_min . "," . l . " fold"   " print debug info
 
              if l > l_min
                 " Create the fold from l_min to l
                 execute l_min . "," . l . " fold"
              endif
           else
              " Delete the fold on the current line
              normal zd
           endif
        endfunction

        nmap za :call ToggleFold()<CR>
    " }

    " Environment {
        set nocompatible            " Lets you not have to worry about old Vi bugs
        filetype plugin indent on   " Automatically detect file types.
        syntax on                   " syntax highlighting
        set mouse=a                 " automatically enable mouse usage
        set autochdir               " always switch to the current file directory.. Messes with some plugins, best left commented out
        scriptencoding utf-8
		set encoding=utf-8 			" Set the default file encoding to UTF-8: 

        set smartindent
        set smartcase
        set autoindent
        set nohlsearch

        "set comments=sl:/*,mb:*,elx:*/ " auto format comment blocks
        "" Remove trailing whitespaces and ^M chars
        autocmd FileType c,cpp,java,php,js,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

        " Set autowrite             " automatically write a file when leaving a modified buffer
        set history=2000            " Store a ton of history (default is 20)
        " set spell                   " spell checking on
        set number                  " Set numbers to show
        set tabstop=4               " Set tab to skip 4 spaces
        set shiftwidth=4
        " set expandtab
        syntax on

        set pastetoggle=<F2>        " Press F2 to paste
        filetype indent on
        filetype plugin on
    " }

    " IMPORTANT: grep will sometimes skip displaying the file name if you
    " search in a singe file. This will confuse Latex-Suite. Set your grep
    " program to always generate a file-name.
    set grepprg=grep\ -nH\ $*

    " OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
    " 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
    " The following changes the default filetype back to 'tex':
    let g:tex_flavor='latex'
" }

" Plugins {
    " NERDTree Code {
        " Open NERDTree upon opening vim
        function OpenNERDTree()
            execute ":NERDTree"
        endfunction
        command -nargs=0 OpenNERDTree :call OpenNERDTree()

        " NERDTree mappings
        map <ESC>t :OpenNERDTree<CR>
        map nt :NERDTree .<cr>
    " }

    " Conque term mappings {
        map bs :ConqueTermSplit bash<cr>
        map bv :ConqueTermVSplit bash<cr>
    " }

    " PhpFolding mappings {
        " map za <Esc>:EnableFastPHPFolds<Cr>
        " map zm <Esc>:EnablePHPFolds<Cr>
        " map zr <Esc>:DisablePHPFolds<Cr> 
    " }
" }

" Python and C Settings {
	" Number of spaces that a pre-existing tab is equal to.
	" For the amount of space used for a new tab use shiftwidth.

	au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=8

	" What to use for an indent.
	" This will affect Ctrl-T and 'autoindent'.
	" Python: 4 spaces
	" C: tabs (pre-existing files) or 4 spaces (new files)
	au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
	au BufRead,BufNewFile *.py,*.pyw set expandtab
	fu Select_c_style()
		if search('^\t', 'n', 150)
			set shiftwidth=8
			set noexpandtab
		el 
			set shiftwidth=4
			set expandtab
		en
	endf
	au BufRead,BufNewFile *.c,*.h call Select_c_style()
	au BufRead,BufNewFile Makefile* set noexpandtab

	" Use the below highlight group when displaying bad whitespace is desired.
	highlight BadWhitespace ctermbg=red guibg=red

	" Display tabs at the beginning of a line in Python mode as bad.
	au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
	" Make trailing whitespace be flagged as bad.
	au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

	" Wrap text after a certain number of characters
	" Python: 79 
	" C: 79
	au BufRead,BufNewFile *.py,*.pyw,*.c,*.h set textwidth=79

	" Turn off settings in 'formatoptions' relating to comment formatting.
	" - c : do not automatically insert the comment leader when wrapping based on
	"    'textwidth'
	" - o : do not insert the comment leader when using 'o' or 'O' from command mode
	" - r : do not insert the comment leader when hitting <Enter> in insert mode
	" Python: not needed
	" C: prevents insertion of '*' at the beginning of every line in a comment
	au BufRead,BufNewFile *.c,*.h set formatoptions-=c formatoptions-=o formatoptions-=r

	" Use UNIX (\n) line endings.
	" Only used for new files so as to not force existing files to change their
	" line endings.
	" Python: yes
	" C: yes
	au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

	" For full syntax highlighting:
	let python_highlight_all=1
	syntax on

" } End Python and C settings
