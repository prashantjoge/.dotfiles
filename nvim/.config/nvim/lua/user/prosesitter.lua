require("telescope").load_extension("prosesitter") -- Optionally, depends on telescope.nvim
require("prosesitter"):setup({
	vale_bin = vim.fn.stdpath("data") .. "/user/bin/vale",
	vale_cfg = vim.fn.stdpath("data") .. "$HOME/.config/vale/.vale.ini",
	--optional extra queries overrides existing queries
	queries = {
		-- see the piece on adding queries on how to use this
		-- (not needed if using an out of the box supported language
		py = {
			strings = "[(string) ] @capture",
			comments = "[(comment)+ ] @capture",
		},
	},
	-- highlight groups to use for lint errors, warnings and suggestions
	severity_to_hl = { error = "SpellBad", warning = "SpellRare", suggestion = "SpellCap" },
	-- weather to lint strings, comments or both for a language
	lint_targets = { py = "both", tex = "strings", sh = "comments" },
	disabled_ext = { "tex" }, -- do not ever lint tex files
	auto_enable = false, -- do not start linting files on open (default = true)
	default_cmds = false, -- do not add commands (default = true)
})
