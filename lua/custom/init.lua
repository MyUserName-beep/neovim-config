require("custom.remap")
require("custom.set")
require("custom.lazy_init")

vim.cmd([[colorscheme gruvbox]])

local augroup = vim.api.nvim_create_augroup
local TheGroup = augroup('TheGroup', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd({"BufWritePre"}, {
    group = TheGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

autocmd('LspAttach', {
    group = TheGroup,
    callback = function(e)
        local opts = { buffer = e.buf }
        vim.keymap.set("n", "gd", function() vim.l
sp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.ls
p.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vws", functio
n() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function
() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "<leader>vca", functio
n() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vrr", functio
n() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>vrn", functio
n() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vi
m.lsp.buf.signature_help() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic
.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic
.goto_prev() end, opts)
    end
})
autocmd('BufEnter', {
    group = TheGroup,
    callback = function()
        if vim.bo.filetype == "zig" then
            pcall(vim.cmd.colorscheme, "tokyonight-night")
        else
            pcall(vim.cmd.colorscheme, "rose-pine-moon")
        end
    end
})

