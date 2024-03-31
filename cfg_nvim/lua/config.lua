-- General configuration options
vim.opt.compatible = false

-- Mouse Support
vim.opt.mouse = "v"
vim.opt.mouse = "a"

-- Tabs
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4

-- Intenting
vim.opt.smartindent = true

-- Search
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Display
vim.opt.number = true
vim.opt.cc = "80"
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 8

-- Undo
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Colors
vim.opt.termguicolors = true
vim.opt.background = "light"
vim.cmd("highlight Search ctermbg=lightyellow ctermfg=darkred")
vim.cmd("highlight ColorColumn ctermbg=lightgrey guibg=lightgrey")

-- Highlight trailing white space
vim.cmd("highlight WhiteSpaceEOL ctermbg=darkgreen guibg=lightgreen")
vim.cmd("match WhiteSpaceEOL /\\s\\+$/")
vim.cmd("autocmd WinEnter * match WhiteSpaceEOL /\\s\\+$/")
