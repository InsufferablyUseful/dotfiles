"    an arcane invocation that converts tabs to spaces consistently 
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
"    break lines on whitespace instead of last fitting character. Visual only does not insert EOLs
set linebreak
syntax on
set smartcase "Ignore case in search text
set ignorecase "Override smartcase if search text contains uppercase characters
set noerrorbells "This removes vim's default error bell, turning it off so that it doesn't annoy us 
set textwidth=100 "Ensures that each line is not longer than 100 columns 
set spell "Enable spellchecking 
set wrap
nnoremap <F5> :set linebreak<CR>
nnoremap <C-F5> :set nolinebreak<CR>
set undolevels=1000
set confirm "   show confirmation dialog instead of automatic fail for stuff like quit without save
set ruler
set backspace=indent,eol,start 

call plug#begin('~/.config/nvim/plugged')

" install gruvbox
Plug 'gruvbox-community/gruvbox'
Plug 'dpelle/vim-LanguageTool'
Plug 'ron89/thesaurus_query.vim' 
Plug 'junegunn/goyo.vim' 
Plug 'junegunn/limelight.vim' 
Plug 'reedes/vim-pencil' 
Plug 'reedes/vim-wordy'

call plug#end()

colorscheme gruvbox
set background=light   " Setting light mode
set termguicolors
