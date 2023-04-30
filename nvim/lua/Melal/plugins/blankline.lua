local Status, blackline = pcall(require, "indent_blankline")
if not Status then
	vim.notify("blackline")
	return
end

blackline.setup({
	-- char = "|",
	buftype_exclude = { "terminal" },
	filetype_exclude = { "NvimTree", "dashboard", "alpha" },
	show_current_context = true,
})
