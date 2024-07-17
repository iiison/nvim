local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap comma as leader key
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Navigate buffers {{{
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
-- }}}

-- Move text up and down {{{
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)
-- }}}

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
-- }}}

-- Open Explore {{{
keymap("n", "<leader>,", ":Explore<CR>", opts)
keymap("v", "<leader>,", ":Explore<CR>", opts)
-- }}}

-- Save Changes {{{
keymap("n", "<leader>k", ":w<CR>", opts)
keymap("v", "<leader>k", ":w<CR>", opts)
-- }}}

-- Quit Vim {{{
keymap("n", "<leader>n", ":q<CR>", opts)
keymap("v", "<leader>n", ":q<CR>", opts)
keymap("n", "<leader>q", ":q!<CR>", opts)
keymap("v", "<leader>q", ":q!<CR>", opts)
-- }}}

-- Close Buffer {{{
keymap("n", "<leader>n", ":BD<CR>", opts)
keymap("v", "<leader>n", ":BD<CR>", opts)
-- }}}

-- Open/Close Folds{{{
keymap("n", "<leader>+", "zo", opts)
keymap("n", "<leader>-", "zc", opts)
keymap("n", "<leader>%", "zr", opts)
-- }}}

-- Reselect block after indentation {{{
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
-- }}}

-- Clear Search highlight {{{
keymap("n", "<Esc>", ":nohlsearch<CR><Esc>", opts)
-- }}}

-- Better n/N behavious in search {{{
keymap("n", "<expr>n", "'Nn'[v:searchforward]", opts)
keymap("n", "<expr>N", "'nN'[v:searchforward]", opts)
-- }}}

-- Command-line history {{{
keymap("c", "<C-N>", "<Down>", opts)
keymap("c", "<C-P>", "<Up>", opts)
-- }}}

-- LSP format {{{
keymap("n", "<leader>.", ":Format", opts)
-- }}}

