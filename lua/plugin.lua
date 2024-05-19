require("lazy").setup({
	"folke/lazy.nvim",
	-- file explorer
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		event = "UIEnter",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("plugin.nvim-tree")
		end,
	},
	-- buffer linz
	{
		"akinsho/bufferline.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"moll/vim-bbye",
		},
		event = "UIEnter",
		config = function()
			require("plugin.bufferline")
		end,
	},
	{
		"tpope/vim-surround",
	},
	-- 注释
	{
		"numToStr/Comment.nvim",
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		event = "VeryLazy",
		config = function()
			require("plugin.Comment")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		event = "VeryLazy",
		build = function()
			require("nvim-treesitter.install").update({ with_sync = true })()
		end,
		config = function()
			require("plugin.nvim-treesitter")
		end,
	},
	-- 主题插件
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("tokyonight-moon")
		end,
	},
	-- 状态行
	{
		"nvim-lualine/lualine.nvim",
		event = "UIEnter",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"f-person/git-blame.nvim",
			"jinzhongjia/LspUI.nvim",
		},
		config = function()
			require("plugin.lualine")
		end,
	},
	-- format
	{
		"stevearc/conform.nvim",
		event = "VeryLazy",
		enabled = true,
		config = function()
			require("plugin.conform")
		end,
	},
	-- windows
	{
		"anuvyklack/windows.nvim",
		event = "VeryLazy",
		enabled = true,
		dependencies = "anuvyklack/middleclass",
		config = function()
			require("plugin.windows")
		end,
	},
	-- lspui
	{
		"jinzhongjia/LspUI.nvim",
		config = function()
			require("plugin.LspUIconfig")
		end,
	},
	{
		"williamboman/mason.nvim",
		event = "VeryLazy",
		dependencies = {
			"neovim/nvim-lspconfig",
			"creativenull/efmls-configs-nvim",
			"williamboman/mason-lspconfig.nvim",
			"b0o/schemastore.nvim",
			"folke/neodev.nvim",
		},
		config = function()
			require("plugin.mason")
		end,
	},
	-- 缩进
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		event = "VeryLazy",
		config = function()
			require("plugin.indent-blankline")
		end,
	},
	{
		"neovim/nvim-lspconfig",
		event = "VeryLazy",
		dependencies = {
			"creativenull/efmls-configs-nvim",
			"b0o/schemastore.nvim",
			"folke/neodev.nvim",
		},
		config = function()
			require("plugin.lspconfig")
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			-- "hrsh7th/cmp-path",
			-- async path
			"FelipeLema/cmp-async-path",
			"lukas-reineke/cmp-rg",
			"hrsh7th/cmp-cmdline",
			--
			-- "L3MON4D3/LuaSnip",
			-- "saadparwaiz1/cmp_luasnip",
			"hrsh7th/vim-vsnip",
			"hrsh7th/cmp-vsnip",
			--- ui denpendences
			"onsails/lspkind-nvim",
			--- autopairs
			"windwp/nvim-autopairs",
			"rafamadriz/friendly-snippets",
		},
		event = "VeryLazy",
		config = function()
			require("plugin.cmp")
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			-- "nvim-telescope/telescope-dap.nvim",
			"debugloop/telescope-undo.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				enabled = not isNixos(),
				build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
			},
			"nvim-telescope/telescope-live-grep-args.nvim",
		},
		event = "VeryLazy",
		config = function()
			require("plugin.telescope")
		end,
	},
	-- terminal
	{
		"akinsho/toggleterm.nvim",
		event = "VeryLazy",
		config = function()
			require("plugin.toggleterm")
		end,
	},
	{
		"m-demare/hlargs.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		event = "VeryLazy",
		config = function()
			require("plugin.hlargs")
		end,
	},
	-- ufo fold
	{
		"kevinhwang91/nvim-ufo",
		dependencies = {
			"kevinhwang91/promise-async",
			{
				"luukvbaal/statuscol.nvim",
				config = function()
					local builtin = require("statuscol.builtin")
					require("statuscol").setup({
						relculright = true,
						segments = {
							{ text = { builtin.foldfunc }, click = "v:lua.ScFa" },
							{ text = { "%s" }, click = "v:lua.ScSa" },
							{ text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
						},
					})
				end,
			},
		},
		event = "VeryLazy",
		config = function()
			require("plugin.nvim-ufo")
		end,
	},
	-- trouble
	{
		"folke/trouble.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
	},
	-- winbar
	{
		"Bekaboo/dropbar.nvim",
		event = "VeryLazy",
		opts = {
			general = {
				update_events = {
					win = {
						"CursorHold",
						"CursorHoldI",
						"WinEnter",
						"WinResized",
					},
				},
			},
		},
		-- optional, but required for fuzzy finder support
		dependencies = {
			"nvim-telescope/telescope-fzf-native.nvim",
		},
	},
	-- indent
	{
		"nmac427/guess-indent.nvim",
		event = "VeryLazy",
		config = function()
			require("plugin.guess-indent")
		end,
	},
	{ "jeffkreeftmeijer/vim-numbertoggle", event = "VeryLazy" },
	{
		"tpope/vim-endwise",
		event = "VeryLazy",
	},
	{
		"nacro90/numb.nvim",
		evnet = "VeryLazy",
		config = true,
	},
	{
		"RRethy/vim-illuminate",
		event = "VeryLazy",
		config = function()
			require("illuminate").configure({
				filetypes_denylist = {
					"dirbuf",
					"dirvish",
					"fugitive",
					"NvimTree",
					"Outline",
					"LspUI-rename",
					"LspUI-diagnostic",
					"LspUI-code_action",
					"LspUI-definition",
					"LspUI-type_definition",
					"LspUI-declaration",
					"LspUI-reference",
					"LspUI-implementation",
					"mason",
					"floaterm",
				},
			})
		end,
	},
	{
		"skywind3000/asynctasks.vim",
		dependencies = {
			"skywind3000/asyncrun.vim",
		},
		event = "VeryLazy",
		config = function()
			vim.g.asyncrun_open = 6
		end,
	},
	{
		"mbbill/undotree",
		event = "VeryLazy",
	},
	{
		"tpope/vim-fugitive",
		dependencies = "rbong/vim-flog",
		event = "VeryLazy",
	},
	{
		"folke/twilight.nvim",
		event = "VeryLazy",
		opts = {},
	},
	{
		"folke/zen-mode.nvim",
		event = "VeryLazy",
		opts = {},
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		event = "VeryLazy",
		opts = {},
	},
	-- diffview
	{
		"sindrets/diffview.nvim",
		event = "VeryLazy",
		config = function()
			require("plugin.diffview")
		end,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = {
			"mfussenegger/nvim-dap",
			"williamboman/mason.nvim",
		},
		config = function()
			require("plugin/dap")
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
			"folke/neodev.nvim",
		},
		config = function()
			require("plugin/dapui")
		end,
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("plugin/dap-virtual-text")
		end,
	},
	{
		"AckslD/nvim-neoclip.lua",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			{ "kkharji/sqlite.lua", module = "sqlite" },
		},
		config = function()
			require("plugin/nvim-neoclip")
		end,
	},
})
