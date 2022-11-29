syntax on

set laststatus=2   "make the little ruler bar at the bottom always show up
set ruler          "show the little line,char thing
set showcmd        "display useful stuff while in visual line mode
set visualbell     "flash the screen instead of beeping at me

set scrolloff=10   "provide n lines of context above and below current line
set nowrap         "don't make long lines ugly
set sidescroll=0   "horizontal scroll
set wrapmargin=0   "fit text to the current window with n padding characters

set ignorecase     "provide a more useful search capability
set smartcase      "do it case-sensitive if the search has mixed case
"set hlsearch       "highlight all search results
"set incsearch      "show incremental search results as you type

set shiftwidth=2   "shift n characters left or right using < or >
set tabstop=2      "show tabs as n spaces wide
set expandtab      "turn all those pesky tabs into space characters

set noautoindent   "don't do that annoying thing when pasting text with mouse
set nosmartindent  "and certainly don't do it after { or } either
"set nocindent

"set noswapfile     "whoa, really?

"runtime syntax/tf.vim  "all HCL2 FFS
autocmd BufRead,BufNewFile *.hcl set filetype=tf
autocmd BufRead,BufNewFile *.tf set filetype=tf
autocmd BufRead,BufNewFile *.tfvars set filetype=tf
