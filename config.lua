-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- optionとか

-- keymap
lvim.keys.normal_mode["<C-n>"] = ":NvimTreeToggle<CR>"
-- Tips: lunarvimのデフォルトは<gvらしい
lvim.keys.visual_mode["<"] = false

-- override
-- builtinで既存のプラグインの有効/無効、及びconfig内の調整ができる
-- activeで有効/向こうの切り替え、on_config_doneで追加の設定もしくは変更
lvim.builtin.bufferline.active = false
lvim.builtin.which_key.active = false
lvim.colorscheme = "lunar"
lvim.leader = "\\"
lvim.format_on_save.enabled = true

local builtin = require("telescope.builtin")
lvim.keys.normal_mode["<leader>ff"] = builtin.find_files
lvim.keys.normal_mode["<leader>fg"] = builtin.live_grep
lvim.keys.normal_mode["<leader>fb"] = builtin.buffers
lvim.keys.normal_mode["<leader>fh"] = builtin.help_tags

-- plugins
lvim.plugins = {
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"stylua",
				},
			})
		end,
	},
}
