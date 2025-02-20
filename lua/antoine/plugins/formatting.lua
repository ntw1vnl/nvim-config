-- Use :ConformInfo command to view info about formatters
return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		conform.setup({
			-- log-level = vim.log.levels.DEBUG
			formatters_by_ft = {
				javascript = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				lua = { "stylua" },
				python = { "isort", "black" },
				xml = { "xmlformatter" },
				gpx = { "xmlformatter" },
				cmake = { "cmake_format" },
			},
			format_on_save = function(bufnr)
				-- Disable with a global or buffer-local variable
				if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
					return
				end
				return { timeout_ms = 500, lsp_format = "fallback" }
			end,
		})

		conform.formatters.xmlformatter = {
			prepend_args = function(self, ctx)
				return { "--selfclose" }
			end,
		}

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_format = "fallback",
				timeout_ms = 500,
			})
		end, { desc = "Format file or range (in visual mode)" })

		vim.api.nvim_create_user_command("FormatDisable", function(args)
			if args.bang then
				-- FormatDisable! will disable formatting just for this buffer
				vim.b.disable_autoformat = true
			else
				vim.g.disable_autoformat = true
			end
		end, {
			desc = "Disable autoformat-on-save",
			bang = true,
		})

		vim.api.nvim_create_user_command("FormatEnable", function()
			vim.b.disable_autoformat = false
			vim.g.disable_autoformat = false
		end, {
			desc = "Re-enable autoformat-on-save",
		})
	end,
}
