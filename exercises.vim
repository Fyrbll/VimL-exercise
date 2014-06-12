" Vimscript exercises while reading 'Learn Vimscript the Hard Way'

" 1.1
" Add a line to your ~/.vimrc file that displays a friendly ASCII-art cat (>^.^<) whenever you open Vim.
echo "(>^.^<)"

" 3.1
" Map the '-' key to delete the current line, then paste it below the one we're on now.
:map - dd p

" 3.2
" map the '_' key to move the line up instead of down.
:map _ dd P

" 3.3
" how you might remove a mapping and reset a key to its normal function.
" btw this is not the right way to do this everytime, it also depends on mode
:unmap <key>

" 4.1
" Set up a mapping so that you can press <c-u>(Ctrl+u) to convert the current word to uppercase when you're in insert mode.
:imap <c-u> <esc>bveUi

" 4.2
" Set up a mapping so that you can uppercase the current word with <c-u> when in normal mode.
:nmap <c-u> bveU<esc>
