return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        local builtin = require("telescope.builtin")

        telescope.setup({
            defaults = {
              path_display = { "truncate " },
              mappings = {
                  i = {
                      ["<C-k>"] = actions.move_selection_previous, -- move to prev result
                      ["<C-j>"] = actions.move_selection_next, -- move to next result
                      ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                  },
              },
            },
        })

        telescope.load_extension("fzf")

        -- set keymaps
        local keymap = vim.keymap -- for conciseness

        keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
        keymap.set("n", "<leader>fg", "<cmd>Telescope git_files<cr>", { desc = "Fuzzy find git files" })
        keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
        keymap.set("n", "<leader>/", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "Buffer search" })
        keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })
        keymap.set("n", "<leader>fc", "<cmd>Telescope git_commits<cr>", { desc = "Commits" })
        keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help" })
        keymap.set("n", "<leader>fj", "<cmd>Telescope command_history<cr>", { desc = "History" })
        keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", { desc = "Keymaps" })
        keymap.set("n", "<leader>fl", "<cmd>Telescope lsp_references<cr>", { desc = "Lsp References" })
        keymap.set("n", "<leader>fi", "<cmd>Telescope lsp_implementations<cr>", { desc = "Lsp Implementations" })
        keymap.set("n", "<leader>fd", "<cmd>Telescope lsp_definitions<cr>", { desc = "Lsp Definitions" })
        keymap.set("n", "<leader>fo", "<cmd>Telescope oldfiles<cr>", { desc = "Old files" })
        keymap.set("n", "<leader>fs", "<cmd>Telescope grep_string<cr>", { desc = "Grep String" })
        keymap.set("n", "<leader>ft", "<cmd>Telescope treesitter<cr>", { desc = "Treesitter" })
    end,
}
