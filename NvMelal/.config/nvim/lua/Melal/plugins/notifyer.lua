local st, noti = pcall(require, "notify")
if not st then
	vim.notify("notifyer !")
	return
end
noti.setup({
	fps = 75,
	icons = {
		DEBUG = "",
		ERROR = "",
		INFO = "",
		TRACE = "✎",
		WARN = "",
	},
	render = "compact",
	stages = "slide",
	timeout = 3000,
})
