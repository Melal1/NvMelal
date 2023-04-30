local Status, hop = pcall(require, "hop")
if not Status then
	return vim.notify("!hop")
end

hop.setup({})
