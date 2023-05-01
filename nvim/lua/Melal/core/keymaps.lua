vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- || var || --

local key = vim.keymap
local opts = { noremap = true, silent = true }
-- General
key.set("n", "<m-h>", "<C-w>h", opts)
key.set("n", "<m-j>", "<C-w>j", opts)
key.set("n", "<m-k>", "<C-w>k", opts)
key.set("n", "<m-l>", "<C-w>l", opts)
key.set("i", "jk", "<ESC>") -- Press  jk fast in insert mode to enter normal mode
key.set("n", "<leader>nh", ":noh<CR>", opts) -- clear the search highlighte
key.set("v", "d", '"_d', opts) -- Delete the text without copying it in Visual mode
key.set("n", "d", '"_dd', opts) -- Delete the text without copying it in normal mode
key.set("n", "x", '"_x', opts) -- Delete one char without copying it in normal mode
key.set("v", "p", '"_dp', opts) -- better paste on Visual mode
key.set("n", "<leader>a", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gc<Left><Left><Left>]]) -- search and replace
key.set("n", "<leader>w", "<END>", opts)
key.set("n", "<leader>W", "<HOME>", opts)
key.set("n", "<c-y>", ":t.<CR>", opts)
key.set("n", "<C-d>", "<C-d>zz")
key.set("n", "<C-u>", "<C-u>zz")
key.set("n", "n", "nzzzv")
key.set("n", "N", "Nzzzv")
key.set("n", "<CR>", "o<ESC>k") -- insert blank line without exiting n mode
key.set("n", "<S-CR>", "O<ESC>k") -- same as above but up

-- key.set("n", "<leader>=", "<C-a>", opts)
-- key.set("n", "<leader>-", "<C-x>", opts)
key.set("n", "<F1>", "<cmd>Dashboard<CR>")
-- Tabs --
key.set("n", "<m-t>", ":tabnew %<cr>", opts)
key.set("n", "<m-y>", ":tabclose<cr>", opts)
-- key.set("n", "<m-\\>", ":tabonly<cr>", opts)

-- Visual --
-- Stay in indent mode
key.set("v", "<", "<gv", opts)
key.set("v", ">", ">gv", opts)

-- comment
-- key.set("n", "<m-/>", "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", opts)

-- Resize with arrows
key.set("n", "<C-Up>", ":resize -2<CR>", opts)
key.set("n", "<C-Down>", ":resize +2<CR>", opts)
key.set("n", "<C-Right>", ":vertical resize -2<CR>", opts)
key.set("n", "<C-Left>", ":vertical resize +2<CR>", opts)
-- Nvim-tree
key.set("n", "<C-n>", ":NvimTreeToggle<CR>", opts)
key.set("n", "<leader>e", ":NvimTreeFocus<CR>", opts)

-- Telescope
key.set("n", "<leader>ff", "<cmd>lua require'Melal.plugins.telescope'.project_files()<CR>", opts)
key.set("n", "<leader>fc", "<cmd>lua require'Melal.plugins.telescope'.find_configs()<CR>", opts)
key.set("n", "<leader>fn", "<cmd>lua require'Melal.plugins.telescope'.find_notes()<CR>", opts)
key.set("n", "<leader>gn", "<cmd>lua require'Melal.plugins.telescope'.grep_notes()<CR>", opts)
key.set("n", "<leader>fe", "<cmd>lua require'Melal.plugins.telescope'.file_explorer()<CR>", opts)
key.set("n", "<leader>fr", "<cmd>lua require'Melal.plugins.telescope'.find_repos()<CR>", opts)
key.set("n", "<leader>bn", "<cmd>lua require'Melal.plugins.telescope'.browse_notes()<CR>", opts)
key.set("n", "<leader>lg", "<cmd>Telescope live_grep<CR>", opts) --- Needs ripgrep
key.set("n", "<leader>gs", "<cmd>Telescope grep_string<CR>", opts) -- Needs ripfrep
key.set("n", "<leader>fp", "<cmd>Telescope projects<CR>", opts) -- Needs ripfrep
key.set("n", "<leader>bk", "<cmd>Telescope bookmarks<CR>", opts) -- Needs ripfrep

-- Naviagate buffers
key.set("n", "<S-l>", ":bnext<CR>", opts)
key.set("n", "<S-h>", ":bprevious<CR>", opts)
key.set("n", "Q", "<cmd>bdelete!<CR>", opts)
-- Move text up & down
key.set("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
key.set("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Functions
key.set("n", "<F2>", "<cmd>lua Allgit_toggle()<CR>", opts)
key.set("n", "<F3>", "<cmd>lua Sysmon_toggle()<CR>", opts)
key.set("n", "<F4>", "<cmd>lua Dtgit_toggle()<CR>", opts)
-- Dashboard
-- key.set("n", "<F1>", "<cmd>Dashboard<CR>", opts)
-- insert mode
key.set("i", "<C-f>", "<ESC>wa")
key.set("i", "<C-b>", "<ESC>bi")
-- key.set("i", "<C-j>", "<ESC>ji")
-- key.set("i", "<C-k>", "<ESC>ki")

-- Theme switcher
key.set(
	"n",
	"<leader>th",
	"<cmd>luafile ~/.config/nvim/lua/Melal/custom/Myplugins/telescope/ThemeSwitcher/themepick.lua<CR>"
)
-- cd to current
key.set("n", "<leader>cd", "<cmd>:lcd %:p:h<CR>")
-- sys clipbaord
-- only on gui
key.set("n", "<c-c>", '"+y')
key.set("n", "<c-v>", '"+p')
key.set("i", "<c-v>", "<c-r>+")

-- source find
key.set("n", "<leader><leader>", "<cmd>luafile %<CR>")
-- hop
key.set("n", "<C-h>", "<cmd>HopPattern<CR>")
-- Jabs
key.set("n", "<leader>bf", "<cmd>JABSOpen<CR>")
-- color picker
key.set("n", "<c-s>", "<cmd>PickColor<cr>", opts)
key.set("i", "<c-s>", "<cmd>PickColorInsert<cr>", opts)
-- todo
key.set("n", "<leader>ft", "<cmd>:TodoTelescope keywords=TODO<CR>")
