-- Set options (vim.opt)
vim.opt = {
  -- Line numbers
  number = true,                     -- Show line numbers
  relativenumber = true,             -- Relative line numbers
  numberwidth = 4,                   -- Width of number column

  -- Indentation
  tabstop = 2,                       -- Number of spaces a tab counts for
  shiftwidth = 2,                    -- Size of an indent
  expandtab = true,                  -- Use spaces instead of tabs
  smartindent = true,                -- Smart auto-indenting
  autoindent = true,                 -- Keep indent from current line

  -- Search
  ignorecase = true,                 -- Case insensitive search
  smartcase = true,                  -- Case sensitive when uppercase present
  hlsearch = true,                   -- Highlight search results
  incsearch = true,                  -- Show search matches as you type

  -- Appearance
  termguicolors = true,              -- Enable 24-bit RGB colors
  cursorline = true,                 -- Highlight current line
  signcolumn = "yes",                -- Always show sign column
  scrolloff = 8,                     -- Minimum lines to keep above/below cursor
  sidescrolloff = 8,                 -- Minimum columns to keep left/right of cursor
  wrap = false,                      -- Disable line wrapping
  linebreak = true,                  -- Wrap at word boundaries
  showbreak = "↪ ",                  -- Character to show when line breaks
  list = true,                       -- Show invisible characters
  listchars = {
    tab = "→ ",
    trail = "·",
    nbsp = "␣",
    extends = "⟩",
    precedes = "⟨"
  },

  -- Behavior
  hidden = true,                     -- Allow hidden buffers
  mouse = "a",                       -- Enable mouse support
  splitbelow = true,                 -- New horizontal splits below
  splitright = true,                 -- New vertical splits to the right
  clipboard = "unnamedplus",         -- Use system clipboard
  swapfile = false,                  -- Disable swap files
  undofile = true,                   -- Persistent undo
  backup = false,                    -- Disable backup files
  writebackup = false,               -- Disable backup while writing
  updatetime = 300,                  -- Faster completion (default 4000ms)
  timeoutlen = 500,                  -- Time to wait for mapped sequence
  ttimeoutlen = 10,                  -- Time to wait for key code sequence

  -- Performance
  lazyredraw = true,                 -- Don't redraw during macros
  synmaxcol = 240,                   -- Max column for syntax highlighting
  re = 0,                            -- Use old regex engine (faster)

  -- Wildmenu (command-line completion)
  wildmenu = true,
  wildmode = "longest:full,full",
  wildignore = {
    "*.o", "*.obj", "*.dll", "*.exe",
    "*.pyc", "*.class", "*.jar",
    "*.png", "*.jpg", "*.gif",
    "*.zip", "*.tar.gz", "*.tar.bz2",
    "*.swp", "*.swo",
    "node_modules/*", ".git/*"
  }
}

-- Set globals (vim.g)
vim.g = {
  mapleader = " ",                   -- Set space as leader key
  maplocalleader = ",",              -- Set comma as local leader
  netrw_banner = 0,                  -- Disable netrw banner
  netrw_liststyle = 3,               -- Tree-style listing in netrw
  netrw_browse_split = 4,            -- Open files in previous window
  netrw_winsize = 25,                -- Netrw window size
  loaded_netrwPlugin = 1,            -- Disable netrw (use nvim-tree instead)
  loaded_netrw = 1,                  -- Disable netrw (use nvim-tree instead)
  loaded_matchit = 1,                -- Disable matchit (use treesitter)
  loaded_matchparen = 1,             -- Disable matchparen (use treesitter)
}

-- Filetype specific options
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "python", "lua" },
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
  end
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "text" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end
})

-- Highlight yanked text briefly
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ timeout = 300 })
  end
})
