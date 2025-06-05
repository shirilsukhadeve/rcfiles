local mason = {
    "williamboman/mason.nvim",
    cmd = "Mason",
    event = "BufReadPre",
    opts = {
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗",
            },
        },
    },
}

local mason_lspconfig = {
    "williamboman/mason-lspconfig.nvim",
    opts = {
        ensure_installed = {
            "efm",
            "tsserver",
            "lua_ls",
            "clangd",
        },
        automatic_installation = true,
    },
    event = "BufReadPre",
    dependencies = "williamboman/mason.nvim",
}

return {
    mason,
    mason_lspconfig,
}
