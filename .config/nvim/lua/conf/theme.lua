---@diagnostic disable: undefined-global
local hi = vim.highlight.create

if vim.fn.exists("g:neovide") == 0 then
	require("onedark").setup({ transparent = true })
else
	require("onedark").setup({
		transparent = false,
		highlights = {
			Normal = { bg = "#1d1f21" },
			Terminal = { bg = "#1d1f21" },
			EndOfBuffer = { bg = "#1d1f21" },
			SignColumn = { bg = "#1d1f21" },
		},
	})
end
require("onedark").setup({
	style = "warm",
	highlights = {
		Normal = { bg = "#1d1f21" },
		Terminal = { bg = "#1d1f21" },
		EndOfBuffer = { bg = "#1d1f21" },
		TSAttribute = { fg = "#68aee8" },
		TSField = { fg = "#e16d77" },
		TSFunction = { fg = "#68aee8" },
		TSMethod = { fg = "#68aee8", fmt = "italic" },
		TSFuncBuiltin = { fg = "#68aee8" },
		TSConstant = { fg = "#56b6c2" },
		pythonTSConstructor = { fg = "#68aee8", fmt = "bold" },
	},
})
require("onedark").load()

hi("ColorColumn", { guibg = "#2c2d30" }, false)
hi("CursorLine", { guibg = "#2c2d30" }, false)
