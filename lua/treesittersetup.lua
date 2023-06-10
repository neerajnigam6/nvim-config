
-- this is because of a bug
-- https://github.com/nvim-treesitter/nvim-treesitter/wiki/Installation
vim.api.nvim_create_autocmd({'BufEnter','BufAdd','BufNew','BufNewFile','BufWinEnter'}, {
  group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
  callback = function()
    vim.opt.foldmethod     = 'expr'
    vim.opt.foldexpr       = 'nvim_treesitter#foldexpr()'
  end
})


require'nvim-treesitter.configs'.setup {
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "python", "go", "gomod", "typescript", 
        "javascript", "rust", "html", "sql",  "proto", "bash"               
    },
    auto_install = true,
    highligh = {
        enable = true,
        additional_vim_regex_highlighting = false,
    }

}
