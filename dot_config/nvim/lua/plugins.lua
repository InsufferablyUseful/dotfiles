vim.pack.add({
'https://github.com/ellisonleao/gruvbox.nvim',
'https://github.com/sheerun/vim-polyglot',
'https://github.com/nvim-tree/nvim-web-devicons',
'https://github.com/nvim-lualine/lualine.nvim',
'https://github.com/mason-org/mason.nvim',
'https://github.com/neovim/nvim-lspconfig',
'https://github.com/neovim-treesitter/treesitter-parser-registry',
'https://github.com/neovim-treesitter/nvim-treesitter',
{src = 'https://github.com/Saghen/blink.cmp', version = vim.version.range('1.x')},
'https://github.com/stevearc/conform.nvim',
'https://github.com/nvim-neotest/nvim-nio',
'https://github.com/mfussenegger/nvim-dap',
'https://github.com/rcarriga/nvim-dap-ui',
})
require('lualine').setup {
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
require('nvim-treesitter').install {'c','cpp', 'lua'}
vim.api.nvim_create_autocmd('FileType', {
    pattern = {'c','cpp', 'lua'},
    callback = function()
        vim.treesitter.start()
        vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        vim.wo.foldmethod = 'expr'
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
})
require('blink.cmp').setup()
require('conform').setup({
formatters_by_ft = {
    cpp = {"clang-format"},
    },
format_on_save = {
    timeout_ms = 500,
    lsp_format = "fallback",
    },
})
require('dapui').setup()
local dap, dapui = require('dap'), require('dap')
dap.listeners.before.attach.dapui_config = function()
    dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
    dapui.open()
end
dap.listeners.before.event_exited.dapui_config = function()
    dapui.close()
end
