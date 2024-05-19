local status, mason_dap = pcall(require, "mason-nvim-dap")

if not status then
	vim.notify("not found mason-nvim-dap")
	return
end

mason_dap.setup({
	ensure_installed = { "cppdbg", "python" },
	handlers = {
		function(config)
			-- all sources with no handler get passed here

			-- Keep original functionality
			require("mason-nvim-dap").default_setup(config)
		end,
		python = function(config)
			config.adapters = {
				type = "executable",
				command = "/usr/bin/python3",
				args = {
					"-m",
					"debugpy.adapter",
				},
			}
			require("mason-nvim-dap").default_setup(config) -- don't forget this!
		end,
	},
})
