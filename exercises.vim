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

" 16.1
" Create operator-pending mapping for 'in immediate markdown heading or sub-heading'
onoremap ih :<c-u>execute "normal! ?^\\(==\\+\\)\\\|\\(--\\+\\)$\r:nohlsearch\rkvg_"<cr>

" 16.2
" Create operator-pending mapping for 'around immediate markdown heading or sub-heading'
onoremap ah :<c-u>execute "normal! ?^\\(==\\+\\)\\\|\\(--\\+\\)$\r:nohlsearch\rg_vk0"<cr>

" 16.3
" Create operator-pending mapping for 'in next email address'
" NOTE: The mapping below is based on 'ordinary' email addresses and does not support the full specification.
"       It ought to be good enough for everyday use for most people.
onoremap in@ :<c-u>execute "normal! /\\([.-]\\\|\\w\\)\\+@\\(\\w\\)\\+\\.\\(\\w\\)\\+\r:nohlsearch\rviW"<cr><cr>

" 17.1
" Add some lines to your ~/.vimrc file to build yourself a custom status line
" Using the commands below will make the status line look like:
" MODE:n  EDITING: ~/.vim/vimrc on raspberrypi              LOCATION: 36/122=29%
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
" a space at the end to make things look prettier
set statusline+=\ 

" 17.2
" Try using autocommands and setlocal to define different statuslines for different filetypes
" I couldn't really think of anything better than displaying how single-line and multi-line comments
" are written in Haskell files (it's definitely more practical to just use a mapping)
" The command below displays the way single-line comments are written
autocmd FileType haskell setlocal statusline=SINGLE\ LINE\ COMMENT\ --
" Align all subsequent statusline additions to the right
autocmd FileType haskell setlocal statusline+=%=
" The command below displays the way multi-line comments are written
autocmd FileType haskell setlocal statusline+=MULTI\ LINE\ COMMENT\ \{-\|...-\}

" 18.1
" Create a git or mercurial repository, move your vimrc file into it and put it on GitHub so that people
" can look at it and get ideas for their own
" CHECK my_vimrc.vim IN THIS REPOSITORY FOR THE CONTENTS OF MY CONFIGURATION FILE, WITH EXPLANATORY COMMENTS

" 19.1
" Try setting a boolean option like wrap to something other than 0 or 1
" What happens when you set it to a different number? What happens when you set it to a string?
" NUMBER: Setting wrap to any number other than 0 activates the wrap feature
" STRING: Setting it to a string (say, "alpha") results in the following error- 
" Number required: &wrap = 'alpha'

" 27.1
" Run :echo split('1 2') and :echo split('1,,,2', ','). Do they behave the same?
" No, they don't. The former evaluates to ['1', '2'] and the latter to ['1','','','2']

" 28.1
" Add a mapping to your vim configuration file that opens the previous buffer in a split of your choosing
" (horizontal/vertical, left/right/top/bottom)
nnoremap <leader>ep :execute "topleft split " . bufname("#") <cr>

" 29.1
" Try to make a mapping that will let you delete two lines but undo each deletion separately
nnoremap <leader>D ddi<C-G>u<esc>dd

" 31.1
" Edit your vim config file to add a mapping that will use match to highlight trailing whitespace
" as an error
nnoremap <leader>w :match Error /\s\+$/<cr>

" 31.2
" Add another mapping that will clear the match
nnoremap <leader>W :match none<cr>

" 31.3
" Add a normal mode mapping that will automatically insert the \v for you whenever you begin
" a search
" NOTE: I added one mapping for forward search and one for backward search
nnoremap / /\v
nnoremap ? ?\v

" 31.4
" Add a mapping to "stop highlighting items from the last search" to your vim config file
nnoremap \H :nohlsearch<cr>

" 32.1
" Add a height to the :copen command in the grep operator to make sure the quickfix window is opened
" to whatever height you prefer
nnoremap <leader>g :silent execute "grep! -R " . shellescape(expand("<cWORD>")) . " ."<cr>:copen 5<cr>

" 44.1
" Modify the Potion plugin's ftdetect/potion.vim script to use setfiletype instead of set filetype
au BufNewFile,BufRead *.pn setfiletype potion

" 46.1
" Read the Potion docs and make a conscious decision about whether to make : an operator.
" If you decide to do so, add it to the syntax file
" I DON'T WANT TO CALL IT AN OPERATOR.
" I believe that for : to be an operator, it has to (at least) be a Potion function that takes
" one or more Potion datatype values (primitive or user-defined) and outputs a value of a
" Potion datatype. It doesn't fulfil this requirement.

" 46.2
" Read the Potion docs and make a conscious decision about whether to make . an operator.
" If you decide to do so, add it to the syntax file
" I DON'T WANT TO CALL IT AN OPERATOR.
" It's for the same reason that I don't think : is an operator.

" 46.3
" Read the Potion docs and make a conscious decision about whether to make / an operator.
" If you decide to do so, add it to the syntax file
" I WANT TO CALL THIS ONE AN OPERATOR.
" / acts like a function that takes an 'instance' of a class and a string, and returns
" the value of the property of the instance with the same name as the string
" Basically it's like an accessor function, so I'm perfectly happy calling it an operator
" What's odd is that it's already being highlighted as the division operator so I'm not changing anything

" 46.4
" Add a syntax group PotionNumber that highlights numbers. Link it to the highlight group Number.
" supports numbers like 123, 456, 10
syntax match potionNumber "\v\d+"
" supports numbers like 0xefef
syntax match potionNumber "\v0x\x+"
" supports numbers like 1e+10, 515e-2
syntax match potionNumber "\v\d+e[+-]\d+"
" supports numbers like 1.21, 3.141, 2.0
syntax match potionNumber "\v\d+\.\d+"
" supports numbers like 1.21e-1, 10.1e+3
syntax match potionNumber "\v\d+\.\d+e[+-]\d+"
" links the syntax group to the highlight group
highlight link potionNumber Number

" 47.1
" Add syntax highlighting for single-quoted strings
syntax region potionString start=/\v'/ skip=/\v''/ end=/\v'/
