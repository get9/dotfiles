"Basic editor settings
set nocompatible            "disable vi compatibility
set backupdir=~/.vim/backup "directory for ~ files
set directory=~/.vim/swp    "directory for .swp files
set backspace=2             "enables normal backspace behavior
set backspace=indent,eol,start
set paste                   "enables normal behavior of pasting

"Filetype-specifics (note this HAS to be turned back on for vundle to work)
filetype plugin indent on

"Regex
set magic

"Colors
syntax on
set background=dark
set t_Co=256
colorscheme molokai

"Searching
set ignorecase  "searching: automatically ignore case
set smartcase   "searching: if searching for word with caps, disable ignorecase
set hlsearch

"Disable that goddamn bell
set noerrorbells
set novisualbell
set t_vb=
autocmd! GUIEnter * set vb t_vb=

"Tab completion of filenames
set wildmode=longest,list,full  "search preferences for tab completion
set wildmenu            "enable tab completion

"Code settings
set foldmethod=indent   "automatic folding based on indentation
set foldignore=         "enable folding of '#' comments
set nofoldenable        "disable automatic folding on open. close fold with zc.
set number              "displays line numbers

"Tab behavior. Set to 4 spaces.
set shiftwidth=4
set expandtab
set tabstop=4
set softtabstop=4
set smarttab

"ctags configuration
set tags=tags;/     "look for tags folder in current working directory, then look
                    "all the way up to the root directory
