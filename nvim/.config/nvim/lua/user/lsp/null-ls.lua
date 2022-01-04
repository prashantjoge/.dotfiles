local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end
-- use :Nulllsinfo to find what sources are being used for formatting, diagnostics etc 
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- completion sources
--local completions = null_ls.builtins.completion
-- local misspell = { null_ls.builtins.diagnostics.misspell }
-- local spell = { null_ls.builtins.completion.spell }
-- local dcodespell = { null_ls.builtins.diagnostics.codespell }
-- local fcodespell = { null_ls.builtins.formatting.codespell }
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
--local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
		formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
--		formatting.black.with({ extra_args = { "--fast" } }), --formatting for python
		formatting.stylua,
    
--		diagnostics.flake8  --for python
	},
})
