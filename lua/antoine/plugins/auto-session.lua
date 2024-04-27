return {
	"rmagatti/auto-session",

	config = function()
		local auto_session = require("auto-session")

		auto_session.setup({
			auto_restore_enabled = false,
			auto_restore_suppress_dirs = { "~/", "~/Downloads", "~/Documents", "~/Desktop" },
		})

		local keymap = vim.keymap

		keymap.set("n", "<leader>wr", "<cmd>SessionRestore<cr>", { desc = "Restore session for cwd" })
		keymap.set("n", "<leader>ws", "<cmd>SessionSave<cr>", { desc = "Save session for cwd" })
	end,
}
