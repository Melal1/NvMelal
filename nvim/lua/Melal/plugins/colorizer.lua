local status, colorizer = pcall(require, "colorizer")
if not status then
	vim.notify("colorizer is not installed or not working")
	return
end

colorizer.setup()
