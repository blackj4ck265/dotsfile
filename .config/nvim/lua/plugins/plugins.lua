local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    --search
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
-- or                              , branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    --bufferline
    "akinsho/bufferline.nvim",
    "lewis6991/gitsigns.nvim",
    --nvim-autopairs
    "numToStr/Comment.nvim",
    "windwp/nvim-autopairs",
    --theme
    "folke/tokyonight.nvim",
  -- Vscode-like pictograms
    {
        "onsails/lspkind.nvim",
        event = { "VimEnter" },
    },

  -- Auto-completion engine
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "onsails/lspkind.nvim", -- 确保依赖项正确
            "hrsh7th/cmp-nvim-lsp", -- lsp auto-completion
            "hrsh7th/cmp-buffer",    -- buffer auto-completion
            "hrsh7th/cmp-path",      -- path auto-completion
            "hrsh7th/cmp-cmdline",   -- cmdline auto-completion
      },
        config = function()
        require("config.nvim-cmp")
        end,
    },

  -- Code snippet engine
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
    },

  -- LSP manager
    {
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
        },
    },

  -- Dashboard
    {
        "nvimdev/dashboard-nvim",
        event = "VimEnter",
        config = function()
            require("dashboard").setup {
              -- config
              -- theme = 'hyper'
            }
        end,
        dependencies = { 'nvim-tree/nvim-web-devicons' },
    },

  -- Lualine
    {
        "nvim-lualine/lualine.nvim",
        'nvim-tree/nvim-web-devicons',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
    },

    --side bar
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = true,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
    }
})

