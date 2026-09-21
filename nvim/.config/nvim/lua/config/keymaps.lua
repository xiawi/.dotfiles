vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

-- Save / quit
map("n", "<leader>w", "<cmd>w<CR>", { desc = "Save" })
map("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })

-- Clear search highlighting
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

-- Move between splits
map("n", "<C-h>", "<C-w>h", { desc = "Go to left split" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower split" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper split" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right split" })

-- Resize splits
map("n", "<C-Up>", "<cmd>resize +2<CR>", { desc = "Increase height" })
map("n", "<C-Down>", "<cmd>resize -2<CR>", { desc = "Decrease height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Decrease width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Increase width" })

-- Move selected lines
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Keep cursor centered
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Goto definitions / references (LSP)
map("n", "gd", vim.lsp.buf.definition, { desc = "Goto definition" })
map("n", "gD", vim.lsp.buf.declaration, { desc = "Goto declaration" })
map("n", "gi", vim.lsp.buf.implementation, { desc = "Goto implementation" })
map("n", "gr", vim.lsp.buf.references, { desc = "Goto references" })
map("n", "gt", vim.lsp.buf.type_definition, { desc = "Goto type definition" })

-- Symbols / document navigation
map("n", "<leader>ds", vim.lsp.buf.document_symbol, { desc = "Document symbols" })
map("n", "<leader>ws", vim.lsp.buf.workspace_symbol, { desc = "Workspace symbols" })

-- Jump list
map("n", "<C-o>", "<C-o>", { desc = "Jump back" })
map("n", "<C-i>", "<C-i>", { desc = "Jump forward" })

-- Go to line
map("n", "<leader>gl", ":", { desc = "Go to line" })

-- Go to beginning/end of line
map("n", "gh", "^", { desc = "Go to line start" })
map("n", "gl", "$", { desc = "Go to line end" })

