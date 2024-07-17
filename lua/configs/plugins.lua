local fn = vim.fn

-- Automatically install packer {{{
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end
-- }}}

-- Autocommand that reloads neovim whenever you save the plugins.lua file {{{
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])
-- }}}

-- Use a protected call so we don't error out on first use {{{
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end
-- }}}

-- Have packer use a popup window {{{
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})
-- }}}

-- Install your plugins here {{{
return packer.startup(function(use)
  use { "wbthomason/packer.nvim", commit = "6afb67460283f0e990d35d229fd38fdc04063e0a" } -- Have packer manage itself
  use { "nvim-lua/plenary.nvim", commit = "4b7e52044bbb84242158d977a50c4cbcd85070c7" } -- Useful lua functions used by lots of plugins
  use { "windwp/nvim-autopairs", commit = "03580d758231956d33c8dd91e2be195106a79fa4" } -- Autopairs, integrates with both cmp and treesitter
  use { "numToStr/Comment.nvim", commit = "45dc21a71ad1450606f5e98261badb28db59d74c" }
  use { "JoosepAlviste/nvim-ts-context-commentstring", commit = "32d9627123321db65a4f158b72b757bcaef1a3f4" }
  use { "kyazdani42/nvim-web-devicons", commit = "563f3635c2d8a7be7933b9e547f7c178ba0d4352" }
  use { "kyazdani42/nvim-tree.lua", commit = "7282f7de8aedf861fe0162a559fc2b214383c51c" }
  use { "akinsho/bufferline.nvim", commit = "c7492a76ce8218e3335f027af44930576b561013" }
	use { "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" }
  use { "nvim-lualine/lualine.nvim", commit = "a52f078026b27694d2290e34efa61a6e4a690621" }
  use { "akinsho/toggleterm.nvim", commit = "2a787c426ef00cb3488c11b14f5dcf892bbd0bda" }
  use { "ahmedkhalf/project.nvim", commit = "628de7e433dd503e782831fe150bb750e56e55d6" }
  use { "lewis6991/impatient.nvim", commit = "b842e16ecc1a700f62adb9802f8355b99b52a5a6" }
  use { "lukas-reineke/indent-blankline.nvim", commit = "db7cbcb40cc00fc5d6074d7569fb37197705e7f6" }
  use { "goolord/alpha-nvim", commit = "0bb6fc0646bcd1cdb4639737a1cee8d6e08bcc31" }
	use {"folke/which-key.nvim"}
  use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
  })
  --}}

	-- Colorschemes {{{
  use { "folke/tokyonight.nvim", commit = "66bfc2e8f754869c7b651f3f47a2ee56ae557764" }
  use { "lunarvim/darkplus.nvim", commit = "13ef9daad28d3cf6c5e793acfc16ddbf456e1c83" }
  use {  "olimorris/onedarkpro.nvim", commit = "7a7641e27f922496b4bf8493acd9f2f8da7ff864" }
  use {  "ful1e5/onedark.nvim", commit = "b5161f0c631571640485be5d1c059cab82c86872" }
  use { 'rose-pine/neovim', as = 'rose-pine' }
  use { "craftzdog/solarized-osaka.nvim", lazy = false, priority = 1000, opts = {}, }

  -- }}}

	-- Cmp  {{{
  use { "hrsh7th/nvim-cmp", commit = "d09b0c396aaa078cdfe78316ec06940971136e85" } -- The completion plugin
  use { "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" } -- buffer completions
  use { "hrsh7th/cmp-path", commit = "91ff86cd9c29299a64f968ebb45846c485725f23" } -- path completions
	use { "saadparwaiz1/cmp_luasnip", commit = "18095520391186d634a0045dacaa346291096566" } -- snippet completions
	use { "hrsh7th/cmp-nvim-lsp", commit = "59224771f91b86d1de12570b4070fe4ad7cd1eeb" }
	use { "hrsh7th/cmp-nvim-lua", commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21" }
  -- }}}

	-- Snippets {{{
  use { "L3MON4D3/LuaSnip", commit = "5570fd797eae0790affb54ea669a150cad76db5d" } --snippet engine
  use { "rafamadriz/friendly-snippets", commit = "1a6a02350568d6830bcfa167c72f9b6e75e454ae" } -- a bunch of snippets to use
  -- }}}

	-- LSP {{{
	use { "neovim/nvim-lspconfig", commit = "42ca8ce0f2252be795da4789fadfa91f6c3f7464" } -- enable LSP
  use { "williamboman/mason.nvim", commit = "2004a4a2fdfc1c8f0ce90ad237ca173b7d1d22e0"} -- simple to use language server installer
  use { "williamboman/mason-lspconfig.nvim", commit = "31d8ed0dd3daf6cc64e35d710a190b64080bdc86" }
	use { "jose-elias-alvarez/null-ls.nvim", commit = "b26851b3e7ac1c0c85666f8a74e36aef2acb89c6" } -- for formatters and linters
  use { "RRethy/vim-illuminate", commit = "a6d0b28ea7d6b9d139374be1f94a16bd120fcda3" }
  -- }}}

	-- Telescope {{{
  use { "nvim-telescope/telescope.nvim", tag = "0.1.5", requires = { {"nvim-lua/plenary.nvim"} } }
  -- }}}

	-- Treesitter {{{
	use {
		"nvim-treesitter/nvim-treesitter",
    commit = "7eb5f1a2e3949496f26c4084b521b30f2d08137a",
    -- tag = "v0.8.0",
    run = "TSUpdate",
	}
  -- }}}

	-- Git
	use { "lewis6991/gitsigns.nvim", commit = "2ab3bdf0a40bab53033048c6be75bda86316b55d" }
  -- }}}

  -- TS Errors {{{
  use {"OlegGulevskyy/better-ts-errors.nvim" }
  -- }}}

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
