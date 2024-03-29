---@diagnostic disable: undefined-global
local options = {
	clipboard = "unnamedplus",
	completeopt = { "menuone", "noselect" },
	colorcolumn = "80",
	fileencoding = "utf-8",
	hlsearch = true,
	mouse = "a",
	pumheight = 10,
	smartindent = true,
	splitbelow = true,
	splitright = true,
	swapfile = false,
	termguicolors = true,
	timeoutlen = 400,
	undofile = true,
	updatetime = 300,
	writebackup = false,
	expandtab = true,
	shiftwidth = 4,
	tabstop = 4,
	cursorline = true,
	number = true,
	relativenumber = true,
	wrap = false,
	scrolloff = 1000,
	guifont = { "Hack Nerd Font Mono:h11" },
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
