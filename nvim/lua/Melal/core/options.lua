--\\ Variable //--
local o = vim.opt
local g = vim.g
--\\ Tab //--

o.tabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.autoindent = true
o.smartindent = true

--\\ Line Wrap//--

o.wrap = true

--\\ Search settings//--

o.ignorecase = true
o.smartcase = true
o.hlsearch = true
o.incsearch = true

--\\ appearance //--
-- vim.api.nvim_set_hl(0, "LuaString", { bg = "#1D1C19", fg = "#8a9a7b" })
-- Font
o.guifont = "Hack Nerd Font"
g.neovide_cursor_vfx_mode = "wireframe"
g.neovide_refresh_rate = 80
g.neovide_refresh_rate_idle = 5
g.neovide_remember_window_size = true
g.neovide_remember_window_position = true
-- -- Down
o.cmdheight = 1
o.pumheight = 10
o.showmode = false
-- Up
o.showtabline = 2
-- Split
o.splitbelow = true
o.splitright = true
-- Num
o.number = true
o.relativenumber = true
o.numberwidth = 5
-- Others
o.termguicolors = true
o.signcolumn = "yes"
o.completeopt = "menu,menuone,noselect"
o.laststatus = 3
o.termbidi = true
o.encoding = "utf-8"
--\\ Backspace //--

o.backspace = "indent,eol,start"

--\\ Clipboard //--

o.clipboard = "unnamedplus"

--\\ Cursor //--
o.guifont = "e"

o.cursorline = true
o.mouse = "a"

--\\ Backup and Other stuff //--

o.writebackup = false
o.backup = false
o.swapfile = false
o.undofile = true
o.updatetime = 250
--\\ Words format //--

o.formatoptions:remove("cro") -- -=
o.iskeyword:append({ "-", "+" })
