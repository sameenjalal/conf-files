"Notes {
" This is the personal vimrc for Sameen Jalal
" It is a dynamic vimrc that fits my own idiosyncrasies
" 
" You can reach me at <pokemon.trainer@rutgers.edu>
"}

" Environment {

    set nocompatible            " Lets you not have to worry about old Vi bugs
    filetype plugin indent on   " Automatically detect file types.
    syntax on                   " syntax highlighting
    set mouse=a                 " automatically enable mouse usage
    set autochdir              " always switch to the current file directory.. Messes with some plugins, best left commented out
    scriptencoding utf-8

    " set autowrite                  " automatically write a file when leaving a modified buffer
    set history=2000                " Store a ton of history (default is 20)
    set spell                       " spell checking on

    "Tab Configuration {
        map tn :tabnew<cr>
        map te :tabedit
        map tc :tabclose<cr>
        map tm :tabmove
    "}

" }

" Vim UI {
    set tabpagemax=15               " only show 15 tabs
    set showmode                    " display the current mode

    set cursorline                  " highlight current line
    hi cursorline guibg=#333333     " highlight bg color of current line
    hi CursorColumn guibg=#333333   " highlight cursor

    "if has('cmdline_info')
    "    set ruler                   " show the ruler
    "    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
    "endif

    if has('statusline')
        set laststatus=2

        " Broken down into easily includeable segments
        set statusline=%<%f\   " Filename
        set statusline+=%w%h%m%r " Options
        set statusline+=\ [%{&ff}/%Y]            " filetype
        set statusline+=\ [%{getcwd()}]          " current dir
        set statusline+=\ [A=\%03.3b/H=\%02.2B] " ASCII / Hexadecimal value of char
        set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
    endif

    set nu                          " Line numbers on
    set showmatch                   " show matching brackets/parenthesis
    set incsearch                   " find as you type search
    set hlsearch                    " highlight search terms
    set ignorecase                  " case insensitive search
    set wildmenu                    " show list instead of just completing
    set wildmode=list:longest,full  " comand <Tab> completion, list matches, then longest common part, then all.
    set whichwrap=b,s,h,l,<,>,[,]   " backspace and cursor keys wrap to
    set foldenable                  " auto fold code
" }

" Formatting {
    "set nowrap                      " wrap long lines
    set autoindent                  " indent at the same level of the previous line
    set shiftwidth=4                " use indents of 4 spaces
    set tabstop=4                   " an indentation every four columns
    set softtabstop=4               " let backspace delete indent
    set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)
    "set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks
    " Remove trailing whitespaces and ^M chars
    autocmd FileType c,cpp,java,php,js,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
" }

" Key (re)Mappings {

    "The default leader is '\', but many people prefer ',' as it's in a standard
    "location
    let mapleader = ','

    " Stupid shift key fixes
    cmap W w                        
    cmap WQ wq
    cmap wQ wq
    cmap wQ wq
    cmap Q q
    cmap Tabe tabe

    " Shortcuts
    " Change Working Directory to that of the current file
    cmap cwd lcd %:p:h
    cmap cd. lcd %:p:h

    " For when you forget to sudo.. Really Write the file.
    cmap w!! w !sudo tee % >/dev/null
" }

" Plugins {

    " AutoCloseTag {
        " Make it so AutoCloseTag works for xml and xhtml files as well
        au FileType xhtml,xml ru ftplugin/html/autoclosetag.vim
    " }
" }
