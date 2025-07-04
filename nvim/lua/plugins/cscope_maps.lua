-- lua/plugins/cscope.lua
return {
    "dhananjaylatkar/cscope_maps.nvim",
    dependencies = {
        "nvim-telescope/telescope.nvim", -- optional [for picker="telescope"]
    },
    config = function()
        local fn = vim.fn

        -------------------------
        -- Setup cscope DB path
        -------------------------
        local default_cs_db = "./cscope.out"
        local env_cs_db = vim.env.CSCOPE_DB
        local use_cs_db = nil

        if env_cs_db and fn.filereadable(env_cs_db) == 1 then
            use_cs_db = env_cs_db
        elseif fn.filereadable(default_cs_db) == 1 then
            use_cs_db = default_cs_db
        else
            vim.notify("No cscope database found (neither ./cscope.out nor $CSCOPE_DB)", vim.log.levels.INFO)
        end

        -------------------------
        -- Setup ctags path
        -------------------------
        local default_ctags = "./tags"
        local env_ctags = vim.env.CTAGS_DB
        local use_ctags = nil

        if env_ctags and fn.filereadable(env_ctags) == 1 then
            use_ctags = env_ctags
        elseif fn.filereadable(default_ctags) == 1 then
            use_ctags = default_ctags
        else
            vim.notify("No ctags file found (neither ./tags nor $CTAGS_DB)", vim.log.levels.INFO)
        end

        -- Set Vim 'tags' option
        if use_ctags then
            vim.opt.tags = use_ctags
            vim.notify("Using ctags file: " .. use_ctags, vim.log.levels.INFO)
        end

        -------------------------
        -- Configure cscope_maps
        -------------------------

        if not use_cs_db then return end  -- prevent setup if no DB

        require("cscope_maps").setup({
            {
                -- maps related defaults
                disable_maps = false, -- "true" disables default keymaps
                skip_input_prompt = false, -- "true" doesn't ask for input
                prefix = "<leader>c", -- prefix to trigger maps

                -- cscope related defaults
                cscope = {
                    -- location of cscope db file
                    db_file = use_cs_db,      -- DB or table of DBs
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
        vim.notify("Using cscope db:" .. use_cs_db, vim.log.levels.INFO)
        vim.cmd("Cs db add " .. use_cs_db)
    end,
}
