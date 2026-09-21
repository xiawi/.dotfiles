local treesitter = require('nvim-treesitter')

treesitter.setup {
	install_dir = vim.fn.stdpath('data') .. '/site'
}

treesitter.install {
	'lua',
	'markdown',
	'markdown_inline'
}

vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    local ok = pcall(vim.treesitter.start, args.buf)

    if not ok then
      return
    end

    -- Treesitter-based folding
    vim.wo.foldmethod = "expr"
    vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.wo.foldenable = false
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    local ok, _ = pcall(vim.treesitter.get_parser, args.buf)

    if ok then
      vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})
