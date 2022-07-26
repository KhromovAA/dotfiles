local map = require("conf.mapfunc")

require("bufferline").setup({
	options = {
		numbers = "none",
		close_command = "Bdelete! %d",
		right_mouse_command = "Bdelete! %d",
		left_mouse_command = "buffer %d",
		middle_mouse_command = nil,
		indicator_icon = "│",
		buffer_close_icon = "",
		modified_icon = "●",
		close_icon = "",
		left_trunc_marker = "",
		right_trunc_marker = "",
		max_name_length = 30,
		max_prefix_length = 30,
		tab_size = 18,
		diagnostics = false,
		diagnostics_update_in_insert = false,
		offsets = { { filetype = "NvimTree", text = "", padding = 0 } },
		show_buffer_icons = true,
		show_buffer_close_icons = false,
		show_close_icon = false,
		show_tab_indicators = true,
		persist_buffer_sort = true,
		separator_style = "slant",
		enforce_regular_tabs = true,
		always_show_bufferline = true,
	},
	highlights = {
		fill = {
			guifg = { attribute = "fg", highlight = "MiniTablineModifiedVisible" },
			guibg = { attribute = "bg", highlight = "MiniTablineModifiedVisible" },
		},
		background = {
			guifg = { attribute = "fg", highlight = "TabLine" },
			guibg = { attribute = "bg", highlight = "ColorColumn" },
		},

		buffer_selected = {
			guifg = { attribute = "fg", highlight = "#ff0000" },
			guibg = { attribute = "bg", highlight = "#0000ff" },
		},

		buffer_visible = {
			guifg = { attribute = "fg", highlight = "TabLine" },
			guibg = { attribute = "bg", highlight = "TabLine" },
		},

		close_button = {
			guifg = { attribute = "fg", highlight = "TabLine" },
			guibg = { attribute = "bg", highlight = "ColorColumn" },
		},
		close_button_visible = {
			guifg = { attribute = "fg", highlight = "Normal" },
			guibg = { attribute = "bg", highlight = "Normal" },
		},
		tab_selected = {
			guifg = { attribute = "fg", highlight = "Normal" },
			guibg = { attribute = "bg", highlight = "Normal" },
		},
		tab = {
			guifg = { attribute = "fg", highlight = "Normal" },
			guibg = { attribute = "bg", highlight = "Normal" },
		},
		tab_close = {
			guifg = { attribute = "fg", highlight = "Normal" },
			guibg = { attribute = "bg", highlight = "Normal" },
		},

		duplicate_selected = {
			guifg = { attribute = "fg", highlight = "Normal" },
			guibg = { attribute = "bg", highlight = "Normal" },
			gui = "italic",
		},
		duplicate_visible = {
			guifg = { attribute = "fg", highlight = "Normal" },
			guibg = { attribute = "bg", highlight = "Normal" },
			gui = "italic",
		},
		duplicate = {
			guifg = { attribute = "fg", highlight = "Normal" },
			guibg = { attribute = "bg", highlight = "Normal" },
			gui = "italic",
		},

		modified = {
			guifg = { attribute = "fg", highlight = "Normal" },
			guibg = { attribute = "bg", highlight = "ColorColumn" },
		},
		modified_selected = {
			guifg = { attribute = "fg", highlight = "Normal" },
			guibg = { attribute = "bg", highlight = "Normal" },
		},
		modified_visible = {
			guifg = { attribute = "fg", highlight = "Normal" },
			guibg = { attribute = "bg", highlight = "Normal" },
		},
		separator = {
			guifg = { attribute = "bg", highlight = "MiniTablineModifiedVisible" },
			guibg = { attribute = "bg", highlight = "ColorColumn" },
		},
		separator_selected = {
			guifg = { attribute = "bg", highlight = "MiniTablineModifiedVisible" },
			guibg = { attribute = "bg", highlight = "Normal" },
		},
		separator_visible = {
			guifg = { attribute = "bg", highlight = "MiniTablineModifiedVisible" },
			guibg = { attribute = "bg", highlight = "ColorColumn" },
		},
		indicator_selected = {
			guifg = { attribute = "fg", highlight = "LspDiagnosticsDefaultHint" },
			guibg = { attribute = "bg", highlight = "TabLineSel" },
		},
	},
})

map({ "<S-l>", ":BufferLineCycleNext<CR>" })
map({ "<S-h>", ":BufferLineCyclePrev<CR>" })
map({ "<Tab>", ":BufferLineCycleNext<CR>" })
map({ "<S-Tab>", ":BufferLineCyclePrev<CR>" })
map({ "<Tab><Tab>", ":BufferLinePick<CR>" })
map({ "<Tab>j", ":BufferLineMovePrev<CR>" })
map({ "<Tab>k", ":BufferLineMoveNext<CR>" })
map({ "<Tab>c", ":bdelete<CR>" })
map({ "<Tab>C", ":bdelete!<CR>" })
map({ "<Tab><Tab>c", ":BufferLinePickClose<CR>" })
map({ "<S-Tab>j", ":BufferLineCloseLeft<CR>" })
map({ "<S-Tab>k", ":BufferLineCloseRight<CR>" })
