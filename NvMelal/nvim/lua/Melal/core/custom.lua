local Mypl = "/home/melal/.config/nvim/lua/Melal/custom/Myplugins"
if not vim.loop.fs_stat(Mypl) then
	vim.fn.system({
		"git",
		"clone",
		-- "--filter=blob:none",
		"git@github.com:Melal1/MyPlugins.git",
		"--branch=main", -- latest stable release
		Mypl,
	})
end
vim.opt.rtp:prepend(Mypl)
