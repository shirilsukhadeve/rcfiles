local opt = vim.opt -- for conciseness
local opt_local = vim.opt_local
opt.number = true
opt.cursorline = true
opt.autoindent = true
opt.smarttab = true
opt.smartindent = true
opt.encoding = "utf-8"  -- Encoding
opt.wrap = false
opt.list = true
opt.listchars = {
    tab = '›\\ ',
    trail = '•',
    extends = '#',
    nbsp = '.'
} -- Display different types of white spaces.
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.shiftround = false
opt.smartcase = true
opt.autoread = true
opt_local.spelllang = "en_us"
opt.mouse = a -- Enable mouse support
opt.showmatch = true -- show matching braces
opt.foldenable = false
opt.foldlevel = 99
opt.foldlevelstart = 99 -- start file with all folds opened
opt.foldmethod = manual -- set fold method so that zf and zo can be used
opt.compatible = false
opt.errorbells = false -- remove sounds effect
opt.backspace = indent,eol,start -- allow backspacing over everything in insert mode 
opt.matchpairs:append("<:>")
opt.list = true -- Display different types of white spaces.
opt.modeline = false -- Disable modeline
opt.scrolloff = 5 -- Display 5 lines above/below the cursor when scrolling with a mouse.
opt.ttyfast = true--Speed up scrolling in Vim
opt.laststatus = 2
opt.so = 999 -- cursor will always remain in center of screen
opt.re = 1   -- set syntax highligh time
opt.ic = true -- Case insensitive search
opt.hlsearch = true --Highlight matching search patterns
opt.swapfile = false
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom
opt.isfname:append("@-@")
opt.updatetime = 50
--vim.cmd[[highlight LineNr ctermfg=Yellow]]
--vim.cmd[[hi Search ctermbg=LightYellow]]
--vim.cmd[[hihi Search ctermfg=Red]]
--vim.cmd[[hihi Visual ctermfg=LightYellow ctermbg=Red]]
opt.incsearch = true -- Enable incremental search
opt.showmode = false -- display mode INSERT/REPLACE/..
opt.updatetime = 50 -- used for git gutter.
--opt.sessionoptions.remove("blank")
--opt.sessionoptions.remove("buffers")
--opt.sessionoptions.remove("winsize")
opt.backup = false
opt.writebackup = false
opt.hidden = true
