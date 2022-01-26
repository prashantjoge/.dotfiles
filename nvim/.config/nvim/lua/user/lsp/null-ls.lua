local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end
-- use :Nulllsinfo to find what sources are being used for formatting, diagnostics etc
local actions = null_ls.builtins.code_actions

-- diagnostic sources
local diagnostics = null_ls.builtins.diagnostics

-- formatting sources
local formatting = null_ls.builtins.formatting

-- hover sources
local hover = null_ls.builtins.hover

-- completion sources
local completion = null_ls.builtins.completion
-- test
null_ls.setup({
	debug = false,
	sources = {
		actions.gitsigns,
		hover.dictionary,
		completion.spell,
		diagnostics.misspell,
		diagnostics.vale,
		diagnostics.luacheck,
		--cmd = { "misspell", "vale" },
		formatting.prettier.with({
			extra_filetypes = { "txt" },
			extra_args = {
				"--no-semi",
				"--single-quote",
				"--jsx-single-quote",
				"--print-width",
				--"--parser=markdown",
				--"--prose-wrap=always",
			},
		}),
		--		formatting.black.with({ extra_args = { "--fast" } }), --formatting for python
		formatting.stylua, -- for lua
		-- formatting.eslint, -- for javascript (linter)
		-- formatting.autopep8 -- for python
		-- diagnostics.flake8  --for python
		--diagnostics.write_good.with({ extra_filetypes = { "txt", "tex" } }),
		diagnostics.proselint.with({ extra_filetypes = { "txt" } }),
		actions.proselint.with({ extra_filetypes = { "txt", "wiki" } }),
		diagnostics.vale.with({
			extra_filetypes = { "txt", "text", "md", "wiki", "markdown" },
			extra_args = { "--config=/home/aaron/.config/vale/.vale.ini" },
		}),
	},
	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.cmd([[
            augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
            augroup END
            ]])
		end
	end,
})
