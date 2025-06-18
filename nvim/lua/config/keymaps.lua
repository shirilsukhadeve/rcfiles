-- set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps -------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- Useful Movement
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")
keymap.set("n", "J", "mzJ`z")
-- Half page movement
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

-- Session management
keymap.set("n", "<leader>wd", "<cmd>SessionDelete<CR>", { desc = "Delete session for current directory" })
keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore session for current directory" })

-- profiling
keymap.set("n", "<leader>ps", "<cmd>lua ToggleProfiling()<CR>", { desc = "Toggle profiling" })
keymap.set("n", "<leader>pp", "<cmd>lua TogglePlugins()<CR>", { desc = "Toggle Plogins" })

-- theme selector
keymap.set("n", "<leader>ts", "<cmd>Themery<CR>", { desc = "Theme Selector" })

local vim_modes = {
    n = "n",
    i = "i",
    v = "v",
}

local default_opts = {
    noremap = true,
    silent = true,
}

--- @param opts (table|nil)
--- @return table
local get_opts = function(opts)
    local all_opts = opts
    if all_opts == nil then
        all_opts = {}
    end
    for k, v in pairs(default_opts) do
        all_opts[k] = all_opts[k] or v
    end
    return all_opts
end

--- @param vimmode (string|nil)
--- @return string
local get_mode = function(vimmode)
    local modeString = vim_modes[vimmode]
    if modeString == nil then
        return "n"
    else
        return modeString
    end
end

--- @param command (string)
--- @return string
local get_cmd_string = function(command)
    return [[<cmd>]] .. command .. [[<CR>]]
end

--- @param keymaps string
--- @param command string
--- @param vimmode (string|nil)
--- @param options (table|nil)
--- @return nil
local mapvimkey = function(keymaps, command, vimmode, options)
    local mode = get_mode(vimmode)
    local lhs = keymaps
    local rhs = get_cmd_string(command)
    local opts = get_opts(options)
    vim.keymap.set(mode, lhs, rhs, opts)
end

--- @param keymaps string
--- @param cmd (function|string)
--- @param desc (string|nil)
--- @return table
local maplazykey = function(keymaps, cmd, desc)
    if type(cmd) ~= "function" then
        cmd = get_cmd_string(cmd)
    end
    return { keymaps, cmd, desc = desc }
end

return {
    mapvimkey = mapvimkey,
    maplazykey = maplazykey,
}

