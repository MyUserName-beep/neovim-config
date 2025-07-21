return {
    {
        'nvim-telescope/telescope.nvim', 
        tag = '0.1.8',
        -- or                              
        -- , branch = '0.1.x',
        dependencies = { 
            'nvim-lua/plenary.nvim',
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
        },
        config = function()
            local telescope = require("telescope")
            local builtin = require('telescope.builtin')
            -- find files
            vim.keymap.set('n', '<leader>pf',
                builtin.find_files, 
                {
                    desc = 'Telescope find files' 
                })

            -- telescope some setup
            telescope.setup({
                defaults = {
                    file_ignore_patterns = { "node_modules", ".git" },
                    mappings = {
                        i = {
                            ["<Esc>"] = require("telescope.actions").close
                        }
                    }
                }
            })

            -- Load fzf-native if installed
            pcall(telescope.load_extension, "fzf")

            -- live grep
            vim.keymap.set('n', '<leader>pg',
                builtin.live_grep, 
                {
                    desc = 'Telescope live grep' 
                })

            -- Fuzzy search git files
            vim.keymap.set('n', '<leader>gf', 
            builtin.git_files,
                {
                    desc = 'Telescope git files'
                })

            -- buffers
            vim.keymap.set('n', '<leader>pb',
                builtin.buffers, { desc = 'Telescope buffers' 
                })

            -- help tags
            vim.keymap.set('n', '<leader>ph',
                builtin.help_tags, 
                {
                    desc = 'Telescope help tags' 
                })
        end
    } 
}

