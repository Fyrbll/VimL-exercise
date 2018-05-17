" various options ------ {{{
" turns on syntax highlighting
syntax on
" sets the colorscheme to peachpuff
colorscheme peachpuff
" makes one press of the tab key count as 2 spaces
set tabstop=2
" disables the soft tabstop feature
set softtabstop=0
" makes each 'indent text' command shift the text by 2 spaces
set shiftwidth=2
" disables text wrapping
set nowrap
" colors the 81st column red so that I know if a line is longer than 80
" characters
set colorcolumn=81
" shows a line number before each line
set number
" copies indent from current line when starting a new line
set autoindent
" performs smart autoindenting at the start of a new line
set smartindent
" highlights the next match for the search pattern entered so far
set incsearch
" stores the past 1000 commands 
set history=1000
" puts yanked text into the * register instead of the unnamed register
set clipboard=unnamed
" indicates that text colors should be adjusted for a dark background
set background=dark
" shows the status line in all situations (even when only one window is open)
set laststatus=2
" }}}

" statusline definition ------ {{{
" display the current mode (i for insert, v for visual, n for normal, ...)
set statusline=MODE:%-2{mode()}
" display the name of the file in the current buffer
set statusline+=\ EDITING:\ %f
" display the name of the machine we're using vim on
set statusline+=\ on\ %{hostname()}
" display a + if the buffer has been edited since the last time it was written
set statusline+=%M
" align all subsequent statusline additions to the right
set statusline+=%=
" display the number of the current line and the total number of lines
set statusline+=LOCATION:\ %l/%-L
" display the fraction of the lines in the file that are above the cursor
" basically <current line>/<total lines> as a percentage
set statusline+==%p%%
" a space at the end to make things look pretty
set statusline+=\ 
" }}}

" leaders ------ {{{
let mapleader = "\\"
" makes - the local leader, in other words a leader intended to be
" used for buffer-local commands (e.g. filetype-based commands)
let maplocalleader = "-"
" }}}

" global vim mappings ------ {{{
" deletes a line
nnoremap <leader>d dd
" clears a line
nnoremap <leader>c ddO
" swaps the current line with the one below it
nnoremap <leader>- ddp
" swaps the current line with the one above it
nnoremap <leader>+ ddkP
" opens vim configuration file for editing
nnoremap <leader>ev :split $MYVIMRC<cr>
" processes vim configuration file to apply changes
nnoremap <leader>sv :source $MYVIMRC<cr>
" opens bash configuration file for editing
nnoremap <leader>eb :split ~/.bashrc<cr>
" puts double quotes around the word the cursor is in
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
" puts single quotes around the word the cursor is in
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
vnoremap <leader>" <esc>`<i"<esc>`>la"<esc>
" this allows me to close a buffer opened in a horizontally split window
" without leaving the split view
nnoremap <leader>bd :w<cr>:bd<cr>:split<cr>
" moves to the beginning of the current line
nnoremap H ^
" moves to the end of the current line
nnoremap L $
" }}}

" abbreviations ------ {{{
" corrects 'adn' to 'and'
iabbrev adn and
" corrects 'waht' to 'what'
iabbrev waht what
" corrects 'tehn' to 'then'
iabbrev tehn then
" inserts an email address
iabbrev @@ localname@domain.com
" inserts some copyright information
iabbrev ccopy Copyright 2018 Firstname Lastname, all rights reserved
" inserts a 'signature'
iabbrev ssig <cr>Firstname Lastname<cr>localname@domain.com
" shorthand for importing Haskell's Data.Sequence module
iabbrev impseq import Data.Sequence (<cr>                     )
" shorthand for importing Haskell's Data.List module
iabbrev implst import Data.List (<cr>                 )
" }}}

" html file commands ------ {{{
augroup filetype_html
autocmd!
" html-comment a line and move the cursor one line down from the commented 
" line
autocmd FileType html nnoremap <buffer> <localleader>c I<!--<esc>A--><esc>j
" convert a single word into opening and closing tags on the same line
autocmd FileType html nnoremap <buffer> <localleader>t viwyi<<esc>`>la></<esc>pa><esc>2ba
" convert a single word into opening and closing tags on different lines
autocmd FileType html nnoremap <buffer> <localleader>T viwyi<<esc>lviw<esc>a><cr><cr></<esc>pa><esc>ki
" inserts the html escape sequence for <
autocmd FileType html inoremap <buffer> <localleader>< &lt;
" inserts the html escape sequence for >
autocmd FileType html inoremap <buffer> <localleader>> &gt;
" replaces the word imgelt with a src and alt attributed img element
autocmd FileType html iabbrev <buffer> imgelt <img src="" alt="">
" replaces the word aelt with an href attributed anchor element
autocmd FileType html iabbrev <buffer> aelt <a href=""></a>
" folds the innermost tag that contains the cursor
" note that nothing happens if the tag is opened and closed on the same line
autocmd FileType html nnoremap <buffer> <localleader>f Vatzf
augroup END
" }}}

" haskell file commands ------ {{{
augroup filetype_haskell
autocmd!
" haskell-comment a line then move the cursor down one line
autocmd FileType haskell nnoremap <buffer> <localleader> I--<esc>j
" the following lines define a unique statusline for haskell
autocmd FileType haskell setlocal statusline=SINGLE\ LINE\ COMMENT\ --
autocmd FileType haskell setlocal statusline+=%=
autocmd FileType haskell setlocal statusline+=MULTI\ LINE\ COMMENT\ \{-\|...-\}
augroup END
" }}}

" markdown file commands ------ {{{
augroup filetype_markdown
autocmd!
" operator-pending mapping to operate on the current paragraph's
" immediate heading but not the dashes (works for = and - headings)
autocmd FileType markdown onoremap <buffer> ih :<c-u>execute "normal! ?^\\(==\\+\\)\\\|\\(--\\+\\)$\r:nohlsearch\rkvg_"<cr>
" operator-pending mapping to operate on the current paragraph's
" immediate heading and the dashes that declare it to be a heading
" (works for = and - headings)
autocmd FileType markdown onoremap <buffer> ah :<c-u>execute "normal! ?^\\(==\\+\\)\\\|\\(--\\+\\)$\r:nohlsearch\rg_vk0"<cr>
augroup END
" }}}

" other file commands ------ {{{
augroup filetype_all
" operator-pending mapping to operate on the next email address
autocmd BufNewFile,BufReadPre * onoremap <buffer> in@ :<c-u>execute "normal! /\\([.-]\\\|\\w\\)\\+@\\(\\w\\)\\+\\.\\(\\w\\)\\+\r:nohlsearch\rviW"<cr><cr>
augroup END
" }}}

" vimscript file settings ------ {{{
augroup filetype_vim
" remove all previously-defined autocommands in the group
autocmd!
" in vim files, use marker-based folds (press 'za' to fold/unfold a section)
autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}
