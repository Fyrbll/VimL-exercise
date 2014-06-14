" Vimscript exercises while reading 'Learn Vimscript the Hard Way'

" 1.1
" Add a line to your ~/.vimrc file that displays a friendly ASCII-art cat (>^.^<) whenever you open Vim.
echo "(>^.^<)"

" 3.1
" Map the '-' key to delete the current line, then paste it below the one we're on now.
map - dd p

" 3.2
" map the '_' key to move the line up instead of down.
map _ dd P

" 3.3
" how you might remove a mapping and reset a key to its normal function.
" btw this is not the right way to do this everytime, it also depends on mode
unmap <key>

" Some Problem with 4.1 and 4.2 ?

" 4.1
" Set up a mapping so that you can press <c-u>(Ctrl+u) to convert the current word to uppercase when you're in insert mode.
imap <c-u> <esc>bveUi

" 4.2
" Set up a mapping so that you can uppercase the current word with <c-u> when in normal mode.
nmap <c-u> bveU<esc>

" 9.1
" Create a mapping to wrap current word in single quotes in normal mode
" hyphen ahead is <leader> here
nnoremap -' lbi'<esc>eli'<esc>

" 9.2
" Map H in normal mode to go to the beginning of the current line.
nnoremap H 0

" 9.3
" Map L in normal mode to go to the end of the current line.
nnoremap L $

" 15.1
" Create operator-pending mappings for around next parentheses
" ':help omap-info' helped me with the ':<c-u>normal!' thing
onoremap an( :<c-u>normal! f(hviw<cr>

" 15.2
" Create operator-pending mappings for around last parentheses
onoremap al( :<c-u>normal! F(bviw<cr>

" 15.3
" Create operator-pending mappings for in next curly brackets
onoremap in{ :<c-u>normal! f{vi{<cr>

" 15.4
" Create operator-pending mappings for in last curly brackets
onoremap il{ :<c-u>normal! F}vi{<cr>

" 15.5
" Create operator-pending mappings for around next curly brackets
onoremap an{ :<c-u>normal! f{hviw<cr>

" 15.6
" Create operator-pending mappings for around last curly brackets
onoremap al{ :<c-u>normal! F{bviw<cr>
