command! Config execute ':tabnew ~/.vimrc'
command! Reload execute 'source ~/.vimrc'

"""""""""""""PLUGIN RELATED"""""""""""""""""""""
" Curl command to download vim-plug
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/vim-plug/plugged')
Plug 'preservim/nerdtree'                 " file explorer
Plug 'jiangmiao/auto-pairs'               " gives opening and closing braces together
Plug 'preservim/nerdcommenter'            " comments a lot of lines together
Plug 'itchyny/lightline.vim'              " Status line in vim -- just for appreance
Plug 'morhetz/gruvbox'                    " Colorscheme in vim -- just for appreance
Plug 'preservim/tagbar'                   " to displaf function in a class
Plug 'Yggdroot/indentLine'                " show indentation
Plug 'frazrepo/vim-rainbow'               " highlight matching braces
Plug 'tpope/vim-fugitive'                 " Git Commands in vim
Plug 'airblade/vim-gitgutter'             " shows lines that are changed with + - symbols next to line number
Plug 'kien/ctrlp.vim'                     " fuzzy file search
Plug 'sheerun/vim-polyglot'               " syntax highlighting
Plug 'elzr/vim-json'                      " Json key-value pair highlighting
Plug 'edkolev/tmuxline.vim'               " same colorscheme as tmux -- just for appreance
Plug 'w0rp/ale'
Plug 'inkarkat/vim-ingo-library' | Plug 'inkarkat/vim-SpellCheck' " Add spelling errors to the quickfix list (vim-ingo-library is a dependency).
Plug 'machakann/vim-highlightedyank'      " Briefly highlight which text was yanked.
Plug 'junegunn/limelight.vim'             " dim the paragraph which are not in focus
Plug 'alvan/vim-closetag'                 " automatically closes the HTML tag
"Plug 'tpope/vim-surround'
"Plug 'neoclide/coc.nvim', {'branch': 'release'} " needs vim 8.01 +
" Languages and file types.
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'cakebaker/scss-syntax.vim'
Plug 'chr4/nginx.vim'
Plug 'chrisbra/csv.vim'
Plug 'ekalinin/dockerfile.vim'
Plug 'elixir-editors/vim-elixir'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'cespare/vim-toml', { 'branch': 'main' }
Plug 'godlygeek/tabular' | Plug 'tpope/vim-markdown'
"Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }
Plug 'jvirtanen/vim-hcl'
Plug 'lifepillar/pgsql.vim'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'stephpy/vim-yaml'
Plug 'tmux-plugins/vim-tmux'
Plug 'tpope/vim-git'
Plug 'tpope/vim-liquid'
Plug 'tpope/vim-rails'
Plug 'vim-python/python-syntax'
Plug 'vim-ruby/vim-ruby'
Plug 'wgwoods/vim-systemd-syntax'
Plug 'towolf/vim-helm'
Plug 'hashivim/vim-terraform'
Plug 'github/copilot.vim'
call plug#end()

if !exists("g:syntax_on") " if it is not on then only enable else let it be
    syntax enable
endif

let mapleader = '\'
set number
" Line number will be shown in yellow. This conflicts with solarised theme and
" just shows the current line number yellow. Please move it to after the
" plugin settings to have every line number as yellow.
highlight LineNr ctermfg=Yellow
set cursorline
set autoindent
set smarttab
set smartindent
set encoding=utf-8 " Encoding
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Display different types of white spaces.
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noshiftround
set smartcase
set autoread
setlocal spelllang=en_us
set mouse=a "mouse usage everywhere
set showmatch "show matching braces
set nofoldenable
set foldlevel=99
set foldlevelstart=99 "start file with all folds opened
set foldmethod=manual "set fold method so that zf and zo can be used
set nocompatible
set noerrorbells "remove sounds effect
set backspace=indent,eol,start " allow backspacing over everything in insert mode 
set matchpairs+=<:> " Highlight matching pairs of brackets. Use the '%' character to jump between them.
set list " Display different types of white spaces.
set nomodeline
set scrolloff=5 "Display 5 lines above/below the cursor when scrolling with a mouse.
set ttyfast "Speed up scrolling in Vim
set laststatus=2 " Status bar
set so=999 " cursor will always remain in center of screen
set re=1   " set syntax highligh time
"syntax sync minlines=10000

set ic "Case insensitive search
set hlsearch "Highlight matching search patterns
hi Search ctermbg=LightYellow
hi Search ctermfg=Red
hi Visual ctermfg=LightYellow ctermbg=Red
set incsearch " Enable incremental search
set noshowmode "display mode INSERT/REPLACE/..

set updatetime=50 "used for git gutter.
set sessionoptions-=blank
set sessionoptions-=buffers
set sessionoptions-=winsize
set nobackup
set nowritebackup
set hidden

" when tabs are open, movement between tabs [Ctrl]+T plus a directional arrow
map <C-t><up> :tabr<cr>
map <C-t><down> :tabl<cr>
map <C-t><left> :tabp<cr>
map <C-t><right> :tabn<cr>
" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" Helps force plug-ins to load correctly when it is turned back on below.
filetype on
filetype plugin on
filetype plugin indent on

"""""""""""""""Copilot"""""""""""""""
let b:copilot_enabled = 1
let g:copilot_filetypes = {
      \ '*': v:true,
      \ }

"""""""""""""""" nerd tree""""""""""""""""""""""""""
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" close nerdtree if only that is left in vindow
map <C-n> :NERDTreeToggle<CR>
let NERDTreeDirArrowExpandable=">"
let NERDTreeDirArrowCollapsible="v"
"let NERDTreeDirArrows = 1
""""""""""""""""""""""""tagbar""""""""""""""""""""""""
nmap <F8> :TagbarToggle<CR>
""""""""""""""""""""""""Line Light"""""""""""""""""""""""
if !has('gui_running')
      set t_Co=256
endif
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
"""""""""""""""gruvbox"""""""""""""""""""""""
let g:gruvbox_contrast_dark="hard"
let g:gruvbox_number_column="bg1"
colorscheme gruvbox
set background=dark
"""""""""""""""""""""indentline""""""""""""""""""""""""""""
let g:indentLine_color_term = 256
let g:indentLine_setColors = 0
let g:indentLine_enabled = 1
"""""""""""""""""""""vim-rainbow""""""""""""""""""""""""""""
let g:rainbow_active = 1
let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']
""""""""""""""""""""""ctrlp""""""""""""""""""""""""""""""
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/3rdparty/*
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_show_hidden = 1
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
"does not search the entire git repo
"let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
"let g:ctrlp_user_command = ['.git/','git --git-dir=%s/.git ls-files -oc --exclude-standard']
"""""""""""""""""""vim-gitgutter"""""""""""""""""""""""
if has("nvim-0.5.0") || (v:version > 800)
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number " only works with vim8.2
else
  set signcolumn=yes
endif
""""""""""""""""""""""vim-json""""""""""""""""""""""
au! BufRead,BufNewFile *.json set filetype=json
augroup json_autocmd
  autocmd!
  autocmd FileType json set autoindent
  autocmd FileType json set formatoptions=tcq2l
  autocmd FileType json set textwidth=78 shiftwidth=2
  autocmd FileType json set softtabstop=2 tabstop=8
  autocmd FileType json set expandtab
  autocmd FileType json set foldmethod=syntax
augroup END
""""""""""""""""""""""""yaml""""""""""""""""""""""""
au! BufRead,BufNewFile *.yaml set filetype=yaml
augroup yaml_autocmd
  autocmd FileType yaml setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType yaml set foldlevelstart=20
  autocmd FileType yaml let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
  autocmd FileType yaml let g:ale_sign_error = '✘'
  autocmd FileType yaml let g:ale_sign_warning = '⚠'
  autocmd FileType yaml let g:ale_lint_on_text_changed = 'never'
augroup END
""""""""""""""""""""""""""iamcco/markdown-preview.nvim""""""""""""""""""""""""
let g:mkdp_auto_start=1
let g:mkdp_auto_close=0
let g:mkdp_refresh_slow=1
let g:mkdp_browser = ''
let g:mkdp_markdown_css=fnameescape($HOME).'/.cfg/usefulscripts/github-markdown.css'

"""""""""""""""""""""""""LIMELIGHT"""""""""""""""""""""""""
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
let g:limelight_default_coefficient = 0.7
let g:limelight_paragraph_span = 1
let g:limelight_priority = -1
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'
nmap <Leader>l <Plug>(Limelight)
xmap <Leader>l <Plug>(Limelight)

""""""""""""""""COC"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set shortmess+=c " Don't pass messages to |ins-completion-menu|.
""inoremap <silent><expr> <TAB>
      ""\ pumvisible() ? "\<C-n>" :
      ""\ <SID>check_back_space() ? "\<TAB>" :
      ""\ coc#refresh()
""inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

""function! s:check_back_space() abort
  ""let col = col('.') - 1
  ""return !col || getline('.')[col - 1]  =~# '\s'
""endfunction

"" Use <c-space> to trigger completion.
"if has('nvim')
  "inoremap <silent><expr> <c-space> coc#refresh()
"else
  "inoremap <silent><expr> <c-@> coc#refresh()
"endif

"" Make <CR> auto-select the first completion item and notify coc.nvim to
"" format on enter, <cr> could be remapped by other vim plugin
"inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              "\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"" Use `[g` and `]g` to navigate diagnostics
"" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
"nmap <silent> [g <Plug>(coc-diagnostic-prev)
"nmap <silent> ]g <Plug>(coc-diagnostic-next)

"" GoTo code navigation.
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)

"" Use K to show documentation in preview window.
"nnoremap <silent> K :call <SID>show_documentation()<CR>

"function! s:show_documentation()
  "if (index(['vim','help'], &filetype) >= 0)
    "execute 'h '.expand('<cword>')
  "elseif (coc#rpc#ready())
    "call CocActionAsync('doHover')
  "else
    "execute '!' . &keywordprg . " " . expand('<cword>')
  "endif
"endfunction

"" Highlight the symbol and its references when holding the cursor.
"autocmd CursorHold * silent call CocActionAsync('highlight')

"" Symbol renaming.
"nmap <leader>rn <Plug>(coc-rename)

"" Formatting selected code.
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)

"augroup mygroup
  "autocmd!
  "" Setup formatexpr specified filetype(s).
  "autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  "" Update signature help on jump placeholder.
  "autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
"augroup end

"" Applying codeAction to the selected region.
"" Example: `<leader>aap` for current paragraph
"xmap <leader>a  <Plug>(coc-codeaction-selected)
"nmap <leader>a  <Plug>(coc-codeaction-selected)

"" Remap keys for applying codeAction to the current buffer.
"nmap <leader>ac  <Plug>(coc-codeaction)
"" Apply AutoFix to problem on the current line.
"nmap <leader>qf  <Plug>(coc-fix-current)

"" Map function and class text objects
"" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
"xmap if <Plug>(coc-funcobj-i)
"omap if <Plug>(coc-funcobj-i)
"xmap af <Plug>(coc-funcobj-a)
"omap af <Plug>(coc-funcobj-a)
"xmap ic <Plug>(coc-classobj-i)
"omap ic <Plug>(coc-classobj-i)
"xmap ac <Plug>(coc-classobj-a)
"omap ac <Plug>(coc-classobj-a)

"" Remap <C-f> and <C-b> for scroll float windows/popups.
"if has('nvim-0.4.0') || has('patch-8.2.0750')
  "nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  "nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  "inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  "inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  "vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  "vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"endif

"" Use CTRL-S for selections ranges.
"" Requires 'textDocument/selectionRange' support of language server.
"nmap <silent> <C-s> <Plug>(coc-range-select)
"xmap <silent> <C-s> <Plug>(coc-range-select)

"" Add `:Format` command to format current buffer.
"command! -nargs=0 Format :call CocAction('format')

"" Add `:Fold` command to fold current buffer.
"command! -nargs=? Fold :call     CocAction('fold', <f-args>)

"" Add `:OR` command for organize imports of the current buffer.
"command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

"" Add (Neo)Vim's native statusline support.
"" NOTE: Please see `:h coc-status` for integrations with external plugins that
"" provide custom statusline: lightline.vim, vim-airline.
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

"" Mappings for CoCList
"" Show all diagnostics.
"nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
"" Manage extensions.
"nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
"" Show commands.
"nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
"" Find symbol of current document.
"nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
"" Search workspace symbols.
"nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
"" Do default action for next item.
"nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
"" Do default action for previous item.
"nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
"" Resume latest coc list.
"nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wrap!


" set wildmode=longest,full
" This escape sequence is the well known ANSI sequence for
" Remove Character Under The Cursor (RCUTC[tm])
map! <Esc>[3~ <Delete>
map  <ESC>[3~    x

" Only do this part when compiled with support for autocommands.
if has("autocmd") 
  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

endif " has("autocmd")



" Vim's auto indentation feature does not work properly with text copied from outisde of Vim. Press the <F2> key to toggle paste mode on/off.
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>

" Map the <Space> key to toggle a selected fold opened/closed.
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" Automatically save and load folds
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

" paste Competative CPP file headers
function! Cpp_Header()
      call append(0, '/*******************Owner:shiril sukhadeve**********************/')
      call append(1, '#include <iostream>')
      call append(2, '#include <string>')
      call append(3, '#include <vector>')
      call append(4, '#include <algorithm>')
      call append(5, '#include <sstream>')
      call append(6, '#include <queue>')
      call append(7, '#include <deque>')
      call append(8, '#include <bitset>')
      call append(9, '#include <iterator>')
      call append(10, '#include <list>')
      call append(11, '#include <stack>')
      call append(12, '#include <map>')
      call append(13, '#include <unordered_map>')
      call append(14, '#include <unordered_set>')
      call append(15, '#include <set>')
      call append(16, '#include <functional>')
      call append(17, '#include <numeric>')
      call append(18, '#include <utility>')
      call append(19, '#include <limits>')
      call append(20, '#include <time.h>')
      call append(21, '#include <math.h>')
      call append(22, '#include <stdio.h>')
      call append(23, '#include <string.h>')
      call append(24, '#include <stdlib.h>')
      call append(25, '#include <assert.h>')
      call append(26, 'using namespace std;')
endfunction
"
" get easier to use and more user friendly vim defaults
" /etc/vimrc ends here
" get easier to use and more user friendly vim defaults
" /etc/vimrc ends here
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CSCOPE settings for vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" This file contains some boilerplate settings for vim's cscope interface,
" plus some keyboard mappings that I've found useful.
"
" USAGE: 
" -- vim 6:     Stick this file in your ~/.vim/plugin directory (or in a
"               'plugin' directory in some other directory that is in your
"               'runtimepath'.
"
" -- vim 5:     Stick this file somewhere and 'source cscope.vim' it from
"               your ~/.vimrc file (or cut and paste it into your .vimrc).
"
" NOTE: 
" These key maps use multiple keystrokes (2 or 3 keys).  If you find that vim
" keeps timing you out before you can complete them, try changing your timeout
" settings, as explained below.
"
" Happy cscoping,
"
" Jason Duell       jduell@alumni.princeton.edu     2002/3/7
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" " =============================
" Ctags setup: look for tags file
" =============================
if exists("$CTAGS_DB") && filereadable(expand("$CTAGS_DB"))
    execute 'set tags=' . expand("$CTAGS_DB")
" else add the database if it exists in current dir
elseif filereadable("./tags")
    set tags=./tags
endif

" Optional keymap: jump to tag under cursor with <leader>t
nnoremap <leader>t :tag <C-R>=expand("<cword>")<CR><CR>

" This tests to see if vim was configured with the '--enable-cscope' option
" when it was compiled.  If it wasn't, time to recompile vim... 
if has("cscope")

    """"""""""""" Standard cscope/vim boilerplate

    " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
    set cscopetag

    " check cscope for definition of a symbol before checking ctags: set to 1
    " if you want the reverse search order.
    set csto=0

    " add any cscope database in current directory
    if exists("$CSCOPE_DB") && filereadable(expand("$CSCOPE_DB"))
        execute 'cs add ' . expand("$CSCOPE_DB")
    " else add the database pointed by cscope in current dir
    elseif filereadable("./cscope.out")
        cs add cscope.out
    endif

    " show msg when any other cscope db added
    set cscopeverbose


    """"""""""""" My cscope/vim key mappings
    "
    " The following maps all invoke one of the following cscope search types:
    "
    "   's'   symbol: find all references to the token under cursor
    "   'g'   global: find global definition(s) of the token under cursor
    "   'c'   calls:  find all calls to the function name under cursor
    "   't'   text:   find all instances of the text under cursor
    "   'e'   egrep:  egrep search for the word under cursor
    "   'f'   file:   open the filename under cursor
    "   'i'   includes: find files that include the filename under cursor
    "   'd'   called: find functions that function under cursor calls
    "
    " Below are three sets of the maps: one set that just jumps to your
    " search result, one that splits the existing vim window horizontally and
    " diplays your search result in the new window, and one that does the same
    " thing, but does a vertical split instead (vim 6 only).
    "
    " I've used CTRL-\ and CTRL-@ as the starting keys for these maps, as it's
    " unlikely that you need their default mappings (CTRL-\'s default use is
    " as part of CTRL-\ CTRL-N typemap, which basically just does the same
    " thing as hitting 'escape': CTRL-@ doesn't seem to have any default use).
    " If you don't like using 'CTRL-@' or CTRL-\, , you can change some or all
    " of these maps to use other keys.  One likely candidate is 'CTRL-_'
    " (which also maps to CTRL-/, which is easier to type).  By default it is
    " used to switch between Hebrew and English keyboard mode.
    "
    " All of the maps involving the <cfile> macro use '^<cfile>$': this is so
    " that searches over '#include <time.h>" return only references to
    " 'time.h', and not 'sys/time.h', etc. (by default cscope will return all
    " files that contain 'time.h' as part of their name).


    " To do the first type of search, hit 'CTRL-\', followed by one of the
    " cscope search types above (s,g,c,t,e,f,i,d).  The result of your cscope
    " search will be displayed in the current window.  You can use CTRL-T to
    " go back to where you were before the search.
    "

    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>


    " Using 'CTRL-spacebar' (intepreted as CTRL-@ by vim) then a search type
    " makes the vim window split horizontally, with search result displayed in
    " the new window.
    "
    " (Note: earlier versions of vim may not have the :scs command, but it
    " can be simulated roughly via:
    "    nmap <C-@>s <C-W><C-S> :cs find s <C-R>=expand("<cword>")<CR><CR>

    nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>


    " Hitting CTRL-space *twice* before the search type does a vertical
    " split instead of a horizontal one (vim 6 and up only)
    "
    " (Note: you may wish to put a 'set splitright' in your .vimrc
    " if you prefer the new window on the right instead of the left

    nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-@><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>


    """"""""""""" key map timeouts
    "
    " By default Vim will only wait 1 second for each keystroke in a mapping.
    " You may find that too short with the above typemaps.  If so, you should
    " either turn off mapping timeouts via 'notimeout'.
    "
    "set notimeout
    "
    " Or, you can keep timeouts, by uncommenting the timeoutlen line below,
    " with your own personal favorite value (in milliseconds):
    "
    "set timeoutlen=4000
    "
    " Either way, since mapping timeout settings by default also set the
    " timeouts for multicharacter 'keys codes' (like <F1>), you should also
    " set ttimeout and ttimeoutlen: otherwise, you will experience strange
    " delays as vim waits for a keystroke after you hit ESC (it will be
    " waiting to see if the ESC is actually part of a key code like <F1>).
    "
    "set ttimeout
    "
    " personally, I find a tenth of a second to work well for key code
    " timeouts. If you experience problems and have a slow terminal or network
    " connection, set it higher.  If you don't set ttimeoutlen, the value for
    " timeoutlent (default: 1000 = 1 second, which is sluggish) is used.
    "
    "set ttimeoutlen=100

endif
"CSCOPE ENDS HERE
