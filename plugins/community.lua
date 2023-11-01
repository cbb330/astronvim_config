return {
  "AstroNvim/astrocommunity",
  -- { import = "astrocommunity.pack.python" },
  -- { -- further customize the options set by the community
  --   "venv-selector.nvim",
  --   config = function()
  --     require("venv-selector").setup {
  --       name = {
  --         key1 = "venv",
  --         key2 = "development-venv",
  --       },
  --     }
  --
  --   end,
  --   event = "VeryLazy", -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
  -- },
  { import = "astrocommunity.pack.java" },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.go" },
  {
    -- below overrides the default pack config for python and go
    "jay-babu/mason-null-ls.nvim",
    opts = function(_, opts)
      opts.ensure_installed = { "black", "isort", "gofumpt", "goimports" }
    end,
  },
  { import = "astrocommunity.colorscheme.rose-pine" },
  { import = "astrocommunity.colorscheme.nightfox-nvim" },
  { import = "astrocommunity.colorscheme.iceberg-vim" },
  { import = "astrocommunity.colorscheme.onedarkpro-nvim" },
  { import = "astrocommunity.colorscheme.mellow-nvim" },
  { import = "astrocommunity.colorscheme.oxocarbon-nvim" },
  { import = "astrocommunity.colorscheme.sonokai" },
  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.colorscheme.everforest" },
  { import = "astrocommunity.colorscheme.tokyonight-nvim" },
  { import = "astrocommunity.completion.copilot-lua" },
  { import = "astrocommunity.bars-and-lines.smartcolumn-nvim" },
}
