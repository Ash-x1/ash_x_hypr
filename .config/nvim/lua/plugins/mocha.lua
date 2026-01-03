return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, 
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", 
        transparent_background = true, 
        term_colors = true,
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
          notify = true,
          mini = {
            enabled = true,
            indentscope_color = "",
          },
          
        },
      })

      
      vim.cmd.colorscheme "catppuccin"
    end,
  },
}
