local utils = require "astronvim.utils"
return {
  { "pocco81/auto-save.nvim", event = { "InsertLeave", "TextChanged" } },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, { "python", "toml" })
      end
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, { "pyright", "ruff_lsp" })
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = function(_, opts)
      opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "python")
      if not opts.handlers then opts.handlers = {} end
      opts.handlers.python = function() end -- make sure python doesn't get set up by mason-nvim-dap, it's being set up by nvim-dap-python
    end,
  },
  {
    "linux-cultist/venv-selector.nvim",
    opts = { name = {
      key1 = "venv",
      key2 = "development-venv",
      key3 = ".venv",
    } },
    keys = { { "<leader>lv", "<cmd>:VenvSelect<cr>", desc = "Select VirtualEnv" } },
  },
  {
    "mfussenegger/nvim-dap-python",
    dependencies = "mfussenegger/nvim-dap",
    ft = "python", -- NOTE: ft: lazy-load on filetype
    config = function(_, opts)
      local path = require("mason-registry").get_package("debugpy"):get_install_path() .. "/venv/bin/python"
      require("dap-python").setup(path, opts)
      table.insert(require('dap').configurations.python, {
        type = 'python',
        request = 'attach',
        name = 'attach with params',
        port = 5678,
        host = 'localhost',
        justMyCode = false,
        -- ... more options, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings
      })
    end,
  },
}
