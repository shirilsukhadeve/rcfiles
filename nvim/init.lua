local profiling = false
function ToggleProfiling()
    if profiling then
        -- Stop profiling
        vim.cmd("profile stop")
        -- vim.cmd("noautocmd qall!")
        print("Profiling stopped.")
    else
        -- Start profiling
        vim.cmd("profile start profile.log")
        vim.cmd("profile func *")
        vim.cmd("profile file *")
        print("Profiling started.")
    end
    profiling = not profiling
end

local plugins = true
function TogglePlugins()
    if plugins then
        -- Stop plugins
        vim.cmd("syntax off")
        vim.cmd("set eventignore=all")
        print("Plugins stopped.")
    else
        -- Start plugins
        vim.cmd("syntax on")
        vim.cmd("set eventignore=")
        print("Plugins started.")
    end
    plugins = not plugins
end
if vim.fn.has("termguicolors") == 1 then
    vim.opt.termguicolors = true
end
require("config")
