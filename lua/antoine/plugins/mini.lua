return {
	"echasnovski/mini.nvim",
	version = false,
	config = function()
		local keymap = vim.keymap
		require("mini.ai").setup()
		require("mini.operators").setup()
		require("mini.surround").setup()
		require("mini.bufremove").setup({
			-- Whether to set Vim's settings for buffers (allow hidden buffers)
			set_vim_settings = true,

			-- Whether to disable showing non-error feedback
			silent = false,

			keymap.set("n", "<leader>qq", "<cmd>lua MiniBufremove.delete()<CR>", { desc = "Find files in cwd" }),
		})
		require("mini.files").setup()
	end,
}
