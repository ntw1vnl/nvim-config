vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.relativenumber = true
opt.number = true

-- Tabs and Indentation --
opt.tabstop = 2 -- 2 spaces for tabs
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent of current line when starting new one

opt.wrap = false

-- Searching --
opt.ignorecase = true
opt.smartcase = true -- if mixed case is used when searching, assume case-sensitive is wanted

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

opt.backspace = "indent,eol,start"

--opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- Split windows
opt.splitright = true
opt.splitbelow = true

-- Highlight when yanking text
-- See :':h vim.highlight.on_yank()'
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highligh when yanking text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
