return {
	"neovim/nvim-lspconfig",
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		local on_attach = function(_, bufnr)
			local opts = { buffer = bufnr, silent = true }
			local map = vim.keymap.set

			map("n", "K", vim.lsp.buf.hover, opts)
			map("n", "gd", vim.lsp.buf.definition, opts)
			map("n", "gr", vim.lsp.buf.references, opts)
			map("n", "<leader>rn", vim.lsp.buf.rename, opts)
			map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
			map("n", "<leader>f", function()
				vim.lsp.buf.format({ async = true })
			end, opts)
		end

		vim.lsp.config("*", {
			capabilities = capabilities,
			on_attach = on_attach,
		})

		vim.lsp.config("lua_ls", {
			cmd = { "lua-language-server" },
			filetypes = { "lua" },
			root_dir = vim.fs.dirname(vim.fs.find({ "init.lua", ".git" }, { upward = true })[1]),
			settings = {
				Lua = {
					diagnostics = { globals = { "vim" } },
					workspace = { library = vim.api.nvim_get_runtime_file("", true) },
					telemetry = { enable = false },
				},
			},
			on_attach = on_attach,
			capabilities = capabilities,
		})

		vim.lsp.config("typescript-language-server", {
			cmd = { "typescript-language-server", "--stdio" },
			filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
			root_dir = vim.fs.dirname(vim.fs.find({ "package.json", "tsconfig.json", ".git" },
				{ upward = true })[1]),
			on_attach = on_attach,
			capabilities = capabilities,
		})

		vim.lsp.config("pylsp", {
			cmd = { "pylsp" },
			filetypes = { "python" },
			root_dir = vim.fs.dirname(vim.fs.find({ "pyproject.toml", ".git" }, { upward = true })[1]),
			on_attach = on_attach,
			capabilities = capabilities,
		})

		vim.lsp.config("vscode-html-language-server", {
			cmd = { "vscode-html-languageserver", "--stdio" },
			filetypes = { "html" },
			root_dir = vim.fs.dirname(vim.fs.find({ "index.html", ".git" }, { upward = true })[1]),
			on_attach = on_attach,
			capabilities = capabilities,
		})

		vim.lsp.config("vscode-css-language-server", {
			cmd = { "vscode-css-languageserver", "--stdio" },
			filetypes = { "css", "scss", "less" },
			root_dir = vim.fs.dirname(vim.fs.find({ "package.json", ".git" }, { upward = true })[1]),
			on_attach = on_attach,
			capabilities = capabilities,
		})

		vim.lsp.config("solargraph", {
			cmd = { "solargraph", "stdio" },
			filetypes = { "ruby" },
			root_dir = vim.fs.dirname(vim.fs.find({ "Gemfile", ".git" }, { upward = true })[1]),
			settings = {
				solargraph = {
					diagnostics = true,
					formatting = true,
				},
			},
			on_attach = on_attach,
			capabilities = capabilities,
		})

		vim.lsp.enable({
			"lua_ls",
			"typescript-language-server",
			"pylsp",
			"vscode-html-language-server",
			"vscode-css-language-server",
			"solargraph",
		})
	end,
}
