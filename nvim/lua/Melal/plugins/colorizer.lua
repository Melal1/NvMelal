local status, colorizer = pcall(require, "colorizer")
if not status then
	vim.notify("colorizer is not installed or not working", "error", { title = " Startup " })
	return
end

colorizer.setup()
