require("formatter").setup({
	filetype = {
		lua = {
			function()
				return {
					exe = "stylua",
					args = { "-s", "-" },
					stdin = true,
				}
			end,
		},
		cpp = {
			function()
				return {
					exe = "clang-format",
					args = { "-" },
					stdin = true,
				}
			end,
		},
		python = {
			function()
				return {
					exe = "autopep8",
					args = { "-" },
					stdin = true,
				}
			end,
		},
		html = { -- try using it
			function()
				return {
					exe = "tidy",
					args = { "-" },
					stdin = true,
				}
			end,
		},
	},
})
