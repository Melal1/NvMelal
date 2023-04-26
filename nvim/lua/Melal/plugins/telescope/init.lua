require("Melal.plugins.telescope.project")

local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
	return
end

-- import telescope actions safely
local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
	return
end
local action_state = require("telescope.actions.state")
local utils = require("telescope.utils")

-- configure telescope
telescope.setup({
	pickers = {
		find_files = {
			file_ignore_patterns = {
				".cargo",
				".git",
				".npm",
				".ssh",
				".cups",
				".steam",
				".cache",
				".anydesk",
				".pulse-cookie",
				".gnome",
				".pki",
				".wget-hsts",
				-- ".mozilla",
				".hplip",
				".gnupg",
				".steampid",
				".steampath",
				".hyprland",
				".local/lib",
				".var",
				".local/share",
			},
		},
	},
	-- configure custom mappings
	defaults = {
		mappings = {
			n = {
				["<ESC>"] = actions.close,
			},
			i = {
				["<C-k>"] = actions.move_selection_previous, -- move to prev result
				["<C-j>"] = actions.move_selection_next, -- move to next result
				["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
				["<ESC>"] = actions.close,
			},
		},
	},
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case", -- this is default
		},
		file_browser = {
			hidden = true,
		},
		["ui-select"] = {
			require("telescope.themes").get_cursor(),
		},
		bookmarks = {
			selected_browser = "firefox",
			url_open_command = "xdg-open",
		},
		command_palette = {
			{
				"Files",
				{ "Write Current Buffer", ":w" },
				{ "Write All Buffers", ":wa" },
				{ "Quit", ":qa" },
			},
		},
		prompt_prefix = "❯ ",
		selection_caret = "❯ ",
		sorting_strategy = "ascending",
		color_devicons = true,
		layout_config = {
			prompt_position = "bottom",
			horizontal = {
				width_padding = 0.04,
				height_padding = 0.1,
				preview_width = 0.6,
			},
			vertical = {
				width_padding = 0.05,
				height_padding = 1,
				preview_height = 0.5,
			},
		},
	},
})

-- Extensions --

require("telescope").load_extension("file_browser")

require("telescope").load_extension("ui-select")

require("telescope").load_extension("fzf")

require("telescope").load_extension("command_palette")

require("telescope").load_extension("bookmarks")

require("telescope").load_extension("zoxide")

require("telescope").load_extension("repo")

local M = {}

function M.repo_list()
	local opts = {}
	opts.prompt_title = " Repos"
	require("telescope").extensions.repo.list(opts)
end

M.project_files = function()
	local _, ret, stderr = utils.get_os_command_output({
		"git",
		"rev-parse",
		"--is-inside-work-tree",
	})

	local gopts = {}
	local fopts = {}

	gopts.prompt_title = " Find"
	gopts.prompt_prefix = "  "
	gopts.results_title = " Repo Files"

	fopts.hidden = true
	fopts.file_ignore_patterns = {
		".vim/",
		".local/",
		".cache/",
		"Downloads/",
		".git/",
		"Dropbox/.*",
		"Library/.*",
		".rustup/.*",
		"Movies/",
		".cargo/registry/",
	}

	if ret == 0 then
		require("telescope.builtin").git_files(gopts)
	else
		fopts.results_title = "CWD: " .. vim.fn.getcwd()
		require("telescope.builtin").find_files(fopts)
	end
end
function M.grep_notes()
	local opts = {}
	opts.hidden = true
	opts.search_dirs = {
		"~/notes/",
	}
	opts.prompt_prefix = "   "
	opts.prompt_title = " Grep Notes"
	opts.path_display = { "smart" }
	require("telescope.builtin").live_grep(opts)
end

function M.find_notes()
	require("telescope.builtin").find_files({
		prompt_title = " Find Notes",
		path_display = { "smart" },
		cwd = "~/notes/",
		layout_strategy = "horizontal",
		layout_config = { preview_width = 0.65, width = 0.75 },
	})
end

function M.browse_notes()
	require("telescope").extensions.file_browser.file_browser({
		prompt_title = " Browse Notes",
		prompt_prefix = " ﮷ ",
		cwd = "~/notes/",
		layout_strategy = "horizontal",
		layout_config = { preview_width = 0.65, width = 0.75 },
	})
end

-- function M.find_configs()
--   require("telescope.builtin").find_files {
--     prompt_title = " NVim & Term Config Find",
--     results_title = "Config Files Results",
--     path_display = { "smart" },
--     search_dirs = {
--       "~/.oh-my-zsh/custom",
--       "~/.config/nvim",
--       "~/.config/alacritty",
--     },
--     -- cwd = "~/.config/nvim/",
--     layout_strategy = "horizontal",
--     layout_config = { preview_width = 0.65, width = 0.75 },
--   }
-- end

function M.nvim_config()
	require("telescope").extensions.file_browser.file_browser({
		prompt_title = " NVim Config Browse",
		cwd = "~/.config/nvim/",
		layout_strategy = "horizontal",
		layout_config = { preview_width = 0.65, width = 0.75 },
	})
end

function M.file_explorer()
	require("telescope").extensions.file_browser.file_browser({
		prompt_title = " File Browser",
		-- path_display = { "smart" },
		cwd = "~",
		layout_strategy = "horizontal",
		layout_config = { preview_width = 0.65, width = 0.75 },
	})
end

return M
