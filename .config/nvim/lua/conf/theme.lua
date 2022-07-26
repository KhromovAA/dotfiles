local hi = vim.highlight.create

require("onedark").setup({
	style = "warm",
	transparent = true,
})
require("onedark").load()

hi("ColorColumn", { guibg = "#2c2d30" }, false)
hi("CursorLine", { guibg = "#2c2d30" }, false)
