require('functions')

local settings = {
  -- basic stuff {{{
  encoding = "utf-8",
  clipboard = "unnamedplus",
  errorbells = true,
  diffopt = "internal,filler,closeoff,vertical",
  hidden = true,
  inccommand = "nosplit",
  keymodel = "startsel,stopsel",
  mousemodel = "popup",
  ruler = true,
  scrolloff = 3,
  showcmd = true,
  startofline = false,
  viewoptions = "folds,options,cursor,unix,slash",
  whichwrap = "b,s,<,>,[,]",
  completeopt = { "menuone", "noselect" },
  pumheight = 10,
  showtabline=2,
  -- }}}

  -- Indentation {{{
  showbreak = "↪ ",
  breakindent = true,
  smartindent = true,
  conceallevel = 0,
  -- }}}

  -- Spaces, no tabs {{{
  expandtab = true,
  shiftround = true,
  shiftwidth = 2,
  softtabstop = 2,
  tabstop = 2,
  -- }}}

  -- Searching {{{
  smartcase = true,
  -- }}}

  -- Persistent undo {{{
  undofile = true,
  undodir  = "~/.config/nvim/.cache/undo",
  -- }}}

  -- Backups & swap{{{
  backup = true,
  backupcopy = "yes",
  backupdir = "~/tmp",
  directory = "~/.config/nvim/.cache/swap/",
  -- }}}

  -- Wildignore {{{
  wildignore = "*.o,*.obj,*.exe,*.so,*.dll,.git/*,.bzr/*,.hg/*,.svn/*,.DS_Store,__MACOSX/*,Thumbs.db,.sass-cache/*,.cache/*,.tmp/*,*.scssc,node_modules/*,jspm_modules/*,bower_components/*",
  -- }}}

  -- Mouse & Cursor & lines {{{
  mouse = "a",
  cursorcolumn = false,
  cursorline = false,
  number = true,
  showmatch = true,
  -- }}}

  -- Split behaviour {{{
  splitbelow = true,
  splitright = true,
  -- }}}
}

for key, value in pairs(settings) do
  vim.opt[key] = value
end

-- Make sure undo & swap dirs are present {{{
ensureDirExists('~/.config/nvim/.cache')
ensureDirExists(undodir)
ensureDirExists(backupdir)
ensureDirExists(directory)
-- }}}

-- Misc {{{
vim.cmd("let $NVIM_TUI_ENABLE_TRUE_COLOR=1")

if (TERMINOLOGY ~= 1) then
  vim.opt.termguicolors = true
end

if (vim.fn.has("termguicolors")) then
  vim.opt.termguicolors = true
end
-- }}}
