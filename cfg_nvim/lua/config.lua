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

-- Colors
vim.cmd("highlight Search ctermbg=LightRed ctermfg=Black")

-- Highlight trailing white space
vim.cmd("highlight WhiteSpaceEOL ctermbg=darkgreen guibg=lightgreen")
vim.cmd("match WhiteSpaceEOL /\\s\\+$/")
vim.cmd("autocmd WinEnter * match WhiteSpaceEOL /\\s\\+$/")
