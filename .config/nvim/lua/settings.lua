local cmd = vim.cmd
local exec = vim.api.nvim_exec
local g = vim.g
local opt = vim.opt
--vim
g.mapleader = " "
opt.splitright = true
opt.splitbelow = true
opt.timeoutlen = 400
opt.mouse = "a"
--lsp
local lsp_installer = require "nvim-lsp-installer"
lsp_installer.on_server_ready(function(server)
  server:setup {}
end)
--autocomplete
local cmp = require "cmp"
cmp.setup {
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
    ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
    ["<C-c>"] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<CR>"] = cmp.mapping.confirm(),
  },
  sources = cmp.config.sources {
    { name = "nvim_lsp" },
    { name = "vsnip" },
    { name = "buffer" },
    { name = "path" },
    { name = "crates" },
  },
}

local capabilities = require("cmp_nvim_lsp").update_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)
local lspconfig = require "lspconfig"
local servers = { "clangd", "pyright", "tsserver" }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup { capabilities = capabilities }
end

cmp.setup.filetype(
  "gitcommit",
  { sources = cmp.config.sources { { name = "cmp_git" } } }
)
--format
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.colorcolumn = "80"

require("formatter").setup {
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
    rust = {
      function()
        return {
          exe = "rustfmt",
          args = { "+nightly", "--emit=stdout" },
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
  },
}

cmd [[
augroup AutoFormatGroup
  autocmd BufLeave * FormatWrite
  autocmd VimLeavePre * bufdo FormatWrite | sleep
augroup END
]]
--comment
require("Comment").setup()
--parser
require("nvim-treesitter.configs").setup {
  sync_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
--file explorer
require("nvim-tree").setup {
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
  diagnostics = {
    enable = true,
    show_on_dirs = true,
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
}
--project
require("project_nvim").setup {
  detection_methods = { "pattern" },
  patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn" },
  exclude_dirs = { os.getenv "HOME" },
}
require("telescope").load_extension "projects"

function new_project(...)
  local path = select(1, ...)
  if path == nil then
    path = "."
  end
  os.execute("mkdir -p " .. path)
  cmd("cd " .. path)
  os.execute "git init"
  cmd("NvimTreeOpen " .. path)
end
cmd "command -nargs=? -complete=file NewProject lua new_project(<f-args>)"
--bufferline
require("bufferline").setup {
  options = {
    close_command = "bdelete %d",
    right_mouse_command = "bdelete %d",
    left_mouse_command = "buffer %d",
    diagnostics = "nvim_lsp",
    diagnostics_update_in_insert = true,
    offsets = {
      { filetype = "NvimTree", text = "File Explorer", text_align = "left" },
    },
    enforce_regular_tabs = true,
  },
}
--status
require("lualine").setup {
  options = { disabled_filetypes = { "NvimTree" } },
  sections = { lualine_y = { "vim.fn.fnamemodify(vim.fn.getcwd(), ':t')" } },
}
--utils
function to_bufferline_buf()
  cmd "silent only"
  cmd "silent setlocal buflisted"
end

cmd "command! -nargs=? -complete=help H help <args> | lua to_bufferline_buf()"

require("nvim-autopairs").setup {}

require("autosave").setup {
  enabled = true,
  execution_message = "Saved at " .. vim.fn.strftime "%H:%M:%S",
  clean_command_line_interval = 1000,
  debounce_delay = 500,
}

require("nvim-lastplace").setup {}

require("gitsigns").setup { numhl = true }
--theme
opt.cursorline = true
opt.number = true
opt.relativenumber = true
opt.scrolloff = 1000
opt.termguicolors = true

require('onedark').setup {
    style = 'warm',
    transparent = true
}
require('onedark').load()

