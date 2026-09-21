local zk = require("zk")

zk.setup({
	picker = "telescope",
	lsp = {
		name = "zk",
		cmd = { "zk", "lsp" },
		filetypes = { "markdown" },
	},
	auto_attach = {
		enabled = true,
	},
	tags = {
		multi_select_strategy = "AND",
	},
})

vim.keymap.set("v", "<leader>znt", ":'<,\'>ZkNewFromTitleSelection<CR>", { desc = "Zk New Note from Title" })
vim.keymap.set("v", "<leader>znc", ":'<,\'>ZkNewFromContentSelection<CR>", { desc = "Zk New Note from Content" })

