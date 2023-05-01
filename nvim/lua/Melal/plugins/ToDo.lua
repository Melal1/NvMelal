local st, pl = pcall(require, "todo-comments")
if not st then
	vim.notify("toDO plugin error", "error", { title = "Startup " })
	return
end

pl.setup({})
