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
