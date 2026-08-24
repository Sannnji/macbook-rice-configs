return {
	{
		'nvim-telescope/telescope.nvim',
		version = '*',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'rcarriga/nvim-notify',
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
			'nvim-telescope/telescope-ui-select.nvim',
		},
		cmd = "Telescope",
		keys = {
			{ '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Find Files' },
			{ '<leader>fr', '<cmd>Telescope oldfiles<cr>',   desc = 'Open Recent' },
			{ '<leader>fw', '<cmd>Telescope live_grep<cr>',  desc = 'Find word' }
		},
		ft = 'mason',
		config = function()
			local telescope = require("telescope")
			telescope.setup({
				extensions = {
					['ui-select'] = {
						require('telescope.themes').get_dropdown({
							-- more options go here if needed
						})
					}
				}
			})

			-- Sorting extension
			telescope.load_extension("fzf")

			-- Notification history extension
			telescope.load_extension("notify")
			telescope.load_extension("ui-select")
		end,
	},
}
