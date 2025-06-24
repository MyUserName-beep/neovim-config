return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      -- Optional but recommended for better performance:
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
    },
    config = function()
      local telescope = require("telescope")
      local builtin = require("telescope.builtin") -- Correct way to access built-in functions

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

      -- Keymaps using the correct builtin functions
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
    end
  }
}
