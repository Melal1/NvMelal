local status, MySessionMng = pcall(require, "persisted")
if not status then
	return vim.notify("persisted is not working"), vim.notify("")
end

local MyOptions = {

	save_dir = "/home/melal/.config/nvim/Sessions/autosave/", -- directory where session files are saved
	silent = false, -- silent nvim message when sourcing session file
	use_git_branch = false, -- create session files based on the branch of the git enabled repository
	autosave = true, -- automatically save session files when exiting Neovim
	should_autosave = function()
		-- do not autosave if the alpha dashboard is the current filetype
		if vim.bo.filetype == "dashboard" then
			return false
		end
		return true
	end, -- function to determine if a session should be autosaved
	autoload = false, -- automatically load the session for the cwd on Neovim startup
	on_autoload_no_session = nil, -- function to run when `autoload = true` but there is no session to load
	follow_cwd = true, -- change session file name to match current working directory if it changes
	allowed_dirs = nil, -- table of dirs that the plugin will auto-save and auto-load from
	ignored_dirs = nil, -- table of dirs that are ignored when auto-saving and auto-loading
	telescope = { -- options for the telescope extension
		reset_prompt_after_deletion = true, -- whether to reset prompt after session deleted
	},
}

MySessionMng.setup(MyOptions)
