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

    " For when you forget to sudo.. Really Write the file.
        cmap w!! w !sudo tee % >/dev/null

    " Snobby way to press Escape: press jj
    imap jj <Esc>
" }

" Vim UI {
    set tabpagemax=15       " only show 15 tabs
    set showmode            " display the current mode

    colorscheme jellybeans  " Set the colorscheme

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
        set foldmethod=indent       " fold based on indent
        set foldnestmax=10          " deepest fold is 10 levels
        set nofoldenable            " dont fold by default
        " set foldenable            " auto fold code
        set foldlevel=1             " preference
    " }

    " Environment {
        set nocompatible            " Lets you not have to worry about old Vi bugs
        filetype plugin indent on   " Automatically detect file types.
        syntax on                   " syntax highlighting
        set mouse=a                 " automatically enable mouse usage
        set autochdir               " always switch to the current file directory.. Messes with some plugins, best left commented out
        scriptencoding utf-8
        set smartindent
        set smartcase
        set autoindent
        set nohlsearch

        "set comments=sl:/*,mb:*,elx:*/ " auto format comment blocks
        "" Remove trailing whitespaces and ^M chars
        autocmd FileType c,cpp,java,php,js,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

        " Set autowrite             " automatically write a file when leaving a modified buffer
        set history=2000            " Store a ton of history (default is 20)
        set spell                   " spell checking on
        set number                  " Set numbers to show
        set tabstop=4               " Set tab to skip 4 spaces
        set shiftwidth=4
        set expandtab
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

    " Conque term mappings
    map bs :ConqueTermSplit bash<cr>
    map bv :ConqueTermVSplit bash<cr>
" }
