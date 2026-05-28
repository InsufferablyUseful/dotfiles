-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
{"ellisonleao/gruvbox.nvim", priority = 1000 , config = true, opts = {} },
{"sheerun/vim-polyglot" },
--[[{"saghen/blink.cmp", dependencies = { 'echasnovski/mini.snippets' }, opts = {
  snippets = { preset = 'mini_snippets' },
  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer'}
  },
  }
},]]--
{'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons'}, opts = {
    options = {
    icons_enabled = true,
    theme = 'gruvbox',
    },
    sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {},
    lualine_z = {}
    }
    }
}
})


