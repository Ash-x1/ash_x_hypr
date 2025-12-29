return {
	{
		"base16-project/base16-vim",
		lazy = false,
		priority = 1000, -- لضمان تحميله قبل باقي الإضافات
		config = function()
			vim.cmd('colorscheme base16-black-metal-venom')
		end
	}
}
