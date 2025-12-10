-- ~/.config/nvim/lua/plugins/alpha.lua
return {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        -- ASCII art header (spells "ASH")
        dashboard.section.header.val = {
            " █████╗ ███████╗██╗  ██╗",
            "██╔══██╗██╔════╝██║  ██║",
            "███████║███████╗███████║",
            "██╔══██║╚════██║██╔══██║",
            "██║  ██║███████║██║  ██║",
            "╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝",
            "",
            "⚡ Welcome back, Ash ⚡",
        }

        -- Main menu buttons
        dashboard.section.buttons.val = {
            dashboard.button("e", "  New File", ":enew<CR>"),
            dashboard.button("f", "  Find File", ":Telescope find_files<CR>"),
            dashboard.button("r", "  Recent Files", ":Telescope oldfiles<CR>"),
            dashboard.button("p", "  Open Project", ":Telescope projects<CR>"),
            dashboard.button("u", "  Update Plugins", ":Lazy sync<CR>"),
            dashboard.button("q", "󰗼  Quit", ":qa<CR>"),
        }

        -- Dynamic footer showing date, Neovim version, and plugin count
        local function footer()
            local total_plugins = #vim.tbl_keys(packer_plugins or {})
            
            local datetime = os.date(" %d-%m-%Y   %I:%M %p") 
            
            local version = vim.version()
            local nvim_version = " v" .. version.major .. "." .. version.minor .. "." .. version.patch
            
            return string.format(" %s  •  %s  •  %s plugins", datetime, nvim_version, total_plugins)
        end

        dashboard.section.footer.val = footer()

        -- Final layout setup
        dashboard.opts.opts.noautocmd = true
        alpha.setup(dashboard.opts)
    end,
}
