vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.relativenumber = true
opt.number = true

-- tabs / indentation
opt.tabstop = 8
opt.shiftwidth = 8
opt.expandtab = false
opt.autoindent = true
opt.smartindent = true
opt.copyindent = true
opt.preserveindent = true

opt.wrap = false

opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

opt.backspace = "indent,eol,start"

opt.clipboard:append("unnamedplus")

opt.splitright = true
opt.splitbelow = true

opt.foldmethod = "marker"
opt.foldmarker = "#pragma region,#pragma endregion"

vim.api.nvim_create_autocmd("FileType", {
	callback = function(args)
		local bo = vim.bo[args.buf]
		bo.autoindent = true
		bo.smartindent = true
		bo.copyindent = true
		bo.preserveindent = true
	end,
})

vim.filetype.add({
	extension = {
		gd = "gdscript",
		gdshader = "gdshader",
		gdshaderinc = "gdshaderinc",
		tres = "gdresource",
		tscn = "gdresource",
	},
	filename = {
		["project.godot"] = "godot",
	},
})

vim.diagnostic.config({
  virtual_text = true,
  float = {
    border = "rounded",
    source = "always",     
    header = "",
    prefix = "",
    max_width = 100,   
    wrap = true,
  },
})

-- vim.opt.guicursor = "a:ver50-blinkwait700-blinkoff400-blinkon250"
vim.opt.showtabline = 0

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.api.nvim_set_hl(0, "Visual", {
         bg = "#5c5a5a",
  	 fg = "#eeeeee",
  	 bold = true,    
 })
  end,
})
