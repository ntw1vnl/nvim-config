vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.relativenumber = true
opt.number = true

-- Tabs and Indentation --
opt.tabstop = 4 -- 4 spaces for tabs
opt.shiftwidth = 4 -- 4 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent of current line when starting new one

-- Folding
opt.foldenable = false

-- Wrapping
opt.wrap = false -- do not wrap by default, can be toogled with a keybind (see remap.lua)
opt.linebreak = true -- wrap at word rather than last displayable character
opt.whichwrap = "bs<>[]hl" -- Which "horizontal" keys are allowed to travel to prev/next line (default: 'b,s')
-- TODO check why it is not working
opt.formatoptions:remove({ "c", "r", "o" }) -- Don't insert the current comment leader automatically for auto-wrapping comments using 'textwidth', hitting <Enter> in insert mode, or hitting 'o' or 'O' in normal mode. (default: 'croql')

-- Searching --
opt.ignorecase = true
opt.smartcase = true -- if mixed case is used when searching, assume case-sensitive is wanted

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

opt.backspace = "indent,eol,start"

opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- Split windows
opt.splitright = true
opt.splitbelow = true

opt.scrolloff = 4 -- Minimal number of screen lines to keep above and below the cursor (default: 0)
opt.sidescrolloff = 8 -- Minimal number of screen columns either side of cursor if wrap is `false` (default: 0)

-- Highlight when yanking text
-- See :':h vim.highlight.on_yank()'
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highligh when yanking text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	callback = function()
		if require("nvim-treesitter.parsers").has_parser() then
			vim.opt.foldmethod = "expr"
			vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
		else
			vim.opt.foldmethod = "syntax"
		end
	end,
})
