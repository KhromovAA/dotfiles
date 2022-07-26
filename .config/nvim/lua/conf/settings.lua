---@diagnostic disable: undefined-global
local cmd = vim.cmd
local exec = vim.api.nvim_exec
local g = vim.g
local opt = vim.opt
--vim
g.mapleader = " "
-- g.onedark_color_overrides = {"background": {"gui": "#2F343F", "cterm": "235", "cterm16": "0" },}
--lsp
local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
	server:setup({})
end)
--autocomplete
local cmp = require("cmp")
cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	mapping = {
		["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
		["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
		["<C-c>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<CR>"] = cmp.mapping.confirm(),
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "vsnip" },
		{ name = "buffer" },
		{ name = "path" },
		{ name = "crates" },
	}),
})

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
local lspconfig = require("lspconfig")
local servers = { "clangd", "pyright", "tsserver" }
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({ capabilities = capabilities })
end

cmp.setup.cmdline(":", { sources = { { name = "cmdline" } } })

cmp.setup.cmdline("/", { sources = { { name = "buffer" } } })
cmp.setup.cmdline("?", { sources = { { name = "buffer" } } })

cmp.setup.filetype("gitcommit", { sources = cmp.config.sources({ { name = "cmp_git" } }) })

cmd([[
augroup AutoFormatGroup
  autocmd BufLeave * FormatWrite
  autocmd VimLeavePre * bufdo FormatWrite | sleep
augroup END
]])
--parser
require("nvim-treesitter.configs").setup({
	sync_install = false,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
})
--find
require("telescope").load_extension("ui-select")
--status
require("lualine").setup({
	options = {
		disabled_filetypes = { "NvimTree" },
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = {},
		lualine_x = { "filesize", "filetype" },
		lualine_y = { "filename" },
		lualine_z = { "location" },
	},
})
--utils
require("nvim-autopairs").setup({})

require("autosave").setup({
	enabled = true,
	execution_message = "",
	write_all_buffers = true,
	debounce_delay = 100,
})

require("nvim-lastplace").setup({})

require("gitsigns").setup({ numhl = true })
--theme
-- cmd([[
-- if (has("autocmd") && !has("gui_running"))
--   augroup colorset
--     autocmd!
--     let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
--     autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
--   augroup END
-- endif
-- ]])
