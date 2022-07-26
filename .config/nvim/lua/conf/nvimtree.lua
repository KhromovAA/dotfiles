local map = require("conf.mapfunc")

require("nvim-tree").setup({
	disable_netrw = true,
	open_on_setup = true,
	ignore_ft_on_setup = {},
	sort_by = "modification_time",
	hijack_unnamed_buffer_when_opening = true,
	hijack_directories = {
		enable = true,
		auto_open = true,
	},
	hijack_cursor = true,
	update_cwd = true,
	view = {
		side = "right",
	},
	diagnostics = {
		enable = true,
		show_on_dirs = false,
	},
	trash = {
		cmd = "trash",
		require_confirm = false,
	},
	actions = {
		change_dir = {
			enable = false,
		},
		open_file = {
			quit_on_open = true,
			window_picker = { enable = false },
		},
	},
})

map({ "<leader>t", "<Cmd>NvimTreeRefresh<CR><Cmd>NvimTreeFindFileToggle<CR>" })
map({ "<leader>tt", "<Cmd>NvimTreeRefresh<CR><Cmd>NvimTreeFocus<CR>" })
