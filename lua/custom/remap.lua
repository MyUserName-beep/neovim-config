vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- folding keymaps

-- Toggle fold
vim.api.nvim_set_keymap(
    'n', '<leader>z', 'za', 
    {
        noremap = true,
        silent = true 
    }) 

-- Open fold
vim.api.nvim_set_keymap(
    'n', '<leader>o', 'zo', 
    {
        noremap = true,
        silent = true 
    })

-- Close fold
vim.api.nvim_set_keymap(
    'n', '<leader>c', 'zc', 
    {
        noremap = true,
        silent = true 
    })

-- neotree keymaps
-- vim.keymap.set('n', '<leader>e', '<Cmd>Neotree toggle<CR>')

