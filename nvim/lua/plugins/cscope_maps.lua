-- lua/plugins/cscope.lua
return {
    "dhananjaylatkar/cscope_maps.nvim",
    dependencies = {
        "nvim-telescope/telescope.nvim", -- optional [for picker="telescope"]
    },
    config = function()
        local default_db = "./cscope.out"
        local env_db = vim.env.CSCOPE_DB
        local use_db = nil

        if env_db and vim.fn.filereadable(env_db) == 1 then
            use_db = env_db
        elseif vim.fn.filereadable(default_db) == 1 then
            use_db = default_db
        else
            vim.notify("No cscope database found (neither ./cscope.out nor $CSCOPE_DB)", vim.log.levels.WARN)
        end

        if not use_db then return end  -- prevent setup if no DB

        require("cscope_maps").setup({
            {
                -- maps related defaults
                disable_maps = false, -- "true" disables default keymaps
                skip_input_prompt = false, -- "true" doesn't ask for input
                prefix = "<leader>c", -- prefix to trigger maps

                -- cscope related defaults
                cscope = {
                    -- location of cscope db file
                    db_file = use_db,         -- DB or table of DBs
                                              -- NOTE:
                                              --   when table of DBs is provided -
                                              --   first DB is "primary" and others are "secondary"
                                              --   primary DB is used for build and project_rooter
                    -- cscope executable
                    exec = "cscope", -- "cscope" or "gtags-cscope"
                    -- choose your fav picker
                    picker = "telescope", -- "quickfix", "location", "telescope", "fzf-lua", "mini-pick" or "snacks"
                    -- qf_window_size = 5, -- deprecated, replaced by picket_opts below, but still supported for backward compatibility
                    -- qf_window_pos = "bottom", -- deprecated, replaced by picket_opts below, but still supported for backward compatibility
                    picker_opts = {
                        window_size = 5, -- any positive integer
                        window_pos = "bottom", -- "bottom", "right", "left" or "top"
                    },
                    -- "true" does not open picker for single result, just JUMP
                    skip_picker_for_single_result = false, -- "false" or "true"
                    -- custom script can be used for db build
                    db_build_cmd = { script = "default", args = { "-bqkv" } },
                    -- statusline indicator, default is cscope executable
                    statusline_indicator = nil,
                    -- tr[48;58;214;1972;3424ty to locate db_file in parent dir(s)
                    project_rooter = {
                        enable = false, -- "true" or "false"
                        -- change cwd to where db_file is located
                        change_cwd = false, -- "true" or "false"
                    },
                    -- cstag related defaults
                    tag = {
                        -- bind ":Cstag" to "<C-]>"
                        keymap = true, -- "true" or "false"
                        -- order of operation to run for ":Cstag"
                        order = { "cs", "tag_picker", "tag" }, -- any combination of these 3 (ops can be excluded)
                        -- cmd to use for "tag" op in above table
                        tag_cmd = "tjump",
                    },
                },

                -- stack view defaults
                stack_view = {
                  tree_hl = true, -- toggle tree highlighting
                }
            }
        })

        -- add the database. line 33 does not update the file correctly
        vim.notify("Using cscope db " .. use_db, vim.log.levels.INFO)
        vim.cmd("Cs db add " .. use_db)
    end,
}
