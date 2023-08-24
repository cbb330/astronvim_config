return {
  colorscheme = "tokyonight-storm",
  -- colorscheme = "everforest",
  -- colorscheme = "onedark",
  -- colorscheme = "Mofiqul/dracula.nvim",
  lsp = {
    formatting = {
      format_on_save = false, -- enable or disable automatic formatting on save
    },
  },
  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    local augroup = vim.api.nvim_create_augroup

    vim.api.nvim_create_autocmd("VimEnter", {
      desc = "Auto-Select Virtualenv on Start",
      pattern = "*",
      group = augroup("venv-selector", { clear = true }),
      callback = function() require("venv-selector").retrieve_from_cache() end,
      once = true,
    })
  end,

  vim.api.nvim_create_user_command("DiagnosticToggle", function()
    local config = vim.diagnostic.config
    local vt = config().virtual_text
    config {
      virtual_text = not vt,
      underline = not vt,
      signs = not vt,
    }
  end, { desc = "toggle diagnostic" }),
}
