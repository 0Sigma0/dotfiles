local ensure = function()
	local fn = vim.fn
	local pack_path = fn.stdpath("data") .. "site/pack"
	if fn.empty(fn.glob(pack_path)) > 0 then
		fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", pack_path})
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure()

vim.g.mapleader		 = " "
vim.o.number		 = true
vim.o.relativenumber = true
vim.o.tabstop		 = 4
vim.o.softtabstop	 = 4
vim.o.shiftwidth	 = 4
vim.o.cursorline	 = true
vim.o.termguicolors	 = true
vim.o.expandtab		 = true
vim.o.hidden		 = true
vim.o.smartindent	 = true
vim.o.clipboard      = unnamedplus
vim.o.doMatchParen   = true 

require("packer").startup(function()
	use "wbthomason/packer.nvim"
    use "nvim-treesitter/nvim-treesitter"
    use "windwp/nvim-autopairs"
    use "RRethy/nvim-base16"
    use "preservim/nerdtree"
    use {"nvim-lualine/lualine.nvim", requires = {'kyazdani42/nvim-web-devicons', opt = true}}
end)

vim.cmd "color base16-nord"

require("nvim-autopairs").setup{}
require("lualine").setup{
    options = {
        theme = "powerline_dark"
    }
}
