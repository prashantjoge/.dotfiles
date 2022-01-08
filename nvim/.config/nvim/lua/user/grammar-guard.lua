local status_ok, grammar_guard = pcall(require, "grammar_guard")
if not status_ok then
	return
end

grammar_guard.setup({
	settings = {
		ltex = {
			enabled = { "latex", "txt", "tex", "bib", "markdown", "text" },
			language = "en",
			diagnosticSeverity = "information",
			setenceCacheSize = 2000,
			additionalRules = {
				enablePickyRules = true,
				motherTongue = "en",
			},
			trace = { server = "verbose" },
			dictionary = {},
			disabledRules = {},
			hiddenFalsePositives = {},
		},
	},
})
