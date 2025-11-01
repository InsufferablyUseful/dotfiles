vim.opt.number = true         -- show absolute number
vim.opt.relativenumber = true -- add numbers to each line on the left side
vim.opt.cursorline = true
vim.opt.textwidth = 80
--vim.opt.noerrorbells = true
vim.opt.syntax = 'on'
vim.opt.spell = true
vim.opt.spelllang = en_gb
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.smartindent = true
vim.opt.shiftwidth = 4
vim.opt.linebreak = false
--vim.opt.wrap = true
-- Hard wrap at 80 while typing for plain text-like filetypes
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "text", "markdown", "gfm", "gitcommit" },
  callback = function()
    vim.opt_local.textwidth = 80
    vim.opt_local.formatoptions:append("t")
  end,
})
